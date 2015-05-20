-----------------------------------------
-- ID: 4136
-- Item: Super Ether
-- Item Effect: Restores 100 MP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
local mMP = target:getMaxMP();
local cMP = target:getMP();

if (mMP == cMP) then
	result = 56; -- Does not let player use item if their hp is full

end

if (target:hasStatusEffect(EFFECT_MEDICINE)) then
    result = 111;
end
	
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_MEDICINE,0,0,60);
	target:messageBasic(25,0,target:addMP(120*ITEM_POWER));
end;
