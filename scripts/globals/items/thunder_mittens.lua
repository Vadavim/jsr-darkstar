-----------------------------------------
--    ID: 14987
--    Thunder Mittens
--  Enchantment: "Enthunder"
-----------------------------------------

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
    target:delEffect(EFFECT_ENTHUNDER);
    target:addEffect(EFFECT_ENTHUNDER, 8, 0, 120);
end;
