-----------------------------------------
-- ID: 4128
-- Item: Ether
-- Item Effect: Restores 20 MP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
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
	useEther(target, 20);
end;