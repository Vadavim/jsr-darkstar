-----------------------------------------
--    ID: 14990
--    Blizzard Gloves
--  Enchantment: "Enblizzard"
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
    target:delEffect(EFFECT_ENSTONE);
    target:addEffect(EFFECT_ENSTONE, 12, 0, 300);
end;
