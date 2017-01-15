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
    if (((id >= 0 and id <= 16 ) or id == 20) and (player:getMP() > 40)) then
        return 0,0
    end;
    return MSGBASIC_UNABLE_TO_USE_JA,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();

    player:delMP(40);

    if (pet:getLocalVar("favor") == 0) then
--        pet:addMod(MOD_REGEN_DOWN, 2 + player:getMainLvl() / 5);
--        pet:addMod(MOD_REGEN, 1 + pet:getMaxHP() * 0.005);
        pet:addMod(MOD_CRITHITRATE, 5);
        pet:addMod(MOD_DEFP, 33);
        pet:addMod(MOD_MOVE, 35);
        pet:addMod(MOD_ENSPELL_DMG, 1 + player:getMainLvl() / 4);
        pet:addMod(MOD_ENMITY, 30);
        pet:addMod(MOD_STORETP, 30);
--        pet:addMod(MOD_HASTE_ABILITY, 200);
        pet:setLocalVar("favor", 1);
    end

end;