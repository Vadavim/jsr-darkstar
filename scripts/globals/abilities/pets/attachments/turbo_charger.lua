-----------------------------------
-- Attachment: Turbo Charger
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_HASTE_MAGIC, 51)
end

function onUnequip(pet)
    pet:delMod(MOD_HASTE_MAGIC, 51)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_HASTE_MAGIC, 51);
        pet:addMod(MOD_UFASTCAST, 8);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_HASTE_MAGIC, 51);
        pet:addMod(MOD_UFASTCAST, 8);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_HASTE_MAGIC, 51);
        pet:addMod(MOD_UFASTCAST, 8);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_HASTE_MAGIC, 51);
        pet:delMod(MOD_UFASTCAST, 8);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_HASTE_MAGIC, 51);
        pet:delMod(MOD_UFASTCAST, 8);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_HASTE_MAGIC, 51);
        pet:delMod(MOD_UFASTCAST, 8);
    end
end
