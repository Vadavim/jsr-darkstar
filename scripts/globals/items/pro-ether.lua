-----------------------------------------
-- ID: 4140
-- Item: Pro-Ether
-- Item Effect: Restores 250 MP
-----------------------------------------

require("scripts/globals/status");
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