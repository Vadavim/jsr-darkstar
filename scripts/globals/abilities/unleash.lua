-----------------------------------
-- Ability: Fight
-- Commands your pet to attack the target.
-- Obtained: Beastmaster Level 1
-- Recast Time: 10 seconds
-- Duration: N/A
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    end

    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();
    pet:addTP(1000);
    local target = pet:getTarget();
    if (target ~= nil and not player:isJugPet()) then
        local function doSic(mob)
            if mob:getTP() >= 1000 then
                mob:useMobAbility()
            elseif mob:hasSpellList() then
                mob:castSpell()
            else
                mob:queue(0,doSic)
            end

        end

        player:getPet():queue(0, doSic)
    end




end;
