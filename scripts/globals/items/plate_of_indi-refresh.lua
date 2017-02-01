
-----------------------------------------
-- OnItemCheck
-----------------------------------------

local learnID = 6075;

function onItemCheck(target)
    return target:canLearnSpell(learnID);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(learnID);
end;