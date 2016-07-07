-----------------------------------
-- Burning Blade
-- Sword weapon skill
-- Skill Level: 30
-- Desription: Deals Fire elemental damage to enemy. Damage varies with TP.
-- Aligned with the Flame Gorget.
-- Aligned with the Flame Belt.
-- Element: Fire
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
    params.ftp100 = 1.5; params.ftp200 = 2; params.ftp300 = 2.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ele_fire;
    params.skill = skill_swd;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 3.5; params.ftp300 = 6.0;
        params.str_wsc = 0.4; params.int_wsc = 0.4;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);


    -- add Burn
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_FIRE, SKILL_SWD);
    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_DROWN))then
        local DOT = math.floor(player:getMainLvl()/3) + 1;

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_FIRE, target, DOT, mParams, 1.0);

        local duration = (30 * (tp / 1000) * (1 + (tp - 1000) / 2000));

        -- Remove Frost
        if (target:getStatusEffect(EFFECT_FROST) ~= nil) then
            target:delStatusEffect(EFFECT_FROST);
        end;

        target:addStatusEffect(EFFECT_BURN, DOT, 3, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_BURN);
    end

    return tpHits, extraHits, criticalHit, damage;

end
