-----------------------------------
-- Attachment: Stabilizer II
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
end

function onUnequip(pet)
end

function onManeuverGain(pet,maneuvers)
    pet:setMod(MOD_ENSPELL,6);
    if (maneuvers == 1) then
        pet:addMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
        pet:setMod(MOD_ENSPELL, 0);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_ENSPELL_DMG,1 + pet:getMainLvl() / 3.5);
    end
end
