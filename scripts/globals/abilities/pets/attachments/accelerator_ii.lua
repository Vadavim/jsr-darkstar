-----------------------------------
-- Attachment: Accelerator II
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_EVA, 10)
end

function onUnequip(pet)
    pet:delMod(MOD_EVA, 10)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_EVA, 12);
        pet:addMod(MOD_MOVE, 6);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_EVA, 6);
        pet:addMod(MOD_MOVE, 3);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_EVA, 12);
        pet:addMod(MOD_MOVE, 6);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_EVA, 12);
        pet:delMod(MOD_MOVE, 6);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_EVA, 6);
        pet:delMod(MOD_MOVE, 3);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_EVA, 12);
        pet:delMod(MOD_MOVE, 6);
    end
end
