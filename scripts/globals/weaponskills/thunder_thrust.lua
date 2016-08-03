-----------------------------------
-- Thunder Thrust
-- Polearm weapon skill
-- Skill Level: 30
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Aligned with the Light Gorget & Thunder Gorget.
-- Aligned with the Light Belt & Thunder Belt.
-- Element: Lightning
-- Modifiers: STR:40% ; INT:40%
-- 100%TP    200%TP    300%TP
-- 1.50      2.00      2.50
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 3.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_LIGHTNING;
    params.skill = SKILL_POL;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.int_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);

    -- add Shock
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_THUNDER, SKILL_POL);
    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_RASP)) then
        local DOT = math.floor(player:getMainLvl()/3) + 1;
        local duration = 30 * (tp / 1000) * (1 + (tp - 1000) / 2000);

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_THUNDER, target, DOT, mParams, 1.0);

        -- Remove Drown
        target:delStatusEffect(EFFECT_DROWN);
        target:addStatusEffect(EFFECT_SHOCK, DOT, 3, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_SHOCK);
    end
    return tpHits, extraHits, criticalHit, damage;

end
