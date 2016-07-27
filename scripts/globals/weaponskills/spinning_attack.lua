-----------------------------------
-- Spinning Attack
-- Hand-to-Hand weapon skill
-- Skill Level: 150
-- Delivers an area attack. Radius varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget & Thunder Gorget.
-- Aligned with the Flame Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:100%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1; -- aoe not multihit
    params.ftp100 = 1.25; params.ftp200 = 2; params.ftp300 = 3;
    params.str_wsc = 0.35; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0;
    end

    if (not player:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        local duration = fTP(tp, 60, 120, 180);
        player:addStatusEffect(EFFECT_EVASION_BOOST, 20, 0, duration);
        local effect = player:getStatusEffect(EFFECT_EVASION_BOOST);
        if (effect ~= nil) then
            player:addMod(MOD_GUARD, 40);
            effect:addMod(MOD_GUARD, 40);
        end
    end



    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    return tpHits, extraHits, criticalHit, damage;

end
