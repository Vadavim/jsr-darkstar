------------------------
--    Energy Steal    -- 
------------------------
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");

function onUseWeaponSkill(player, target, wsID, tp, primary)
    local params = {};
    local power = player:getStat(MOD_INT) / 2 + player:getSkillLevel(SKILL_DAG) * 0.2;
    power = power * (tp / 1000);
    local hasSneak = player:hasStatusEffect(EFFECT_SNEAK_ATTACK);

    if (hasSneak) then
        power = power * 2;
    end

    params.bonusmab = 0; params.includemab = false;
    power = addBonusesAbility(player, ELE_DARK, target, power, params);
    if (target:getMP() < power) then power = target:getMP(); end
    target:delMP(power);
    player:addMP(power);
    player:addTP(tp * 0.25);

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_DARK, SKILL_DAG);
    if (resist >= 0.25) then
        target:addStatusEffect(EFFECT_MAGIC_ATK_DOWN, 15, 0, 20 * (tp / 1000));
        player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST, 15, 0, 20 * (tp / 1000));
    end

    local damage = power * 1;

    -- TODO: Should steal MP based on TP and not wake the mob involved.
    return 1, 0, false, damage;
end
