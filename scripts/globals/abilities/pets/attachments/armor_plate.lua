-----------------------------------
-- Attachment: Armor Plate
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_DMGPHYS, -5)
    pet:addMod(MOD_DEFP, 5)
end

function onUnequip(pet)
    pet:delMod(MOD_DMGPHYS, -5)
    pet:delMod(MOD_DEFP, 5)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_DMGPHYS, -2);
        pet:addMod(MOD_DEFP, 5);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_DMGPHYS, -2);
        pet:addMod(MOD_DEFP, 5);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_DMGPHYS, -5);
        pet:addMod(MOD_DEFP, 10);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_DMGPHYS, -2);
        pet:delMod(MOD_DEFP, 5);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_DMGPHYS, -2);
        pet:delMod(MOD_DEFP, 5);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_DMGPHYS, -5);
        pet:delMod(MOD_DEFP, 10);
    end
end
