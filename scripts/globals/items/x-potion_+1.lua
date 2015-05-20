-----------------------------------------
-- ID: 4121
-- Item: X-Potion +1
-- Item Effect: Restores 160 HP
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
    usePotion(target, 350);
end;