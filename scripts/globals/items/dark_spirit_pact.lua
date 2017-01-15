-----------------------------------------
--    ID: 4903
--    Dark Spirit Pact
--    Teaches the summoning magic Dark Spirit
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(295);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(295);
    target:addSpell(297);
    target:addSpell(304);
end;
