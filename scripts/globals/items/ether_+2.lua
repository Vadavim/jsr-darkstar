-----------------------------------------
-- ID: 4130
-- Item: Ether +2
-- Item Effect: Restores 30 MP
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
	useEther(target, 30);
end;
