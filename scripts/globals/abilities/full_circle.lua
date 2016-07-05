-----------------------------------
-- Ability: Gelus
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils")

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
    if (pet ~= nil) then
        local mpReturn = (pet:getHPP() / 100) * 0.5 * (pet:getLocalVar("mpSpent"));
        player:addMP(mpReturn);
        pet:delHP(5000);
    end

end;

