-----------------------------------
-- Attachment: Coiler
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_CRITHITRATE, 3)
    pet:addMod(MOD_CRIT_DMG_INCREASE, 5)
end

function onUnequip(pet)
    pet:delMod(MOD_CRITHITRATE, 3)
    pet:delMod(MOD_CRIT_DMG_INCREASE, 5)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_CRITHITRATE, 2);
        pet:addMod(MOD_CRIT_DMG_INCREASE, 5)
    elseif (maneuvers == 2) then
        pet:addMod(MOD_CRITHITRATE, 2);
        pet:addMod(MOD_CRIT_DMG_INCREASE, 5)
    elseif (maneuvers == 3) then
        pet:addMod(MOD_CRITHITRATE, 2);
        pet:addMod(MOD_CRIT_DMG_INCREASE, 5)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_CRITHITRATE, 2);
        pet:delMod(MOD_CRIT_DMG_INCREASE, 5)
    elseif (maneuvers == 2) then
        pet:delMod(MOD_CRITHITRATE, 2);
        pet:delMod(MOD_CRIT_DMG_INCREASE, 5)
    elseif (maneuvers == 3) then
        pet:delMod(MOD_CRITHITRATE, 2);
        pet:delMod(MOD_CRIT_DMG_INCREASE, 5)
    end
end
