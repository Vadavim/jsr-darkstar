require("scripts/globals/status")
require("scripts/globals/magic")

BLUE_SKILL = 43;

-- The type of spell.
SPELLTYPE_PHYSICAL = 0;
SPELLTYPE_MAGICAL = 1;
SPELLTYPE_RANGED = 2;
SPELLTYPE_BREATH = 3;
SPELLTYPE_DRAIN = 4;
SPELLTYPE_SPECIAL = 5;

-- The TP modifier
TPMOD_NONE = 0;
TPMOD_CRITICAL = 1;
TPMOD_DAMAGE = 2;
TPMOD_ACC = 3;
TPMOD_ATTACK = 4;

-- The damage type for the spell
DMGTYPE_BLUNT = 0;
DMGTYPE_PIERCE = 1;
DMGTYPE_SLASH = 2;
DMGTYPE_H2H = 3;

-- The SC the spell makes
SC_IMPACTION = 0;
SC_TRANSFIXION = 1;
SC_DETONATION = 2;
SC_REVERBERATION = 3;
SC_SCISSION = 4;
SC_INDURATION = 5;
SC_LIQUEFACTION = 6;
SC_COMPRESSION = 7;

SC_FUSION = 8;
SC_FRAGMENTATION = 9;
SC_DISTORTION = 10;
SC_GRAVITATION = 11;

SC_DARK = 12;
SC_LIGHT = 13;

INT_BASED = 1;
CHR_BASED = 2;
MND_BASED = 3;
VIT_BASED = 4;

local strongSystem = {
    [SYSTEM_PLANTOID] = SYSTEM_BEAST, [SYSTEM_BEAST] = SYSTEM_LIZARD, [SYSTEM_LIZARD] = SYSTEM_VERMIN,
    [SYSTEM_VERMIN] = SYSTEM_PLANTOID, [SYSTEM_AQUAN] = SYSTEM_AMORPH, [SYSTEM_AMORPH] = SYSTEM_BIRD,
    [SYSTEM_BIRD] = SYSTEM_AQUAN, [SYSTEM_UNDEAD] = SYSTEM_ARCANA, [SYSTEM_ARCANA] = SYSTEM_UNDEAD,
    [SYSTEM_DRAGON] = SYSTEM_DEMON, [SYSTEM_DEMON] = SYSTEM_DRAGON, [SYSTEM_BEASTMEN] = SYSTEM_BEASTMEN,
    [SYSTEM_LUMINION] = SYSTEM_LUMORIAN, [SYSTEM_LUMORIAN] = SYSTEM_LUMINION
}


local weakSystem = {
    [SYSTEM_PLANTOID] = SYSTEM_VERMIN, [SYSTEM_BEAST] = SYSTEM_PLANTOID, [SYSTEM_LIZARD] = SYSTEM_BEAST,
    [SYSTEM_VERMIN] = SYSTEM_LIZARD, [SYSTEM_AQUAN] = SYSTEM_BIRD, [SYSTEM_AMORPH] = SYSTEM_AQUAN,
    [SYSTEM_BIRD] = SYSTEM_AMORPH, [SYSTEM_UNDEAD] = SYSTEM_UNDEAD, [SYSTEM_ARCANA] = SYSTEM_ARCANA,
    [SYSTEM_DRAGON] = SYSTEM_DRAGON, [SYSTEM_DEMON] = SYSTEM_DEMON,
    [SYSTEM_LUMINION] = SYSTEM_LUMINION, [SYSTEM_LUMORIAN] = SYSTEM_LUMORIAN
}

-- Get the damage for a blue magic physical spell.
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Broken down into:
--      .tpmod - The TP modifier for the spell (e.g. damage varies, critical varies with TP, etc). Should be a TPMOD_xxx enum.
--      .numHits - The number of hits in the spell.
--      .multiplier - The base multiplier for the spell (not under Chain Affinity) - Every spell must specify this. (equivalent to TP 0%)
--      .tp150 - The TP modifier @ 150% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%).
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .tp300 - The TP modifier @ 300% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .azuretp - The TP modifier under Azure Lore (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--                  This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .duppercap - The upper cap for D for this spell.
--      .str_wsc - The decimal % value for STR % (e.g. STR 20% becomes 0.2)
--      .dex_wsc - Same as above.
--      .vit_wsc - Same as above.
--      .int_wsc - Same as above.
--      .mnd_wsc - Same as above.
--      .chr_wsc - Same as above.
--      .agi_wsc - Same as above.
function BluePhysicalSpell(caster, target, spell, params)
    -- store related values
    local magicskill = caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL); -- Base skill + equip mods
    -- TODO: Under Chain affinity?
    -- TODO: Under Efflux?
    -- TODO: Merits.
    -- TODO: Under Azure Lore.

    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value ??= floor(D+fSTR+WSC) * Multiplier

    local D =  math.floor((magicskill * 0.11)) * 2 + 3;
    -- cap D
    if (D > params.duppercap) then
        D = params.duppercap;
    end
    if (params.dbonus ~= nil) then D = D + params.dbonus end;

    local beforeD = D;

    -- print("D val is ".. D);

    local fStr = BluefSTR(caster:getStat(MOD_STR) - target:getStat(MOD_VIT));
    if (fStr > 25) then
        fStr = 25; -- TODO: Smite of Rage doesn't have this cap applied.
    end

    -- print("fStr val is ".. fStr);

    local WSC = BlueGetWsc(caster, params);

    -- print("wsc val is ".. WSC);

    local multiplier = params.multiplier;

    -- If under CA, replace multiplier with fTP(multiplier, tp150, tp300)
    local chainAffinity = caster:getStatusEffect(EFFECT_CHAIN_AFFINITY);
    if chainAffinity ~= nil then
        -- Calculate the total TP available for the fTP multiplier.
        local tp = caster:getTP() + caster:getMerit(MERIT_ENCHAINMENT) + caster:getMod(MOD_TP_BONUS);
        if tp > 3000 then
            tp = 3000;
        end;

        multiplier = BluefTP(tp, multiplier, params.tp150, params.tp300);
        fStr = fStr * (1 + tp / 800);
        WSC = WSC * (1 + tp / 800);
    end;

    -- TODO: Modify multiplier to account for family bonus/penalty
    local finalD = math.floor(D + fStr + WSC) * multiplier;

    -- print("Final D is ".. finalD);

    ----------------------------------------------
    -- Get the possible pDIF range and hit rate --
    ----------------------------------------------
    local isRanged = false;
    if (params.offcratiomod == nil) then -- default to attack. Pretty much every physical spell will use this, Cannonball being the exception.
        params.offcratiomod = caster:getStat(MOD_ATT) + caster:getSkillLevel(BLUE_SKILL) * 0.15;
    elseif (params.offcratiomod == MOD_RATT) then
        params.offcratiomod = caster:getRATT() + caster:getSkillLevel(BLUE_SKILL) * 0.15;
        isRanged = true;
    end;
    -- print(params.offcratiomod)
    local ratio = params.offcratiomod / target:getStat(MOD_DEF);
    if (ratio > 1.0) then ratio = 1 + (ratio - 1) / 2; end;
    local cratio = BluecRatio(ratio, caster:getMainLvl(), target:getMainLvl());

    local hitrate = BlueGetHitRate(caster,target,true, isRanged) + 0.15;
    if (chainAffinity ~= nil) then hitrate = hitrate + 0.15; end
    local system = target:getSystem();
    local spellSystem = spell:getBase();
    local hitMult = 1;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        hitMult = 2;
        hitrate = hitrate + 0.2;
    end

    if (caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY) and params.tpmod ==  TPMOD_ACC) then
        local tp = caster:getTP() + caster:getMerit(MERIT_ENCHAINMENT) + caster:getMod(MOD_TP_BONUS);
        hitrate = hitrate + tp / 3000;
    end

    if (strongSystem[spellSystem] == system) then
        hitrate = hitrate + 0.1 * hitMult;
    elseif (weakSystem[spellSystem] == system) then
        hitrate = hitrate - 0.1 * hitMult;
    end
    if (params.bonusAcc ~= nil) then hitrate = hitrate + params.bonusAcc / 100 end;

    -- print("Hit rate "..hitrate);
    -- print("pdifmin "..cratio[1].." pdifmax "..cratio[2]);

    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0;
    local hitslanded = 0;
    local finaldmg = 0;

    while (hitsdone < params.numhits) do
        local chance = math.random();
        if (chance <= hitrate) then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif = math.random((cratio[1]*1000),(cratio[2]*1000));
            pdif = pdif/1000;
            local crit = (caster:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX
            crit = crit + caster:getMod(MOD_CRITHITRATE) + target:getMod(MOD_ENEMYCRITRATE)
            if (params.tpmod == TPMOD_CRITICAL and caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY)) then
                local tp = caster:getTP() + caster:getMerit(MERIT_ENCHAINMENT) + caster:getMod(MOD_TP_BONUS);
                if (tp > 3000) then tp = 3000 end;
                crit = crit + tp / 2000;
            end


            -- Apply it to our final D
            if (hitsdone == 0) then -- only the first hit benefits from multiplier
                if (math.random() < crit) then
                    finaldmg = finaldmg + (finalD * pdif) * (2 + caster:getMod(MOD_CRIT_DMG_INCREASE) / 100);
                else
                    finaldmg = finaldmg + (finalD * pdif);
                end

            else
                if (math.random() < crit) then
                    finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif) * (2 + caster:getMod(MOD_CRIT_DMG_INCREASE) / 100);
                else
                    finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif);
                end
            end

            hitslanded = hitslanded + 1;

            -- increment target's TP (100TP per hit landed)
            local dAGI = 1.0 + utils.clamp((caster:getStat(MOD_AGI) - target:getStat(MOD_AGI)) * 0.75, -30.0, 30.0) / 100;
            target:addTP(100 * dAGI * ( 1 + target:getMod(MOD_STORETP) / 100));
        end

        hitsdone = hitsdone + 1;
    end

    if (caster:isPC()) then
--    caster:PrintToPlayer(string.format("D: %d\nfSTR: %d\n WSC: %d\nfinalD: %d\nFinal Damage: %d\nHitRate: %f\ncratio: %f/%f/%f", beforeD, fStr, WSC, finalD, finaldmg, hitrate, ratio, cratio[1], cratio[2]));
    end
    -- print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg);

    if (finaldmg == 0) then
        spell:setMsg(114);
    end

    return finaldmg;
end;

-- Blue Magical type spells

function blueTP(caster)
    local tp = caster:getTP() + caster:getMerit(MERIT_ENCHAINMENT) + caster:getMod(MOD_TP_BONUS);
    if (tp > 3000) then tp = 3000; end
    return tp;
end

function BlueMagicalSpell(caster, target, spell, params, statMod)
    local D = caster:getMainLvl() + 2;

    if (D > params.duppercap) then
        D = params.duppercap;
    end
    D = math.floor(D * 2);
    if (params.dbonus ~= nil) then
        D = D + params.dbonus;
    end




    local ST = BlueGetWsc(caster, params); -- According to Wiki ST is the same as WSC, essentially Blue mage spells that are magical use the dmg formula of Magical type Weapon skills



    local accBonus = 30;
    if (caster:hasStatusEffect(EFFECT_BURST_AFFINITY)) then
        ST = ST * (2 + (caster:getTP() + caster:getMod(MOD_TP_BONUS)) / 1000)
        accBonus = accBonus + 25;
    end
    local convergenceBonus = 1.0;
    if (caster:hasStatusEffect(EFFECT_CONVERGENCE)) then
        local convergenceEffect = getStatusEffect(EFFECT_CONVERGENCE);
        local convergenceBonus = convergenceBonus + convergenceEffect:getPower() / 100;
        accBonus = accBonus + convergenceEffect:getPower();
        caster:addMP(spell:getMP() * 0.33);
    end

    local statBonus = 0;
    local dStat = 0; -- Please make sure to add an additional stat check if there is to be a spell that uses neither INT, MND, or CHR. None currently exist.
    if (statMod == INT_BASED) then -- Stat mod is INT
        dStat = caster:getStat(MOD_INT) - target:getStat(MOD_INT)
        statBonus = (dStat)* params.tMultiplier;
    elseif (statMod == CHR_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(MOD_CHR) - target:getStat(MOD_CHR)
        statBonus = (dStat)* params.tMultiplier;
    elseif (statMod == VIT_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(MOD_VIT) - target:getStat(MOD_VIT)
        statBonus = (dStat)* params.tMultiplier;
    elseif (statMod == MND_BASED) then -- Stat mod is MND
        dStat = caster:getStat(MOD_MND) - target:getStat(MOD_MND)
        statBonus = (dStat)* params.tMultiplier;
    end

    local beforeMult = D;
    D = (((D + ST) * params.multiplier * convergenceBonus) + statBonus);
    local dAGI = 1.0 + utils.clamp((caster:getStat(MOD_AGI) - target:getStat(MOD_AGI)) * 0.75, -30.0, 30.0) / 100;
    target:addTP(100 * dAGI * ( 1 + target:getMod(MOD_STORETP) / 100));

    local accMult = 1;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        accBonus = accBonus + 20;
        accMult = 2;
    end

    local system = target:getSystem();
    local spellSystem = spell:getBase();
    -- At this point according to wiki we apply standard magic attack calculations
    if (strongSystem[spellSystem] == system) then
        accBonus = accBonus + 10 * accMult;
    elseif (weakSystem[spellSystem] == system) then
        accBonus = accBonus - 10 * accMult;
    end

    local afterBonus = D;



--    local multTargetReduction = 1.0; -- TODO: Make this dynamically change, temp static till implemented.
    local dmg = math.floor(D * applyResistance(caster,spell,target,dStat,BLUE_SKILL,accBonus));

    if (caster:isPC()) then
--        caster:PrintToPlayer(string.format("D: %d\nST: %d\nBonus: %d\nFinal: %d\nAfter: %d\nResist: %d", beforeMult, ST, statBonus, D, afterBonus, dmg ));
    end

    dmg = math.floor(addBonuses(caster, spell, target, dmg));

    caster:delStatusEffectSilent(EFFECT_BURST_AFFINITY);

    return dmg;
end;

function getSystemBonus(caster, target, spell)
    local system = target:getSystem();
    local spellSystem = spell:getBase();
    local bonus = 0;
    if (strongSystem[spellSystem] == system) then
        bonus = 1;
    elseif (weakSystem[spellSystem] == system) then
        bonus = -1;
    end
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        bonus = bonus * 2;
    end

    return bonus;
end

function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if (caster:hasStatusEffect(EFFECT_UNBRIDLED_WISDOM)) then
        caster:addMP(spell:getMP());
        caster:delStatusEffectSilent(EFFECT_UNBRIDLED_WISDOM);
    end

    if (dmg < 0) then
        dmg = 0;
    end
    if (caster:isSpellAoE(spell:getID()) and not (caster:hasStatusEffect(EFFECT_CONVERGENCE) or caster:hasStatusEffect(EFFECT_SUBTLE_SORCERY)))  then
        if (target:getModelSize() >= 4) then dmg = dmg * 1.25; end
        if (target:getFamily() == 47) then dmg = dmg * 1.33; end
    end

    local system = target:getSystem();
    local spellSystem = spell:getBase();
    local damMult = 1;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        damMult = 2;
    end

    dmg = dmg * BLUE_POWER;
    if (strongSystem[spellSystem] == system) then
        dmg = dmg * (1 + .15 * damMult);
    elseif (weakSystem[spellSystem] == system) then
        dmg = dmg * (1 - .15 * damMult);
    end

    dmg = dmg - target:getMod(MOD_PHALANX);
    if (dmg < 0) then
        dmg = 0;
    end

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg);

    target:delHP(dmg);
    local enmityMult = params.enmityMult;
    if (params.enmityMult == nil) then enmityMult = 1.0 end;
    target:updateEnmityFromDamage(caster,dmg * enmityMult);
    target:handleAfflatusMiseryDamage(dmg);
    -- TP has already been dealt with.
    caster:delStatusEffect(EFFECT_CHAIN_AFFINITY);
    return dmg;
end;

------------------------------
-- Utility functions below ---
------------------------------

function BlueGetWsc(attacker, params)
    wsc = (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) * BlueGetAlpha(attacker:getMainLvl());
    return wsc;
end;

-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function BluecRatio(ratio,atk_lvl,def_lvl)
    -- Level penalty...
    local levelcor = 0;
    if (atk_lvl < def_lvl) then
        levelcor = 0.03 * (def_lvl - atk_lvl);
    end

    ratio = ratio - levelcor;


    -- apply caps
    if (ratio<0) then
        ratio = 0;
    elseif (ratio>2) then
        ratio = 2;
    end

    -- Obtaining cRatio_MIN
    local cratiomin = 0;
    if (ratio<1.25) then
        cratiomin = 1.2 * ratio - 0.5;
    elseif (ratio>=1.25 and ratio<=1.5) then
        cratiomin = 1;
    elseif (ratio>1.5 and ratio<=2) then
        cratiomin = 1.2 * ratio - 0.8;
    end

    -- Obtaining cRatio_MAX
    local cratiomax = 0;
    if (ratio<0.5) then
        cratiomax = 0.4 + 1.2 * ratio;
    elseif (ratio<=0.833 and ratio>=0.5) then
        cratiomax = 1;
    elseif (ratio<=2 and ratio>0.833) then
        cratiomax = 1.2 * ratio;
    end
    local cratio = {};
    if (cratiomin < 0) then
        cratiomin = 0;
    end
    cratio[1] = (cratiomin + cratiomax) / 2;
    cratio[2] = cratiomax;
    return cratio;
end;

-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3
-- tp - The current TP
-- ftp1 - The TP 0% value
-- ftp2 - The TP 150% value
-- ftp3 - The TP 300% value
function BluefTP(tp,ftp1,ftp2,ftp3)
    if (tp >= 0 and tp < 1500) then
        return ftp1 + ( ((ftp2-ftp1)/100) * (tp / 10));
    elseif (tp >= 1500 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/100) * ((tp-1500) / 10));
    else
        print("blue fTP error: TP value is not between 0-3000!");
    end
    return 1; -- no ftp mod
end;

function BluefSTR(dSTR)

--    local fSTR2 = nil;
--    if (dSTR < -15) then
--        dSTR = -15 + (dSTR + 15) / 2;
--    elseif (dSTR > 10) then
--        dSTR = 15 + (dSTR - 15) / 2;
--    end
--    return dSTR;

--
--

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
    return fSTR2;
end;

function BlueGetHitRate(attacker,target,capHitRate, isRanged)
    local acc = attacker:getACC();
    if (isRanged ~= nil and isRanged == true) then
        acc = attacker:getRACC();
    end

    local acc = attacker:getACC();
    local eva = target:getEVA();

    if (attacker:getMainLvl() > target:getMainLvl()) then -- acc bonus!
        acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*2);
    elseif (attacker:getMainLvl() < target:getMainLvl()) then -- acc penalty :(
        acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*2);
    end

    local hitdiff = 0;
    local hitrate = 75;
    if (acc>eva) then
    hitdiff = (acc-eva)/2;
    end
    if (eva>acc) then
    hitdiff = ((-1)*(eva-acc))/2;
    end

    hitrate = hitrate+hitdiff;
    hitrate = hitrate/100;


    -- Applying hitrate caps
    if (capHitRate) then -- this isn't capped for when acc varies with tp, as more penalties are due
        if (hitrate>0.95) then
            hitrate = 0.95;
        end
        if (hitrate<0.2) then
            hitrate = 0.2;
        end
    end
    return hitrate;
end;

-- Function to stagger duration of effects by using the resistance to change the value
function getBlueEffectDuration(caster,resist,effect)
    local duration = 0;

    if (resist == 0.125) then
        resist = 1;
    elseif (resist == 0.25) then
        resist = 2;
    elseif (resist == 0.5) then
        resist = 3;
    else
        resist = 4;
    end

    if (effect == EFFECT_BIND) then
        duration = math.random(0,5) + resist * 5;
    elseif (effect == EFFECT_STUN) then
        duration = math.random(2,3) + resist;
        -- printf("Duration of stun is %i",duration);
    elseif (effect == EFFECT_WEIGHT) then
        duration = math.random(20,24) + resist * 9; -- 20-24
    elseif (effect == EFFECT_PARALYSIS) then
        duration = math.random(50,60) + resist * 15; -- 50- 60
    elseif (effect == EFFECT_SLOW) then
        duration = math.random(60,120) + resist * 15; -- 60- 120 -- Needs confirmation but capped max duration based on White Magic Spell Slow
    elseif (effect == EFFECT_SILENCE) then
        duration = math.random(60,180) + resist * 15; -- 60- 180 -- Needs confirmation but capped max duration based on White Magic Spell Silence
    else
        duration = math.random(50, 60) + resist * 15;
    end

    return duration;
end;

-- obtains alpha, used for working out WSC
function BlueGetAlpha(level)
    local alpha = 1.00;
    if (level <= 5) then
        alpha = 1.00;
    elseif (level <= 11) then
        alpha = 0.99;
    elseif (level <= 17) then
        alpha = 0.98;
    elseif (level <= 23) then
        alpha = 0.97;
    elseif (level <= 29) then
        alpha = 0.96;
    elseif (level <= 35) then
        alpha = 0.95;
    elseif (level <= 41) then
        alpha = 0.94;
    elseif (level <= 47) then
        alpha = 0.93;
    elseif (level <= 53) then
        alpha = 0.92;
    elseif (level <= 59) then
        alpha = 0.91;
    elseif (level <= 61) then
        alpha = 0.90;
    elseif (level <= 63) then
        alpha = 0.89;
    elseif (level <= 65) then
        alpha = 0.88;
    elseif (level <= 67) then
        alpha = 0.87;
    elseif (level <= 69) then
        alpha = 0.86;
    elseif (level <= 71) then
        alpha = 0.85;
    elseif (level <= 73) then
        alpha = 0.84;
    elseif (level <= 75) then
        alpha = 0.83;
    elseif (level <= 99) then
        alpha = 0.85;
    end
    return alpha;
end;

function breathFactor(player)
    return player:getHPP() / 100;
end

