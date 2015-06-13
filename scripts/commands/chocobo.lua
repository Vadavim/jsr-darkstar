---------------------------------------------------------------------------------------------------
-- func: reload
-- desc: Reloads a script.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, chocobo)
    if (not player:canUseChocobo() or player:getTarget() ~= nil or player:getHPP() < 100) then
        return;
    end
    
    local level = player:getMainLvl();
    local cost = 100 + level * 15;
    local currentGil = player:getGil();
    if (currentGil < cost) then
        return;
    end
    player:delGil(cost);
    player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,0,0,1200,true);
    
end