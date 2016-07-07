
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
    local pet = player:getPet();
    if (pet == nil or player:getPetID() ~= PET_WYVERN) then
        return;
    end

    local tpBonus = player:getTP() * 0.25;
    pet:addTP(tpBonus * 4);
    player:delTP(tpBonus);

    local level = pet:getMainLvl();
    if (level < 20) then
        pet:useJobAbility(624, target);
    elseif (level < 40) then
        pet:useJobAbility(625, target);
    elseif (level < 60) then
        pet:useJobAbility(626, target);
    else
        pet:useJobAbility(623, target);
    end




end;