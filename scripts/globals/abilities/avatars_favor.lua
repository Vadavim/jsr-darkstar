-----------------------------------
-- Ability: Avatars Favor
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local id = player:getPetID();
    if (((id >= 0 and id <= 16 ) or id == 20) and (player:getMP() > 30)) then
        return 0,0
    end;
    return MSGBASIC_UNABLE_TO_USE_JA,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();

    player:delMP(30);
    pet:addMod(MOD_REGEN_DOWN, 2 + player:getMainLvl() / 6);
    pet:addMod(MOD_CRITHITRATE, 5);
    pet:addMod(MOD_ATTP, 10);
    pet:addMod(MOD_DEFP, 10);
    pet:addMod(MOD_EVASION, 15);
    pet:addMod(MOD_ACC, 15);
    pet:addMod(MOD_MEVA, 15);
    pet:addMod(MOD_MATT, 10);
    pet:addMod(MOD_MACC, 15);
    pet:addMod(MOD_MDEF, 5);
    pet:addMod(MOD_STORETP, 15);
    pet:addMod(MOD_MOVE, 10);
    pet:addMod(MOD_ENMITY, 10);
    pet:addMod(MOD_HASTE_ABILITY, 50);
end;