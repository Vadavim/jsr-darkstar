-----------------------------------
-- Nightmare Scythe
-- Scythe weapon skill
-- Skill Level: 100
-- Blinds enemy. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: STR:60% ; MND:60%
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
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5; params.ftp200 = 1.5; params.ftp300 = 1.5;
        params.str_wsc = 0.6; params.int_wsc = 0.6;
        if (target:hasStatusEffect(EFFECT_BIO)) then
            params.ftp100 = 1.25; params.ftp200 = 1.25; params.ftp300 = 1.25;
        end
        if (target:hasStatusEffect(EFFECT_LULLABY) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
            params.ftp100 = 3.3; params.ftp200 = 3.3; params.ftp300 = 3.3;
        end
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_DARK, SKILL_SYH);
    if (damage > 0 and resist >= 0.25) then
        local duration = (tp/1000 * 60) * resist;
        if (target:hasStatusEffect(EFFECT_BLINDNESS) == false) then
            target:addStatusEffect(EFFECT_BLINDNESS, 20, 0, duration);
            target:setPendingMessage(277, EFFECT_BLINDNESS);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
