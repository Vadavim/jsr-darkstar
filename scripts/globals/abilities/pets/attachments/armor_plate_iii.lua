-----------------------------------
-- Attachment: Armor Plate III
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_DMGPHYS, -15)
end

function onUnequip(pet)
    pet:delMod(MOD_DMGPHYS, -15)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_DMGPHYS, -10);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_DMGPHYS, -6);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_DMGPHYS, -6);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_DMGPHYS, -10);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_DMGPHYS, -6);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_DMGPHYS, -6);
    end
end
