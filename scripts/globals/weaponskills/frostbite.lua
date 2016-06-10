-----------------------------------
-- Frostbite
-- Great Sword weapon skill
-- Skill Level: 70
-- Delivers an ice elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget.
-- Aligned with the Snow Belt.
-- Element: Ice
-- Modifiers: STR:20% ; INT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 3; params.ftp300 = 4.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_ICE;
    params.skill = SKILL_GSD;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.int_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);

    -- add Frost
    local resist = applyResistanceWeaponskill(player, target, params, ELE_ICE, SKILL_GSD);
    if (damage > 0 and resist > 0.125)then
        local DOT = math.floor(player:getMainLvl()/3) + 1;

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_ICE, target, DOT, mParams, 1.0);

        local duration = (30 * (tp / 1000) * (1 + (tp - 1000) / 2000));

        -- Remove Choke
        if (target:getStatusEffect(EFFECT_CHOKE) ~= nil) then
            target:delStatusEffect(EFFECT_CHOKE);
        end;

        target:addStatusEffect(EFFECT_FROST, DOT, 3, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_FROST);
    end

    return tpHits, extraHits, criticalHit, damage;

end
