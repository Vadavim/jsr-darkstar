-----------------------------------------
-- ID: 4247
-- Item: Page From Miratete's Memo
-- Grants 750 - 1,500 EXP
-- Does not grant Limit Points. 
--
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addExp(EXP_RATE * math.random(750,1500));
end;
