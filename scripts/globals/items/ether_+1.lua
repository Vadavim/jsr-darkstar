-----------------------------------------
-- ID: 4129
-- Item: Ether +1
-- Item Effect: Restores 25 MP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/jsr_item");
require("scripts/globals/status");

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
	useEther(target, 25);
end;