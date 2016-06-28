-----------------------------------
-- Leg Sweep
-- Polearm weapon skill
-- Skill Level: 100
-- Stuns enemy. Chance of stunning varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: None
-- Modifiers: STR:30%
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
    params.ftp100 = 1.25; params.ftp200 = 1.25; params.ftp300 = 1.25;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    local chance = (tp / 1000) * 50 > math.random(0, 99);
    if (damage > 0 and chance) then
        if (target:hasStatusEffect(EFFECT_STUN) == false) then
            local stunDuration = (4 * (tp / 1000));
            target:addStatusEffect(EFFECT_STUN, 1, 0, stunDuration);
        end
    end

    -- attempt to apply weight
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WIND, SKILL_POL);
    if (damage > 0 and resist > 0.125) then
        local duration = (60 * (tp / 1000) * (1 + (tp - 1000) / 2000));
        target:addStatusEffect(EFFECT_WEIGHT, 50, 0, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end


    return tpHits, extraHits, criticalHit, damage;

end
