
require("scripts/globals/common");
require("scripts/globals/status");

SUMMONING_MAGIC_SKILL = 38

MSG_NONE = 0; -- display nothing
MSG_NO_EFFECT = 189;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;

function AvatarPhysicalMove(avatar,target,skill,numberofhits,accmod,dmgmod1,dmgmodsubsequent, strRatio)
    returninfo = {};

    local master = avatar:getMaster();
    local dSTR = avatar:getStat(MOD_STR) + master:getMod(MOD_CHR) - target:getStat(MOD_VIT);

    local lvldiff = avatar:getMainLvl() - target:getMainLvl();
    local accDiff = (avatar:getACC() + master:getMod(MOD_SUMMONING) - target:getEVA());

    local ratio = (avatar:getStat(MOD_ATT) + master:getMod(MOD_SUMMONING))/target:getStat(MOD_DEF);

    --work out hit rate for mobs (bias towards them)
    local hitrate = utils.clamp((75 + accDiff / 2 + lvldiff * 2) * accmod, 20, 95)

    local hitdamage = avatar:getWeaponDmg() + dSTR * strRatio +  dmgmod1;
    local subsequenthitdamage = avatar:getWeaponDmg() / 2 + dSTR * strRatio + dmgmodsubsequent;
    printf("Hitrate: %f, damage: %f, ratio: %f", hitrate, hitdamage, ratio)

--    if (ratio<=1) then
--        maxRatio = 1;
--        minRatio = 1/3;
--    elseif (ratio<1.6) then
--        maxRatio = ((4/6) * ratio) + (2/6);
--        minRatio = ((7/9) * ratio) - (4/9);
--    elseif (ratio<=1.8) then
--        maxRatio = 1.8;
--        minRatio = 1;
--    elseif (ratio<3.6) then
--        maxRatio = (2.4 * ratio) - 2.52;
--        minRatio = ((5/3) * ratio) - 2;
--    else
--        maxRatio = 4.2;
--        minRatio = 4;
--    end

    --Applying pDIF
    local pdif = 0;

    -- start the hits
    local finaldmg = 0;
    local hitsdone = 1; local hitslanded = 0;

    --add on native crit hit rate (guesstimated, it actually follows an exponential curve)
    nativecrit = (avatar:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; --assumes +0.5% crit rate per 1 dDEX
    nativecrit = nativecrit + (avatar:getMod(MOD_CRITHITRATE)/100);

    if (nativecrit > 0.2) then --caps!
        nativecrit = 0.2;
    elseif (nativecrit < 0.05) then
        nativecrit = 0.05;
    end

    local critchance = math.random();
    local crit = false;
    if critchance <= nativecrit then
        crit = true;
    end


    if crit == true or math.random(0, 100) <= hitrate then
        pdif = math.random((ratio * 900), (ratio * 1100));
        pdif = pdif/1000;
        if crit == true then
            pdif = pdif + 1;
            if pdif > 4.2 then
                pdif = 4.2
            end
        end
        finaldmg = finaldmg + hitdamage * pdif;
        hitslanded = hitslanded + 1;
    end
    while (hitsdone < numberofhits) do
        if (math.random(0, 100) <= hitrate) then
            pdif = math.random((ratio * 900), (ratio * 1100));
            pdif = pdif/1000;
            finaldmg = finaldmg + subsequenthitdamage * pdif;
            hitslanded = hitslanded + 1;
        end
        hitsdone = hitsdone + 1;
    end

    -- all hits missed
    if (hitslanded == 0 or finaldmg == 0) then
        finaldmg = 0;
        hitslanded = 0;
        skill:setMsg(MSG_MISS);
    end

    if finaldmg > 0 then
        target:wakeUp()
    end

    returninfo.dmg = finaldmg;
    returninfo.hitslanded = hitslanded;

    return returninfo;
end;

--Given the attacker's str and the mob's vit, fSTR is calculated
function avatarFSTR(atk_str,def_vit)
    local dSTR = atk_str - def_vit;
    if (dSTR >= 12) then
        fSTR2 = ((dSTR+4)/2);
    elseif (dSTR >= 6) then
        fSTR2 = ((dSTR+6)/2);
    elseif (dSTR >= 1) then
        fSTR2 = ((dSTR+7)/2);
    elseif (dSTR >= -2) then
        fSTR2 = ((dSTR+8)/2);
    elseif (dSTR >= -7) then
        fSTR2 = ((dSTR+9)/2);
    elseif (dSTR >= -15) then
        fSTR2 = ((dSTR+10)/2);
    elseif (dSTR >= -21) then
        fSTR2 = ((dSTR+12)/2);
    else
        fSTR2 = ((dSTR+13)/2);
    end
    --Apply fSTR caps.
    if (fSTR2< -1) then
        fSTR2 = -1;
    elseif (fSTR2>8) then
        fSTR2 = 8;
    end
    return fSTR2;
end;

function AvatarFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

    -- physical attack missed, skip rest
    if (skilltype == MOBSKILL_PHYSICAL and dmg == 0) then
        return 0;
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(MSG_DAMAGE);

    --Handle shadows depending on shadow behaviour / skilltype
    if (shadowbehav < 5 and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.
        targShadows = target:getMod(MOD_UTSUSEMI);
        shadowType = MOD_UTSUSEMI;
        if (targShadows==0) then --try blink, as utsusemi always overwrites blink this is okay
            targShadows = target:getMod(MOD_BLINK);
            shadowType = MOD_BLINK;
        end

        if (targShadows>0) then
        --Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!
            if (targShadows >= shadowbehav) then --no damage, just suck the shadows
                skill:setMsg(31);
                target:setMod(shadowType,(targShadows-shadowbehav));
                if (shadowType == MOD_UTSUSEMI) then --update icon
                    effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
                    if (effect ~= nil) then
                        if ((targShadows-shadowbehav) == 0) then
                            target:delStatusEffect(EFFECT_COPY_IMAGE);
                            target:delStatusEffect(EFFECT_BLINK);
                        elseif ((targShadows-shadowbehav) == 1) then
                            effect:setIcon(EFFECT_COPY_IMAGE);
                        elseif ((targShadows-shadowbehav) == 2) then
                            effect:setIcon(EFFECT_COPY_IMAGE_2);
                        elseif ((targShadows-shadowbehav) == 3) then
                            effect:setIcon(EFFECT_COPY_IMAGE_3);
                        end
                    end
                end
                return shadowbehav;
            else --less shadows than this move will take, remove all and factor damage down
                dmg = dmg * ((shadowbehav-targShadows)/shadowbehav);
                target:setMod(MOD_UTSUSEMI,0);
                target:setMod(MOD_BLINK,0);
                target:delStatusEffect(EFFECT_COPY_IMAGE);
                target:delStatusEffect(EFFECT_BLINK);
            end
        end
    elseif (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
        target:setMod(MOD_UTSUSEMI,0);
        target:setMod(MOD_BLINK,0);
        target:delStatusEffect(EFFECT_COPY_IMAGE);
        target:delStatusEffect(EFFECT_BLINK);
    end

    --handle Third Eye using shadowbehav as a guide
    teye = target:getStatusEffect(EFFECT_THIRD_EYE);
    if (teye ~= nil and skilltype==MOBSKILL_PHYSICAL) then --T.Eye only procs when active with PHYSICAL stuff
        if (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --e.g. aoe moves
            target:delStatusEffect(EFFECT_THIRD_EYE);
        elseif (shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --it can be absorbed by shadows
            --third eye doesnt care how many shadows, so attempt to anticipate, but reduce
            --chance of anticipate based on previous successful anticipates.
            prevAnt = teye:getPower();
            if (prevAnt == 0) then
                --100% proc
                teye:setPower(1);
                skill:setMsg(30);
                return 0;
            end
            if ( (math.random()*100) < (80-(prevAnt*10)) ) then
                --anticipated!
                teye:setPower(prevAnt+1);
                skill:setMsg(30);
                return 0;
            end
            target:delStatusEffect(EFFECT_THIRD_EYE);
        end
    end


    --TODO: Handle anything else (e.g. if you have Magic Shield and its a Magic skill, then do 0 damage.


    if (skilltype == MOBSKILL_PHYSICAL and target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD)) then
        return 0;
    end

    if (skilltype == MOBSKILL_RANGED and target:hasStatusEffect(EFFECT_ARROW_SHIELD)) then
        return 0;
    end

    -- handle elemental resistence
    if (skilltype == MOBSKILL_MAGICAL and target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
        return 0;
    end

    --handling phalanx
    dmg = dmg - target:getMod(MOD_PHALANX);
    if (dmg<0) then
        return 0;
    end

    --handle invincible
    if (target:hasStatusEffect(EFFECT_INVINCIBLE) and skilltype==MOBSKILL_PHYSICAL) then
        return 0;
    end
    --handle pd
    if ((target:hasStatusEffect(EFFECT_PERFECT_DODGE) or target:hasStatusEffect(EFFECT_ALL_MISS) )
            and skilltype==MOBSKILL_PHYSICAL) then
        return 0;
    end

    --handling stoneskin
    skin = target:getMod(MOD_STONESKIN);
    if (skin>0) then
        if (skin >= dmg) then --absorb all damage
            target:delMod(MOD_STONESKIN,dmg);
            if (target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
            return 0;
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
            return dmg - skin;
        end
    end

    return dmg;
end;

-- returns true if mob attack hit
-- used to stop tp move status effects
function AvatarPhysicalHit(skill, dmg)
    -- if message is not the default. Then there was a miss, shadow taken etc
    return skill:getMsg() == MSG_DAMAGE;
end;

function avatarFTP(tp,ftp1,ftp2,ftp3)
    if (tp < 1000) then
        tp = 1000;
    end
    if (tp >= 1000 and tp < 2000) then
        return ftp1 + ( ((ftp2-ftp1)/100) * (tp-1000));
    elseif (tp >= 2000 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/100) * (tp-2000));
    end
    return 1; -- no ftp mod
end;

--------
--  Checks if the summoner is in a Trial Size Avatar Mini Fight (used to restrict summoning while in bcnm)
--------
function avatarMiniFightCheck(caster)
   local result = 0;
   local bcnmid;
   if (caster:hasStatusEffect(EFFECT_BATTLEFIELD) == true) then
      bcnmid = caster:getStatusEffect(EFFECT_BATTLEFIELD):getPower();
      if (bcnmid == 418 or bcnmid == 609 or bcnmid == 450 or bcnmid == 482 or bcnmid == 545 or bcnmid == 578) then -- Mini Avatar Fights
         result = 40; -- Cannot use <spell> in this area.
      end
   end
   return result;
end;


function doSiphonBuff(caster, pet)
    if (caster:getLocalVar("siphoned") == 0) then return end;

    caster:setLocalVar("siphoned", 0);
    local siphonTP = caster:getLocalVar("siphonTP");
    local siphonPet = caster:getLocalVar("siphonID");
    local level = pet:getMainLvl();

    pet:addTP(siphonTP);

    if (siphonPet >= 0 and siphonPet <= 7) then
        pet:addMod(MOD_MATT, 15);
        pet:addMod(MOD_MACC, 15);
        pet:addMod(MOD_MDEF, 25);
        pet:addMod(siphonPet + 54, 100);
        pet:addMod(siphonPet + 15, 35);
        local statBonus = siphonPet + 8
        if (statBonus == 15) then statBonus = 14 end;
        pet:addMod(statBonus, 5 + level / 5);

    elseif (siphonPet == 8) then
        pet:addMod(MOD_REGEN, 1 + level / 3);
    elseif (siphonPet == 9) then
        pet:addMod(MOD_ENMITY, -25);
        pet:addMod(MOD_STORETP, 25);
        pet:addMod(MOD_SUBTLE_BLOW, 50);
    elseif (siphonPet == 10) then
        pet:addMod(MOD_DOUBLE_ATTACK, 35);
    elseif (siphonPet == 11) then
        local stonePower = 50 + pet:getMainLvl() * 10;
        pet:addStatusEffect(EFFECT_STONESKIN, stonePower, 0, 300000);
        pet:addMod(MOD_ENMITY, 25);
        pet:addMod(MOD_DEFP, 20);
    elseif (siphonPet == 12) then
        local spikePower = 5 + pet:getMainLvl() / 2;
        pet:addMod(MOD_MDEF, 30);
        pet:addMod(MOD_SPIKES, 9);
        pet:addMod(MOD_SPIKES_DMG, spikePower);
    elseif (siphonPet == 13) then
        pet:addMod(MOD_EVASION, 40);
        pet:addMod(MOD_HASTE_ABILITY, 100);
    elseif (siphonPet == 14) then
        pet:addMod(MOD_MATT, 25);
        pet:addMod(MOD_MACC, 25);
    elseif (siphonPet == 15) then
        pet:addMod(MOD_ACC, 15);
        pet:addMod(MOD_CRITHITRATE, 10);
    elseif (siphonPet == 16) then
        pet:addMod(MOD_ATTP, 10);
    end

    caster:setLocalVar("siphonTP", 0);
    caster:setLocalVar("siphonID", 0);

end


function summonSpirit(caster, petType)
    local enspellTypes = {EFFECT_ENFIRE, EFFECT_ENBLIZZARD, EFFECT_ENAERO, EFFECT_ENSTONE, EFFECT_ENTHUNDER,
                            EFFECT_ENWATER, EFFECT_ENLIGHT, EFFECT_ENDARK};
    caster:spawnPet(petType);
    if (caster:isPC()) then
        local pet = caster:getPet();
        if (pet ~= nil) then
            local power = 1 + pet:getMainLvl() / 2;
--            pet:addStatusEffect(enspellTypes[petType + 1],power,0,3000);

            for i,v in pairs({8, 9, 10, 11, 12, 13, 14, 15, 16}) do
                caster:setVar("avatar_" .. v, utils.clamp(caster:getVar("avatar_" .. v) + 3, 0, 100));
            end

            local degen = utils.clamp(pet:getMaxHP() * 0.025, 1, 1000);
            pet:addMod(MOD_REGEN_DOWN, degen);
            pet:addMod(MOD_ATTP, -99);
            pet:addMod(MOD_STR, -50);
--            pet:addMod(MOD_HASTE_MAGIC, -200);
            pet:addMod(MOD_FASTCAST, -50);
            pet:addMod(MOD_MDEF, 35);
            pet:addMod(MOD_MATT, -60);
            pet:addMod(MOD_MACC, 30);
            caster:delMP(5 + pet:getMainLvl() * 3);
        end
    end

end

function summonAvatar(caster)

    if (caster:isPC()) then
        local pet = caster:getPet()
        if (pet ~= nil) then
            local curHP = caster:getVar("avatar_" .. caster:getPetID())
            pet:delHP(((100 - curHP) / 100.0) * pet:getMaxHP())

--            local degen = utils.clamp(pet:getMaxHP() * 0.015, 1, 200);
--            pet:addMod(MOD_REGEN_DOWN, degen);
--            pet:addMod(MOD_CURE_POTENCY_RCVD, -80);
            caster:delMP(1 + pet:getMainLvl() * 0.5);
        end
    end

end

function healingBreathCalc(pet, target, skill, action, tier)
    local master = pet:getMaster()
    local deep = 1;
    if (pet:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) == true) then
        deep = 1 + (50 + (master:getMerit(MERIT_DEEP_BREATHING))*5) / 100;
        pet:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
    end

    local gear = master:getMod(MOD_WYVERN_BREATH); -- Master gear that enhances breath
    local tpBonus = 1 + (pet:getTP() / 3000);
    pet:setTP(0)

    local base = (tier * 40) + pet:getHP() * (0.08 + tier / 20);
    base = base * deep * tpBonus * (1 + gear / 100);
    if (target:getHP() + base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP();
    end

    skill:setMsg(MSGBASIC_USES_RECOVERS_HP);
    target:addHP(base);
    return base;
end


function summonCheck(caster, target, spell)
    if (not caster:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif (caster:hasPet()) then
        return MSGBASIC_ALREADY_HAS_A_PET;
    elseif (caster:getMP() < 10 + caster:getMainLvl() * 4) then
        return MSGBASIC_NOT_ENOUGH_MP;
    else
        return 0;
    end
end

function summonCost(caster, pet)
    local cost = 10 + caster:getMainLvl() * 4;
    pet:setLocalVar("mpSpent", cost);
    caster:delMP(cost);
end

function doAllyCost(player, amount, type)
    if (player:getGil() >= amount) then
        player:delGil(amount);
        return true;
    else
        return false;
    end

end

function summoningDamageBonus(summoner, base, multiplier, cap, offset)
    if (offset == nil) then offset = 0 end;
    local skill = summoner:getSkillLevel(SKILL_SUM) + summoner:getMod(MOD_SUMMONING) - offset
    return utils.clamp(base + skill * multiplier, 0, cap)
end

function doAllyBuff(player, ally, rank)
    if (rank > 0) then
        local bonus = math.floor(rank / 2);
        ally:addMod(MOD_DEF, bonus * 4);
        ally:addMod(MOD_ATT, bonus * 4);
        ally:addMod(MOD_EVA, bonus * 2);
        ally:addMod(MOD_MEVA, bonus * 2);
        ally:addMod(MOD_ACC, bonus * 2);
        ally:addMod(MOD_MATT, bonus * 2);
        ally:addMod(MOD_MACC, bonus * 2);
        ally:addMod(MOD_HP, bonus * 10);
        if (ally:getMaxMP() > 0) then
            ally:addMod(MOD_MP, bonus * 5);
        end
    end
end
