-----------------------------------
-- Dulling Arrow
-- Archery weapon skill
-- Skill level: 80
-- Lowers enemy's INT. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:16% ; AGI:25%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.5; params.ftp200 = 2.5; params.ftp300 = 2.5;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.15; params.crit200 = 0.5; params.crit300 = 0.95;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.0; params.agi_wsc = 0.5; params.mnd_wsc = 0.5;
    end

    local resist = applyResistanceWeaponskill(player, target, params, ELE_FIRE, SKILL_ARC);
    local duration = 60 * (tp / 1000) * (1 + (tp - 1000) / 2000);
    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);
    if (damage > 0 and resist > 0.125) then
        if (target:addStatusEffect(EFFECT_ADDLE, 30, 0, duration * resist, 0, 30)) then
            target:setPendingMessage(277, EFFECT_ADDLE);
        end
    end

    local resist = applyResistanceWeaponskill(player, target, params, ELE_DARK, SKILL_ARC);
    if (damage > 0 and resist > 0.125) then
        target:delStatusEffect(EFFECT_ATTACK_BOOST);
        target:delStatusEffect(EFFECT_STR_BOOST);
        target:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
        target:delStatusEffect(EFFECT_ACCURACY_BOOST);
        target:delStatusEffect(EFFECT_HASTE);
        target:delStatusEffect(EFFECT_ENFIRE);
        target:delStatusEffect(EFFECT_ENSTONE);
        target:delStatusEffect(EFFECT_ENAERO);
        target:delStatusEffect(EFFECT_ENBLIZZARD);
        target:delStatusEffect(EFFECT_ENTHUNDER);
        target:delStatusEffect(EFFECT_ENWATER);
        target:delStatusEffect(EFFECT_ENDARK);
        target:delStatusEffect(EFFECT_ENLIGHT);
    end

    return tpHits, extraHits, criticalHit, damage;

end
