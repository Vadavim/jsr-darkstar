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
    target:delEffect(EFFECT_ENBLIZZARD);
    target:addEffect(EFFECT_ENBLIZZARD, 28, 0, 300);
end;
