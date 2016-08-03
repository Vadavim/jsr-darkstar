-----------------------------------
-- Flaming Arrow
-- Archery weapon skill
-- Skill level: 5
-- Deals fire elemental damage. Damage varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: Fire
-- Modifiers: STR:16% ; AGI:25%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.ele = ELE_FIRE;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 4;
        params.str_wsc = 0.0; params.agi_wsc = 0.5; params.mnd_wsc = 1.0;
    end

    local isFireArrow = player:getEquipID(SLOT_AMMO) == 17322;
    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);

    -- add Burn
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_FIRE, SKILL_ARC);
    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_DROWN)) then
        local DOT = math.floor(player:getMainLvl()/3) + 1;
        if (isFireArrow) then
            DOT = math.floor(DOT * 1.5);
        end


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

    if (isFireArrow) then
        damage = math.floor(damage * 1.33);
    end

    return tpHits, extraHits, criticalHit, damage;

end
