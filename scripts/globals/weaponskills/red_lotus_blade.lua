-----------------------------------
-- Red Lotus Blade
-- Sword weapon skill
-- Skill Level: 50
-- Deals fire elemental damage to enemy. Damage varies with TP.
-- Aligned with the Flame Gorget & Breeze Gorget.
-- Aligned with the Flame Belt & Breeze Belt.
-- Element: Fire
-- Modifiers: STR:40% ; INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.38      3.75
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 3.5; params.ftp300 = 3;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_FIRE;
    params.skill = SKILL_SWD;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp300 = 6.0;
        params.str_wsc = 0.4; params.int_wsc = 0.8;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    local sEffect = target:getStatusEffect(EFFECT_BURN);
    if (sEffect ~= nil) then
        damage = math.floor(damage * 1.20);
        sEffect:addMod(MOD_REGEN_DOWN, math.floor(1 + player:getMainLvl() / 5));
        sEffect:addMod(MOD_INT, -3);
        target:addMod(MOD_INT, -3);
        target:addMod(MOD_REGEN_DOWN, math.floor(1 + player:getMainLvl() / 5));
    end

    if (damage > 0) then
        local duration = 60 * (tp / 1000) * (1 + (tp - 1000) / 2000);
        local power = 3 + player:getMainLvl() / 2;
        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        power = addBonusesAbility(player, ELE_FIRE, target, power, mParams, 1.0);
        player:addStatusEffect(EFFECT_BLAZE_SPIKES,power,0,duration);
    end

    return tpHits, extraHits, criticalHit, damage;

end
