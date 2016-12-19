-----------------------------------
-- Starburst
-- Staff weapon skill
-- Skill Level: 100
-- Deals light or darkness elemental damage. Damage varies with TP.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt.
-- Element: Light/Dark (Random)
-- Modifiers: :    STR:40% MND:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 3; params.ftp300 = 5;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.ele = ELE_DARK; params.ele = ELE_LIGHT
    local eles = {ELE_DARK, ELE_LIGHT};
    params.skill = SKILL_STF;
    params.includemab = true;
    params.enmityMult = 0;

    if (target:getMod(MOD_LIGHTRES) == target:getMod(MOD_DARKRES)) then
        params.ele = eles[math.random(1, 2)];
    elseif (target:getMod(MOD_LIGHTRES) < target:getMod(MOD_DARKRES)) then
        params.ele = ELE_LIGHT;
    else
        params.ele = ELE_DARK;
    end



    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);

    local resist = applyResistanceWeaponskill(player, target, params, tp, params.ele, SKILL_STF);
    if (target:isNM()) then resist = resist - 0.75 end;
    if (damage > 0 and resist >= 0.25) then
        target:dispelStatusEffect();
    end

    return tpHits, extraHits, criticalHit, damage;

end
