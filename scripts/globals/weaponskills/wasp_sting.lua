-----------------------------------
-- Wasp Sting
-- Dagger weapon skill
-- Skill level: 5
-- Poisons target. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: :    DEX:100%
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
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 1.0;
    end

    local hasSneak = player:hasStatusEffect(EFFECT_SNEAK_ATTACK);
    player:addTP(tp * 0.35);
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    local power = 1 + player:getStat(MOD_DEX) / 5;
    if (hasSneak) then
        power = power * 1.5;
    end

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WATER, SKILL_DAG);
    local duration = 60 * tp / 1000;

    if (damage > 0 and resist > 0.25) then
        target:addStatusEffect(EFFECT_POISON_II, power, 3, duration * resist);
        target:setPendingMessage(278, EFFECT_POISON_II);
    end
    return tpHits, extraHits, criticalHit, damage;

end
