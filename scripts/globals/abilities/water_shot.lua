-----------------------------------
-- Ability: Water Shot
-- Consumes a Water Card to enhance water-based debuffs. Deals water-based magic damage
-- Drown Effect: Enhanced DoT and STR-
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/weaponskills");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if (player:getWeaponSkillType(SLOT_RANGED) ~= SKILL_MRK or player:getWeaponSkillType(SLOT_AMMO) ~= SKILL_MRK) then
        return 216,0;
    end
    if (player:hasItem(2181, 0) or player:hasItem(2974, 0)) then
        return 0,0;
    else
        return 71, 0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local params = {};
    params.includemab = true;
    local dmg = (2 * player:getRangedDmg() + player:getAmmoDmg() + player:getMod(MOD_QUICK_DRAW_DMG)) * 1 + player:getMod(MOD_QUICK_DRAW_DMG_PERCENT)/100;
    dmg  = addBonusesAbility(player, ELE_WATER, target, dmg, params);
    dmg = dmg * applyResistanceAbility(player,target,ELE_WATER,SKILL_MRK, (player:getStat(MOD_AGI)/2) + player:getMerit(MERIT_QUICK_DRAW_ACCURACY));
    dmg = adjustForTarget(target,dmg,ELE_WATER);
    
    target:takeWeaponskillDamage(player, dmg, SLOT_RANGED, 1, 0, 0); -- targetTPMult is 0 because Quick Draw gives no TP to the mob
    target:updateEnmityFromDamage(player,dmg);
    
    local effects = {};
    local counter = 1;
    local drown = target:getStatusEffect(EFFECT_DROWN);
    if (drown ~= nil) then
        effects[counter] = drown;
        counter = counter + 1;
    end
    local poison = target:getStatusEffect(EFFECT_POISON);
    if (poison ~= nil) then
        effects[counter] = poison;
        counter = counter + 1;
    end
    local threnody = target:getStatusEffect(EFFECT_THRENODY);
    if (threnody ~= nil and threnody:getSubPower() == MOD_FIRERES) then
        effects[counter] = threnody;
        counter = counter + 1;
    end

    target:pushSkillchain(18); -- Shadowstitch: Reverberation
    if counter > 1 then
        for i = 1, counter do
            local effect = effects[i];
            local duration = effect:getDuration();
            local startTime = effect:getStartTime();
            local tick = effect:getTick();
            local power = effect:getPower();
            local subpower = effect:getSubPower();
            local tier = effect:getTier();
            local effectId = effect:getType();
            local subId = effect:getSubType();
            power = power * 1.33;
            target:delStatusEffectSilent(effectId);
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier);
            local newEffect = target:getStatusEffect(effectId);
            newEffect:setStartTime(startTime);
        end
    end

    local del = player:delItem(2181, 1) or player:delItem(2974, 1)
    target:updateClaim(player);
    return dmg;
end;
