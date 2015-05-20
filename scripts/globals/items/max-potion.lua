-----------------------------------------
-- ID: 4124
-- Item: Max-Potion
-- Item Effect: Restores 500 HP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
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
    usePotion(target, 600);
end;