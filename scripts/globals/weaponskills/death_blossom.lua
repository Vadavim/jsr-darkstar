-----------------------------------
-- Death Blossom
-- Sword weapon skill (RDM main only)
-- Description: Delivers a threefold attack that lowers target's magic evasion. Chance of lowering target's magic evasion varies with TP. Murgleis: Aftermath effect varies with TP.
-- Lowers magic evasion by up to 10.
-- Effect lasts up to 55 seconds.
-- Available only after completing the Unlocking a Myth (Red Mage) quest.
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.
-- Modifiers: STR:30% ; MND:50%
-- 100%TP     200%TP      300%TP
--  4              4           4        new
-- 1.125      1.125      1.125        old
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");

local enspellElements = {[9] = ELE_FIRE, [10] = ELE_EARTH, [11] = ELE_WATER, [12] = ELE_WIND, [13] = ELE_ICE, [14] = ELE_THUNDER};
local enspellTypes = {[9] = EFFECT_ENFIRE_II, [10] = EFFECT_ENSTONE_II, [11] = EFFECT_ENWATER_II,
    [12] = EFFECT_ENAERO_II, [13] = EFFECT_ENBLIZZARD_II, [14] = EFFECT_ENTHUNDER_II};
local statuses = {EFFECT_POISON, EFFECT_POISON_II, EFFECT_SLOW, EFFECT_BLINDNESS, EFFECT_BIO, EFFECT_PARALYSIS, EFFECT_DISEASE, EFFECT_PLAGUE};
-----------------------------------
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {};
    params.numHits = 3;
    -- ftp damage mods (for Damage Varies with TP; lines are calculated in the function
    params.ftp100 = 1.125; params.ftp200 = 1.125; params.ftp300 = 1.125;
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.6;
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    -- critical mods, again in % (ONLY USE FOR critICAL HIT VARIES WITH TP)
    params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
    params.canCrit = false;
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0.0; params.acc200=0.0; params.acc300=0.0;
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atkmulti = 1;
    
    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.0; params.ftp200 = 1.3; params.ftp300 = 1.6;
    end

    local enspell = player:getMod(MOD_ENSPELL)
    if (enspell ~= 0) then params.ele = enspellElements[enspell] end;
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0) then
        local duration = ((tp/1000) * 30);
        local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_DARK, SKILL_SWD);
        if (target:hasStatusEffect(EFFECT_MAGIC_EVASION_DOWN_II) == false and resist >= 0.25) then
            target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN_II, 20, 0, duration * resist);
            target:setPendingMessage(278, EFFECT_MAGIC_EVASION_DOWN);
        end

        local enspellEffect = player:getStatusEffect(enspellTypes[enspell]);
        if (enspell >= 9 and enspell <= 14 and enspellEffect ~= nil) then
            local enspellElement = enspellElements[enspell];
            local subPower = enspellEffect:getSubPower() + 1;
            resist = applyResistanceWeaponskill(player, target, params, tp, enspellElement, SKILL_SWD);
            if (enspellElement == ELE_WATER and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_POISON_II) == false) then
                    target:addStatusEffect(EFFECT_POISON_II, subPower, 0, duration * resist);
                    target:setPendingMessage(277, EFFECT_POISON_II);
                end
            elseif (enspellElement == ELE_FIRE and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_PLAGUE) == false) then
                    target:addStatusEffect(EFFECT_PLAGUE, subPower / 4, 0, duration * resist);
                    target:setPendingMessage(277, EFFECT_PLAGUE);
                end
            elseif (enspellElement == ELE_ICE and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_PARALYSIS_II) == false) then
                    target:addStatusEffect(EFFECT_PARALYSIS_II, subPower / 2, 0, duration * resist);
                    target:setPendingMessage(277, EFFECT_PARALYSIS_II);
                end
            elseif (enspellElement == ELE_EARTH and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_SLOW_II) == false) then
                    target:addStatusEffect(EFFECT_SLOW_II, subPower * 6, 0, duration * resist);
                    target:setPendingMessage(277, EFFECT_SLOW_II);
                end
            elseif (enspellElement == ELE_WIND and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_EVASION_DOWN_II) == false) then
                    target:addStatusEffect(EFFECT_EVASION_DOWN_II, subPower, 0, duration * resist);
                    target:setPendingMessage(278, EFFECT_EVASION_DOWN_II);
                end
            elseif (enspellElement == ELE_THUNDER and resist >= 0.25) then
                if (target:hasStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN) == false) then
                    target:addStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN, subPower / 2, 0, duration * resist);
                    target:setPendingMessage(278, EFFECT_CRIT_HIT_EVASION_DOWN);
                end
            end

            -- Reset power of Enspell II
            local enspellDuration = enspellEffect:getDuration();
            local enspellStartTime = enspellEffect:getStartTime();
            local enspellTick = enspellEffect:getTick();
            local enspellPower = enspellEffect:getPower();
            local enspellTier = enspellEffect:getTier();
            local enspellEffectId = enspellEffect:getType();
            local enspellSubId = enspellEffect:getSubType();
            player:delStatusEffectSilent(enspellTypes[enspell]);
            player:addStatusEffect(enspellEffectId, enspellPower, enspellTick, enspellDuration,
                enspellSubId, 0, enspellTier);
            local newEffect = player:getStatusEffect(enspellEffectId);
            newEffect:setStartTime(enspellStartTime);

        end

    end

    if (enspell >= 9 and enspell <= 14) then
        local params = {}; params.bonusmab = 0; params.includemab = false;
        damage = addBonusesAbility(player, enspellElements[enspell], target, damage, params, 1.0);
    end

    local bonusMult = 1.0;
    for i=1,8 do
        if (target:hasStatusEffect(statuses[i])) then bonusMult = bonusMult + 0.1 end;
    end

    damage = damage * bonusMult;






    if ((player:getEquipID(SLOT_MAIN) == 18995) and (player:getMainJob() == JOBS.RDM)) then
        if (damage > 0) then 
            local params = initAftermathParams()
            params.subpower.lv1 = 2
            params.subpower.lv2 = 3
            params.subpower.lv3 = 1
            params.power.lv2_inc = 1
            applyAftermathEffect(player, tp, params)
        end
    end
    return tpHits, extraHits, criticalHit, damage;
end
