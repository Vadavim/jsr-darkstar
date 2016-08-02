-----------------------------------------
-- ID: 4160
-- Item: Petrify Potion
-- Item Effect: This potion induces petrify.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_PETRIFICATION) == false) then
        target:addStatusEffect(EFFECT_PETRIFICATION,1,3,15);
    else
        target:messageBasic(423);
    end
    local effect = target:getStatusEffect(EFFECT_PETRIFICATION);
    if (effect ~= nil) then
        target:addMod(MOD_UDMGPHYS, -95);
        effect:addMod(MOD_UDMGPHYS, -95);
        target:addMod(MOD_UDMGMAGIC, -95);
        effect:addMod(MOD_UDMGMAGIC, -95);
    end

end;

