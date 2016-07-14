-----------------------------------------
--    ID: 14989
--    Aero Mufflers
--  Enchantment: "Enaero"
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
    target:delEffect(EFFECT_ENAERO);
    target:addEffect(EFFECT_ENAERO, 8, 0, 120);
end;
