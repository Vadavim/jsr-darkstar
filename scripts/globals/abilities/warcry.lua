-----------------------------------
-- Ability: Warcry
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local merit = player:getMerit(MERIT_SAVAGERY);
    local power = 0;
    local duration = 30;
    local chance = 0;

    local tpBonus = 0;
    if player:getMainJob() == 1 then
        power = math.floor((player:getMainLvl()/4)+4.75)/256;
        tpBonus = 200 + merit;
        chance = 10;
    else
        power = math.floor((player:getSubLvl()/4)+4.75)/256;
        tpBonus = 100 + merit;
        chance = 5;
    end

    power = power * 100;
    duration = duration + player:getMod(MOD_WARCRY_DURATION);

    if (player:hasStatusEffect(EFFECT_BERSERK) == false) then
        tpBonus = 0;
    end

    target:addStatusEffect(EFFECT_WARCRY,power,0,duration,0,tpBonus);

    if (player:hasStatusEffect(EFFECT_DEFENDER)) then
        local effect = target:getStatusEffect(EFFECT_WARCRY);
        if (effect ~= nil) then
            effect:addMod(MOD_NULL_PHYSICAL_DAMAGE, chance + merit / 5);
            target:addMod(MOD_NULL_PHYSICAL_DAMAGE, chance + merit / 5);
        end
    end

end;