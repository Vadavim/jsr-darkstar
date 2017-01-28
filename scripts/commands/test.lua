---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
cmdprops =
{
    permission = 1,
    parameters = "i"
};


function onTrigger(player, amount)
--        local target = player:getCursorTarget();
--        player:SayToPlayer("CHA: " .. tostring(target:getStat(MOD_CHR)));
--        player:SayToPlayer("DINT: " .. tostring(player:getStat(MOD_INT) - target:getStat(MOD_INT)));
--        player:SayToPlayer("Earth: " .. tostring(target:getMod(MOD_EARTHDEF)) .. "/" .. tostring(target:getMod(MOD_EARTHRES)));
--        player:SayToPlayer("Wind: " .. tostring(target:getMod(MOD_WINDDEF)) .. "/" .. tostring(target:getMod(MOD_WINDRES)));

--    local mob = GetMobByID(17195474) -- Goblin
--    local mob = GetMobByID(17195012) -- Giant Pugil
--    local mob = GetMobByID(17195477) -- Pixie

--local rewards = {["item"] = 18610 }
--jsrReward(player, rewards);


local mobid = 17187288;
--
local mob = GetMobByID(mobid) -- Giant Pugil
local level = player:getMainLvl();
    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos());
    mob:setLevelRange(level + 2, level + 2);
player:setLocalVar("notoSpawner", 1);
player:ChangeMusic(0, 343);
player:ChangeMusic(1, 343);
player:ChangeMusic(2, 343);
player:ChangeMusic(3, 343);
SpawnMob(mobid); -- Giant Pugil

local party = player:getParty(true);
if (party ~= nil) then
    for i,member in ipairs(party) do
        member:addHP(9999);
        member:addMP(9999);
    end
end



--    SpawnMob(17195474);
--SpawnMob(17195477);
-- Boss: 342
-- Fight: 343 (upbeat)
-- Big Fight: 187
-- Fast Paced Promathia Fight: 216

-- Pixie Konschatat: 17220002
    -- Goblin Digger: 17219997
    -- Thunderhead: 17220007

    -- Tahrongi
    -- Pixie: 17256901
    -- Goblin Arch: 17256899
    -- Allocam: 17256906

end
