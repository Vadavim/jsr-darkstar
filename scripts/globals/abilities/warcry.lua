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
        tpBonus = 250 + merit;
        chance = 10;
    else
        power = math.floor((player:getSubLvl()/4)+4.75)/256;
        tpBonus = 125 + merit;
        chance = 5;
    end

    power = power * 100;
    duration = duration + player:getMod(MOD_WARCRY_DURATION);

    if (player:hasStatusEffect(EFFECT_BERSERK) == false) then
        tpBonus = 0;
    end

    target:addStatusEffect(EFFECT_WARCRY,power,0,duration,0,tpBonus);

    -- Volker's Warcry is enhanced
    local level = player:getMainLvl();
    if (player:getLocalVar("rank") >= 9 and player:getLocalVar("isAlly") == 73 and level >= 45) then
        target:addTP(250);
        if (player:getLocalVar("rank") >= 13 and level >= 65) then
            local effect = target:getStatusEffect(EFFECT_WARCRY);
            if (effect ~= nil) then
                target:addMod(MOD_REGEN, level / 2);
                effect:addMod(MOD_REGEN, level / 2);

                if (player:getLocalVar("rank") >= 15 and level >= 75) then
                    target:addMod(MOD_DOUBLE_ATTACK, 25);
                    effect:addMod(MOD_DOUBLE_ATTACK, 25);
                end

            end

        end
    end


    if (player:hasStatusEffect(EFFECT_DEFENDER)) then
        local effect = target:getStatusEffect(EFFECT_WARCRY);
        if (effect ~= nil) then
            effect:addMod(MOD_DEFP, power);
            target:addMod(MOD_DEFP, power);
            effect:addMod(MOD_NULL_PHYSICAL_DAMAGE, chance + merit / 5);
            target:addMod(MOD_NULL_PHYSICAL_DAMAGE, chance + merit / 5);
        end
    end

end;