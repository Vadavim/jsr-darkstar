-----------------------------------
-- Ability: Snarl
-- Transfers hate to your pet. Only works on pets invoked with the "Call Beast" ability.
-- Obtained: Beastmaster Level 45
-- Recast Time: 30 seconds
-- Duration: N/A
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local bonus = 0;
    if (not player:isJugPet()) then
        bonus = 12;
    end

    local pet = player:getPet();

    pet:addMod(MOD_ATTP, 25 + bonus);
    pet:addMod(MOD_MATT, 25 + bonus);
    pet:addMod(MOD_DEFP, 25 + bonus);
    pet:addMod(MOD_MDEF, 25 + bonus);
    pet:addMod(MOD_MEVA, 30 + bonus);
    pet:addMod(MOD_REGEN, pet:getMainLvl() / 3);
    pet:addMod(MOD_MACC, 30 + bonus);
    pet:addMod(MOD_ACC, 30 + bonus);
    pet:addMod(MOD_EVASION, 30 + bonus);
    pet:addStatusEffect(EFFECT_DOOM, 10, 30, 320);

--    local function dieNow(mob)
--        mob:setHP(0);
--    end
--
--    pet:queue(300000, dieNow)
    return 0;
end;
