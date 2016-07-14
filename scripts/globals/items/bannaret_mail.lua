-----------------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-----------------------------------------

require("scripts/globals/settings");
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
    if (target:hasStatusEffect(EFFECT_ENMITY_BOOST) == false) then
        target:addStatusEffect(EFFECT_ENMITY_BOOST,2,0,300);
        local effect = target:getStatusEffect(EFFECT_ENMITY_BOOST);
        if (effect ~= nil) then
            target:addMod(MOD_HP, 15);
            effect:addMod(MOD_HP, 15);
        end

    else
        target:messageBasic(423);
    end

end;