-----------------------------------
-- Rock Crusher
-- Staff weapon skill
-- Skill Level: 40
-- Delivers an earth elemental attack. Damage varies with TP.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: Earth
-- Modifiers: STR:40% ; INT:40%
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
    params.ftp100 = 1; params.ftp200 = 2; params.ftp300 = 2.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_EARTH;
    params.skill = SKILL_STF;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4; params.int_wsc = 0.4;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);

    -- add Burn
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_EARTH, SKILL_STF);
    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_CHOKE))then
        local DOT = math.floor(player:getMainLvl()/3) + 1;

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_EARTH, target, DOT, mParams, 1.0);

        local boost = player:getStatusEffect(EFFECT_BOOST);
        if (boost ~= nil) then
            local bSubPower = boost:getSubPower();
            DOT = DOT * (1 + bSubPower / 200);
            player:delStatusEffect(EFFECT_BOOST);
        end

        local duration = (30 * (tp / 1000) * (1 + (tp - 1000) / 2000));

        -- Remove Shock
        if (target:getStatusEffect(EFFECT_SHOCK) ~= nil) then
            target:delStatusEffect(EFFECT_SHOCK);
        end;

        target:addStatusEffect(EFFECT_RASP, DOT, 3, duration * resist);
        target:setPendingMessage(277, EFFECT_RASP);
    end


    return tpHits, extraHits, criticalHit, damage;

end
