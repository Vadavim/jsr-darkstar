-----------------------------------
-- Vorpal Thrust
-- Polearm weapon skill
-- Skill Level: 175
-- Delivers a single-hit attack. Chance of params.critical varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget & Light Gorget.
-- Aligned with the Aqua Belt & Light Belt.
-- Element: None
-- Modifiers: STR:50% ; AGI:50%
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
    params.ftp100 = 1.75; params.ftp200 = 1.75; params.ftp300 = 1.75;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.2; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.3; params.crit200 = 0.6; params.crit300 = 0.9;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.bonusACC = 20;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.5; params.agi_wsc = 0.5;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    local system = target:getSystem();
    if (system == SYSTEM_HUMANOID or system == SYSTEM_BEASTMEN) then
        damage = math.floor(damage * 1.33);
    end
    if (damage > 0) then
        local duration = 40 * tp / 1000 * (1 + (tp - 1000) / 2000);
        player:addStatusEffect(EFFECT_POTENCY,15,0,duration);
    end

    return tpHits, extraHits, criticalHit, damage;

end
