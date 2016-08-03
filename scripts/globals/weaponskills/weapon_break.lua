-----------------------------------
-- Weapon Break
-- Great Axe weapon skill
-- Skill level: 175
-- Lowers enemy's attack. Duration of effect varies with TP.
-- Lowers attack by as much as 25% if unresisted.
-- Strong against: Manticores, Orcs, Rabbits, Raptors, Sheep.
-- Immune: Crabs, Crawlers, Funguars, Quadavs, Pugils, Sahagin, Scorpion.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: Water
-- Modifiers: STR:60% ; VIT:60%
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
    params.str_wsc = 0.32; params.dex_wsc = 0.0; params.vit_wsc = 0.32; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    player:addTP(tp * 0.45);
    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.2; params.vit_wsc = 0.2;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WATER, SKILL_GAX);
    if (damage > 0 and resist >= 0.25) then
        local duration = (tp/1000 * 60) + 120;
        if (target:hasStatusEffect(EFFECT_ATTACK_DOWN) == false) then
            target:addStatusEffect(EFFECT_ATTACK_DOWN, 25, 0, duration);
            target:setPendingMessage(278, EFFECT_ATTACK_DOWN);
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end
