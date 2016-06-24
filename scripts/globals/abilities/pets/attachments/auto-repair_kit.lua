-----------------------------------
-- Attachment: Auto-repair Kit
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_HPP, 6)
    pet:addMod(MOD_REGEN, 1)
end

function onUnequip(pet)
    pet:delMod(MOD_HPP, 6)
    pet:delMod(MOD_REGEN, 1)
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end;
    if (maneuvers == 1) then
        pet:addMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 10) + bonus);
        pet:addMod(MOD_HPP, 6);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 15) + bonus);
        pet:addMod(MOD_HPP, 3);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 10) + bonus);
        pet:addMod(MOD_HPP, 6);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end;
    if (maneuvers == 1) then
        pet:delMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 10) + bonus);
        pet:delMod(MOD_HPP, 6);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 15) + bonus);
        pet:delMod(MOD_HPP, 3);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_REGEN, 1 + math.floor(pet:getMainLvl() / 10) + bonus);
        pet:delMod(MOD_HPP, 6);
    end
end
