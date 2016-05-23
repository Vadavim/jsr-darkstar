---------------------------------------------------------------------------------------------------
-- func: test
-- desc: Allows character to upgrade their storage for a cost.
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop");
cmdprops =
{
    permission = 0,
    parameters = "ss"
};



function onTrigger(player,storage) 
    local boostAmount = player:getMainLvl()/2;
    player:addStatusEffect(EFFECT_ATMA,boostAmount,3,60);
end;

