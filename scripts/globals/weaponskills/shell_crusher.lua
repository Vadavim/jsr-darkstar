-----------------------------------
-- Shell Crusher
-- Staff weapon skill
-- Skill Level: 175
-- Lowers target's defense. Duration of effect varies with TP.
-- If unresisted, lowers target defense by 25%.
-- Will stack with Sneak Attack.
-- Aligned with the Breeze Gorget.
-- Aligned with the Breeze Belt.
-- Element: None
-- Modifiers: STR:100%
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
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.35; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    params.ignoresDef = true;
    params.ignored100 = 0.30;
    params.ignored200 = 0.50;
    params.ignored300 = 0.70;


    if (target:getSystem() == SYSTEM_AQUAN) then
        params.ftp100 = params.ftp100 * 1.33; params.ftp200 = params.ftp200 * 1.33; params.ftp300 = params.ftp300 * 1.33;
    end



    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0) then
        local duration = (tp/1000 * 60) + 120;
        if (target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 25, 0, duration);
            target:setPendingMessage(278, EFFECT_DEFENSE_DOWN);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
