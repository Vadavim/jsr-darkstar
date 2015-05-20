-----------------------------------------
-- ID: 4118
-- Item: Hi-Potion +2
-- Item Effect: Restores 120 HP
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
    usePotion(target, 200);
end;