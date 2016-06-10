-----------------------------------
-- Sniper Shot
-- Marksmanship weapon skill
-- Skill Level: 80
-- Lowers enemy's INT. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: AGI:70%
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
    params.ftp100 = 2.0; params.ftp200 = 2.0; params.ftp300 = 2.0;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.20; params.crit200 = 0.50; params.crit300 = 0.95;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.bonusACC = 40;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.int_wsc = 1.5;
    end

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0 and target:hasStatusEffect(EFFECT_INT_DOWN) == false) then
        target:addStatusEffect(EFFECT_INT_DOWN, 20, 0, 120);
        target:setPendingMessage(277, EFFECT_INT_DOWN);
    end
    local system = target:getSystem();
    if (system == SYSTEM_BEASTMEN or system == SYSTEM_HUMANOID) then
        damage = math.floor(damage * 1.33);
    end

    if (criticalHit) then
        target:addStatusEffect(EFFECT_STUN, 1, 0, 8);
    end

    return tpHits, extraHits, criticalHit, damage;

end
