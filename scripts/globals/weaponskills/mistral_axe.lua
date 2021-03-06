-----------------------------------
-- Mistral Axe
-- Axe weapon skill
-- Skill level: 225 (Beastmasters and Warriors only.)
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Damage varies with TP.
-- Despite being able to be used from a distance it is considered a melee attack and can be stacked with Sneak Attack and/or Trick Attack
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
-- 2.50      3.00      3.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.5; params.ftp200 = 3; params.ftp300 = 3.5;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.5; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.bonusACC = 50;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 3; params.ftp200 = 5.5; params.ftp300 = 8;
    end

    if (system == SYSTEM_BIRD) then
        params.ftp100 = params.ftp100 * 1.25; params.ftp200 = params.ftp200 * 1.25; params.ftp300 = params.ftp300 * 1.25;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);



    return tpHits, extraHits, criticalHit, damage;

end
