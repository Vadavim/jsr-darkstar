-----------------------------------------
-- ID: 5255
-- Item: Hyper-Ether
-- Item Effect: Restores 125 MP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/jsr_item");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return checkEther(target);
end;


-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    useEther(target, 250);
end;
