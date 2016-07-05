-----------------------------------
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local pet = player:getPet();
    if (pet == nil or pet:getLocalVar("isLuopan") == 0) then
        return MSGBASIC_REQUIRES_A_PET;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();
    local heal = player:getHP() * 0.25;
    pet:addHP(heal);
    player:delHP(heal);
end;