-----------------------------------
-- Ability: Violent Flourish
-- Stuns target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 45
-- Finishing Moves Used: 1
-- Recast Time: 0:20
-- Duration: ??
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getAnimation() ~= 1) then
        return MSGBASIC_REQUIRES_COMBAT,0;
    else
        if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
            return 0,0;

        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
            return 0,0;

        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
            return 0,0;

        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
            return 0,0;

        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
            return 0,0;
        else
            return MSGBASIC_NO_FINISHINGMOVES,0;
        end;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    local hit = 4;
    --get fstr
    local fstr = fSTR(player:getStat(MOD_STR),target:getStat(MOD_VIT),player:getWeaponDmgRank());


    local damMult = 1.0;

    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        damMult = 1.0;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_1);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        damMult = 3;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_2);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        damMult = 4;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_3);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        damMult = 5;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_4);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        damMult = 6;
        player:delStatusEffect(EFFECT_FINISHING_MOVE_5);
    end;


    local params = {};
    params.atkmulti = 1;
    
    --apply WSC
    local weaponDamage = player:getWeaponDmg();

    if (player:getWeaponSkillType(0) == 1) then
        local h2hSkill = ((player:getSkillLevel(1) * 0.11) + 3);
        weaponDamage = player:getWeaponDmg()-3;

        weaponDamage = weaponDamage + h2hSkill;
        weaponDamage = weaponDamage * 3.5;
    end
    
    local base = weaponDamage + fstr
    local cratio, ccritratio = cMeleeRatio(player, target, params, 0);
    local isSneakValid = player:hasStatusEffect(EFFECT_SNEAK_ATTACK);
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false;
    end
    local pdif = generatePdif (cratio[1], cratio[2], true);
    local hitrate = getHitRate(player,target,true);
    
    if (math.random() <= hitrate or isSneakValid) then
        hit = 3;
        local dmg = base * pdif * damMult;
        


        local dmgMult = 1;
        if (target:hasStatusEffect(EFFECT_SLUGGISH_DAZE_1)) then dmgMult = dmgMult + 0.1;
        elseif (target:hasStatusEffect(EFFECT_SLUGGISH_DAZE_2)) then dmgMult = dmgMult + 0.2;
        elseif (target:hasStatusEffect(EFFECT_SLUGGISH_DAZE_3)) then dmgMult = dmgMult + 0.3;
        elseif (target:hasStatusEffect(EFFECT_SLUGGISH_DAZE_4)) then dmgMult = dmgMult + 0.4;
        elseif (target:hasStatusEffect(EFFECT_SLUGGISH_DAZE_5)) then dmgMult = dmgMult + 0.5;
        end

        if (target:hasStatusEffect(EFFECT_BEWILDERED_DAZE_1)) then dmgMult = dmgMult + 0.1;
        elseif (target:hasStatusEffect(EFFECT_BEWILDERED_DAZE_2)) then dmgMult = dmgMult + 0.2;
        elseif (target:hasStatusEffect(EFFECT_BEWILDERED_DAZE_3)) then dmgMult = dmgMult + 0.3;
        elseif (target:hasStatusEffect(EFFECT_BEWILDERED_DAZE_4)) then dmgMult = dmgMult + 0.4;
        elseif (target:hasStatusEffect(EFFECT_BEWILDERED_DAZE_5)) then dmgMult = dmgMult + 0.5;
        end

        if (target:hasStatusEffect(EFFECT_LETHARGIC_DAZE_1)) then dmgMult = dmgMult + 0.1;
        elseif (target:hasStatusEffect(EFFECT_LETHARGIC_DAZE_2)) then dmgMult = dmgMult + 0.2;
        elseif (target:hasStatusEffect(EFFECT_LETHARGIC_DAZE_3)) then dmgMult = dmgMult + 0.3;
        elseif (target:hasStatusEffect(EFFECT_LETHARGIC_DAZE_4)) then dmgMult = dmgMult + 0.4;
        elseif (target:hasStatusEffect(EFFECT_LETHARGIC_DAZE_5)) then dmgMult = dmgMult + 0.5;
        end

        if (target:hasStatusEffect(EFFECT_WEAKENED_DAZE_1)) then dmgMult = dmgMult + 0.1;
        elseif (target:hasStatusEffect(EFFECT_WEAKENED_DAZE_2)) then dmgMult = dmgMult + 0.2;
        elseif (target:hasStatusEffect(EFFECT_WEAKENED_DAZE_3)) then dmgMult = dmgMult + 0.3;
        elseif (target:hasStatusEffect(EFFECT_WEAKENED_DAZE_4)) then dmgMult = dmgMult + 0.4;
        elseif (target:hasStatusEffect(EFFECT_WEAKENED_DAZE_5)) then dmgMult = dmgMult + 0.5;
        end


--        target:delStatusEffect(EFFECT_WEAKENED_DAZE_1); target:delStatusEffect(EFFECT_WEAKENED_DAZE_2); target:delStatusEffect(EFFECT_WEAKENED_DAZE_3); target:delStatusEffect(EFFECT_WEAKENED_DAZE_4); target:delStatusEffect(EFFECT_WEAKENED_DAZE_5);
--        target:delStatusEffect(EFFECT_BEWILDERED_DAZE_1); target:delStatusEffect(EFFECT_BEWILDERED_DAZE_2); target:delStatusEffect(EFFECT_BEWILDERED_DAZE_3); target:delStatusEffect(EFFECT_BEWILDERED_DAZE_4); target:delStatusEffect(EFFECT_BEWILDERED_DAZE_5);
--        target:delStatusEffect(EFFECT_LETHARGIC_DAZE_1); target:delStatusEffect(EFFECT_LETHARGIC_DAZE_2); target:delStatusEffect(EFFECT_LETHARGIC_DAZE_3); target:delStatusEffect(EFFECT_LETHARGIC_DAZE_4); target:delStatusEffect(EFFECT_LETHARGIC_DAZE_5);
--        target:delStatusEffect(EFFECT_SLUGGISH_DAZE_1); target:delStatusEffect(EFFECT_SLUGGISH_DAZE_2); target:delStatusEffect(EFFECT_SLUGGISH_DAZE_3); target:delStatusEffect(EFFECT_SLUGGISH_DAZE_4); target:delStatusEffect(EFFECT_SLUGGISH_DAZE_5);

        dmg = utils.stoneskin(target, dmg);
        
        target:delHP(dmg);
        target:updateEnmityFromDamage(player,dmg);
        
        action:animation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(SLOT_MAIN)))
        action:speceffect(target:getID(), hit)
        return dmg
    else
        ability:setMsg(158);
        return 0;
    end
end;
