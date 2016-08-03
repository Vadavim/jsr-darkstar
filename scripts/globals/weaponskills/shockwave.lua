-----------------------------------
-- Shockwave
-- Great Sword weapon skill
-- Skill level: 150
-- Delivers an area of effect attack. Sleeps enemies. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: None
-- Modifiers: STR:30% ; MND:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {};
    params.numHits = 1;
    params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 4.0;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0 and target:hasStatusEffect(EFFECT_STUN) == false) then
        local duration = (tp/1000 * 4);
        target:addStatusEffect(EFFECT_STUN, 1, 0, duration);
    end

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_EARTH, SKILL_GSD);
    if (damage > 0 and resist > 0.125) then
        local duration2 = (tp/1000 * 60);
        target:addStatusEffect(EFFECT_WEIGHT, 50, 0, duration2 * resist);
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end


    return tpHits, extraHits, criticalHit, damage;
end