-----------------------------------------
-- ID: 4119
-- Item: Hi-Potion +3
-- Item Effect: Restores 130 HP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_item");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return checkPotion(target);
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    usePotion(target, 225);
end;