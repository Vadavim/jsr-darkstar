-----------------------------------
-- Ability: Release
-- Sends the avatar away.
-- Obtained: Summoner Level 1
-- Recast Time: 10 seconds (shared by all avatars)
-----------------------------------

require("scripts/globals/settings");
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
    local id = player:getPetID();
    if (pet ~= nil and id >= 10 and id <= 20) then
        local hpp = pet:getHPP();
        player:addMP((hpp / 100.0) * (10 + player:getMainLvl() * 3) * 0.75);
    end
    target:despawnPet();
    target:delStatusEffect(EFFECT_AVATAR);
end;