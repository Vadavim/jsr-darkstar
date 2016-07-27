-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +100% HP
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
        result = 111;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 900;
    target:addStatusEffect(EFFECT_MEDICINE, 1, 0, 900);
    local effect = target:getStatusEffect(EFFECT_MEDICINE);
    if (effect ~= nil) then
        target:addMod(MOD_STR, 15);
        target:addMod(MOD_VIT, 15);
        target:addMod(MOD_AGI, 15);
        target:addMod(MOD_DEX, 15);
        target:addMod(MOD_MND, 15);
        target:addMod(MOD_INT, 15);
        target:addMod(MOD_CHR, 15);
        effect:addMod(MOD_STR, 15);
        effect:addMod(MOD_VIT, 15);
        effect:addMod(MOD_AGI, 15);
        effect:addMod(MOD_DEX, 15);
        effect:addMod(MOD_MND, 15);
        effect:addMod(MOD_INT, 15);
        effect:addMod(MOD_CHR, 15);
    end

end;
