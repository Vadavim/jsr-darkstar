-----------------------------------
-- Attachment: Inhibitor
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_OCCULT_ACUMEN, 10)
end

function onUnequip(pet)
    pet:addMod(MOD_OCCULT_ACUMEN, 10)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_STORETP, 25);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_STORETP, 25);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_STORETP, 50);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_STORETP, 25);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_STORETP, 25);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_STORETP, 50);
    end
end
