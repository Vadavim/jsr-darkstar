-----------------------------------------
--    ID: 4898
--    Air Spirit Pact
--    Teaches the summoning magic Air Spirit
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(290);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(290);
    target:addSpell(301);
end;
