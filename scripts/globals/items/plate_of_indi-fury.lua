
-----------------------------------------
-- OnItemCheck
-----------------------------------------

local learnID = 6083;

function onItemCheck(target)
    return target:canLearnSpell(learnID);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(learnID);
end;