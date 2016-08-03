-----------------------------------
-- Sturmwind
-- Great Axe weapon skill
-- Skill level: 70
-- Delivers a two-hit attack. Attack varies with TP.
-- Will stack with Sneak Attack, but only the first hit.
-- Aligned with the Soil Gorget & Aqua Gorget.
-- Aligned with the Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 2;
    params.ftp100 = 1; params.ftp200 = 1.4; params.ftp300 = 1.8;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    -- params.atkmulti is supposed to vary with TP, however it is unknown what the multiplier is so I am going to leave it at 1. http://www.bg-wiki.com/bg/Sturmwind
    params.atkmulti = 1;

    local system = target:getSystem();
    if (system == SYSTEM_BIRD) then
        params.ftp100 = params.ftp100 * 1.33; params.ftp200 = params.ftp200 * 1.33; params.ftp300 = params.ftp300 * 1.33;
    end

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.45;
        params.vit_wsc = 0.45;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    return tpHits, extraHits, criticalHit, damage;

end
