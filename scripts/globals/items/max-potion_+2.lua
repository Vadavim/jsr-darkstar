-----------------------------------------
-- ID: 4126
-- Item: Max-Potion +2
-- Item Effect: Restores 650 HP
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
    usePotion(target, 800);
end;