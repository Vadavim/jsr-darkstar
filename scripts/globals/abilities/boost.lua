-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    ability:setRecast(0);
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local sHands = player:getEquipID(SLOT_HANDS);
    local power = 2;
    local tpBonus = math.floor(utils.clamp(player:getTP() * 0.05, 0, 50));
    local subPower = 50 + tpBonus + math.floor(25 * (1 - player:getHPP() / 100));

    if (player:getMainJob() ~= JOBS.MNK) then
        subPower = subPower - 25;
    end

    player:delTP(tpBonus);
    if (sHands == 13962 or sHands == 14891) then
        subPower = subPower + 15;
    end

    if (player:hasStatusEffect(EFFECT_FOCUS)) then
        subPower = subPower + 10;
    end


    if (player:getLocalVar("critHit") == 1) then
        player:setLocalVar("critHit", 0);
        subPower = subPower + 25;
    end

    if (player:getLocalVar("guarded") == 1) then
        player:setLocalVar("guarded", 0);
        subPower = subPower + 25;
    end

    if (player:getLocalVar("parried") == 1) then
        player:setLocalVar("parried", 0);
        subPower = subPower + 25;
    end

    if (player:getLocalVar("counterAttack") == 1) then
        player:setLocalVar("counterAttack", 0);
        subPower = subPower + 25;
    end


    local curPower = subPower;
    local curBoosts = power / 2;

    if (player:hasStatusEffect(EFFECT_BOOST) == true) then
        local effect = player:getStatusEffect(EFFECT_BOOST);
        if (effect:getPower() >= 6) then
            player:delHP(1 + player:getMainLvl() * 0.75 * effect:getPower());
            if (math.random(0,99) < 10) then
                player:delStatusEffect(EFFECT_BOOST);
                return EFFECT_BOOST;
            end
        end

        curBoosts = curBoosts + effect:getPower() / 2;
        curPower = curPower + effect:getSubPower();

        effect:setPower(effect:getPower() + power);
        effect:setSubPower(curPower);
        player:addMod(MOD_ATTP,power);
    else
        player:addStatusEffect(EFFECT_BOOST,power,1,180, 0, subPower);
    end

    player:SayToPlayer("Boosts: " .. tostring(curBoosts) .. ", Power: " .. tostring(curPower));
    return EFFECT_BOOST;
end;