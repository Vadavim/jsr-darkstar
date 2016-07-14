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
    target:delEffect(EFFECT_ENFIRE);
    target:addEffect(EFFECT_ENFIRE, 20, 0, 300);
end;
