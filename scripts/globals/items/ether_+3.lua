-----------------------------------------
-- ID: 4131
-- Item: Ether +3
-- Item Effect: Restores 40 MP
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
	useEther(target, 40);
end;
