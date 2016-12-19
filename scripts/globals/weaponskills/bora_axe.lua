-----------------------------------
-- Bora Axe
-- Axe weapon skill
-- Skill level: 290
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Chance of binding varies with TP
-- Bind doesn't always break from hitting mob.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits
-- Not natively available to RNG
-- Aligned with the ?? Gorget.
-- Element: Ice
-- Modifiers: DEX 60%  -- http://wiki.bluegartr.com/bg/Bora_Axe
-- 100%TP    200%TP    300%TP
-- 1.0        1.0      1.0
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1.0; params.ftp200 = 1.0; params.ftp300 = 1.0;
    params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 2;
    params.ele = ELE_ICE;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1; params.ftp200 = 1.75; params.ftp300 = 2.5;
        params.agi_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_ICE, SKILL_AXE);
    if (damage > 0 and resist >= 0.25) then
        target:addStatusEffect(EFFECT_BIND, 1, 0, 30);
        target:setPendingMessage(277, EFFECT_BIND);

        target:addStatusEffect(EFFECT_AGI_DOWN, 25, 0, fTP(tp, 60, 120, 240));
        target:setPendingMessage(278, EFFECT_AGI_DOWN);
    end


    return tpHits, extraHits, criticalHit, damage;

end
