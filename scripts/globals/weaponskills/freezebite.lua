-----------------------------------
-- Freezebite
-- Great Sword weapon skill
-- Skill Level: 100
-- Delivers an ice elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget & Breeze Gorget.
-- Aligned with the Snow Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: STR:30% ; INT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      3.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 3.5; params.ftp300 = 6.0;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_ICE;
    params.skill = SKILL_GSD;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.int_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    local sEffect = target:getStatusEffect(EFFECT_FROST);
    if (sEffect ~= nil) then
        damage = math.floor(damage * 1.20);
        sEffect:addMod(MOD_REGEN_DOWN, math.floor(1 + player:getMainLvl() / 5));
        sEffect:addMod(MOD_AGI, -3);
        target:addMod(MOD_AGI, -3);
        target:addMod(MOD_REGEN_DOWN, math.floor(1 + player:getMainLvl() / 5));
    end

    if (damage > 0) then
        local duration = 60 * (tp / 1000) * (1 + (tp - 1000) / 2000);
        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        local power = 1 + player:getMainLvl() / 5;
        power = addBonusesAbility(player, ELE_ICE, target, power, mParams, 1.0);
        player:addStatusEffect(EFFECT_ICE_SPIKES,power,0,duration);
    end

    return tpHits, extraHits, criticalHit, damage;

end
