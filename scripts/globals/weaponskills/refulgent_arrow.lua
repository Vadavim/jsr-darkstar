-----------------------------------
-- Refulgent Arrow
-- Archery weapon skill
-- Skill level: 290
-- Delivers a twofold attack. Damage varies with TP.
-- Aligned with the Aqua Gorget & Light Gorget.
-- Aligned with the Aqua Belt & Light Belt.
-- Element: None
-- Modifiers: STR: 60% http://www.bg-wiki.com/bg/Refulgent_Arrow
-- 100%TP    200%TP    300%TP
-- 3.00      4.25      7.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 2;
    params.ftp100 = 3; params.ftp200 = 4.25; params.ftp300 = 5;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5; params.ftp200 = 2.0; params.ftp300 = 3;
        params.str_wsc = 0.0; params.agi_wsc = 0.5; params.mnd_wsc = 0.5;
    end

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0 and target:getStatusEffect(EFFECT_FLASH) == nil) then
        local duration = 8 * (tp / 1000) * ((tp - 1000) / 2000);
        target:addStatusEffect(EFFECT_FLASH, 200, 0, duration);
        target:setPendingMessage(277, EFFECT_FLASH);
    end

    return tpHits, extraHits, criticalHit, damage;

end
