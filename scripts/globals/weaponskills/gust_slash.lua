-----------------------------------
-- Gust Slash
-- Dagger weapon skill
-- Skill level: 40
-- Deals wind elemental damage. Damage varies with TP.
-- Will not stack with Sneak Attack.
-- Aligned with the Breeze Gorget.
-- Aligned with the Breeze Belt.
-- Element: Wind
-- Modifiers: DEX:20% ; INT:20%
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
    params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 3.5;
    params.str_wsc = 0.0; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_WIND;
    params.skill = SKILL_DAG;
    params.includemab = true;


    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.4; params.int_wsc = 0.8;
    end

    local hasSneak = player:getStatusEffect(EFFECT_SNEAK_ATTACK);

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WIND, SKILL_DAG);

    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_FROST)) then
        local DOT = math.floor(player:getMainLvl()/3) + 1;

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_WIND, target, DOT, mParams, 1.0);

        local duration = 30 * (tp / 1000);
        if (hasSneak) then
            DOT = DOT * 1.5;
            duration = duration * 1.5;
        end


        -- Remove Rasp
        target:delStatusEffect(EFFECT_RASP);

        target:addStatusEffect(EFFECT_CHOKE, DOT, 3, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_CHOKE);
    end


    return tpHits, extraHits, criticalHit, damage;

end
