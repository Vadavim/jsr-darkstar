
-----------------------------------------
-- OnItemCheck
-----------------------------------------

local learnID = 6081;

function onItemCheck(target)
    return target:canLearnSpell(learnID);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(learnID);
end;