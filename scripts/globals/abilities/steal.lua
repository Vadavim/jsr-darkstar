-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-- these are the quadavs that the thf af1 item can be stolen from
-- bronze quadav groupid = 7949
-- garnet quadav groupid = 7960
-- silver quadav groupid = 7977
-- zircorn quadav groupid = 7985
validThfQuestMobs = {17379367,17379368,17379459,17379470,17379477,17379489,17379493,17379495,17379501,17379505,17379509,
                    17379513,17379517,17379521,17379525,17379529,17379533,17379538,17379543,17379547,17379552,17379556,
                    17379560,17379565,17379569,17379573,17379577,17379581,17379585,17379597,17379363,17379364,17379462,
                    17379473,17379480,17379496,17379498,17379500,17379504,17379508,17379512,17379516,17379520,17379524,
                    17379528,17379532,17379536,17379541,17379546,17379550,17379555,17379559,17379563,17379568,17379572,
                    17379576,17379580,17379584,17379588,17379600,17379361,17379362,17379460,17379471,17379478,17379490,
                    17379491,17379497,17379502,17379506,17379510,17379514,17379518,17379522,17379526,17379530,17379534,
                    17379539,17379544,17379548,17379553,17379557,17379561,17379566,17379570,17379574,17379578,17379582,
                    17379586,17379598,17379365,17379366,17379461,17379472,17379479,17379492,17379494,17379499,17379503,
                    17379507,17379511,17379515,17379519,17379523,17379527,17379531,17379535,17379540,17379545,17379549,
                    17379554,17379558,17379562,17379567,17379571,17379575,17379579,17379583,17379587,17379599};

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:getFreeSlotsCount() == 0) then
        return MSGBASIC_FULL_INVENTORY,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local thfLevel;
    local stolen = 0;

    if(player:getMainJob() == JOB_THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end

    local stealMod = player:getMod(MOD_STEAL);

    local stealChance = 75 + stealMod * 2 + thfLevel - target:getMainLvl();

    stolen = target:getStealItem();
    --player:addTempItem( 4116, 1 );
    if(target:isMob() and math.random(100) < stealChance) then
        if (checkThfAfQuest(player, target) == true) then
            stolen = 4569;     
        end
        
        
        
        if (stolen ~=4569) then
            local item = stealTempItem(target:getMainLvl());
            if (item ~= 0) then
                player:addTempItem(item); 
                stolen = item;
            end
        else
            player:addItem(stolen);
        end
        
        target:itemStolen();
        ability:setMsg(125); -- Item stolen successfully
    else
        ability:setMsg(153); -- Failed to steal
    end

    return stolen;
end;


function checkThfAfQuest(player, target)

    local targid = target:getID();

    if(player:getVar("theTenshodoShowdownCS") == 3) then
        for key, value in pairs(validThfQuestMobs) do
            if value == targid then
                return true
            end
        end
    return false
    end
end;


function stealTempItem(level)
    if (level < 5) then
        return selectItem(4112, 4113, 4114); --Pot/Pot+1/Pot+2
    elseif (level < 10) then
        return selectItem(4113, 4114, 4115); --Pot+1/Pot+2/Pot+3
    elseif (level < 15) then
        return selectItem(4114, 4115, 4116); --Pot+2/Pot+3/HiPot
    elseif (level < 20) then
        return selectItem(4115, 4116, 4117); --Pot+3/HiPot/HiPot+1
    elseif (level < 25) then
        return selectItem(4116, 4117, 4118); --HiPot/HiPot+1/HiPot+2
    elseif (level < 30) then
        return selectItem(4117, 4118, 4119); --HiPot+1/HiPot+2/HiPot+3
    elseif (level < 35) then
        return selectItem(4118, 4119, 4120); --HiPot+2/HiPot+3/XPot
    elseif (level < 40) then
        return selectItem(4119, 4120, 4121); --HiPot+3/XPot/XPot+1
    elseif (level < 45) then
        return selectItem(4120, 4121, 4122); --XPot/XPot+1/XPot+2
    elseif (level < 50) then
        return selectItem(4121, 4122, 4123); --XPot+1/XPot+2/XPot+3
    elseif (level < 55) then
        return selectItem(4122, 4123, 4124); --XPot+2/XPot+3/MaxPot
    elseif (level < 60) then
        return selectItem(4123, 4124, 4125); --XPot+3/MaxPot/MaxPot+1
    elseif (level < 65) then
        return selectItem(4124, 4125, 4126); --MaxPot/MaxPot+1/MaxPot+2
    else
        return selectItem(4124, 4125, 4126); --MaxPot+1/MaxPot+2/MaxPot+3
    end
end;

function selectItem(item1, item2, item3)
    local rand = math.random(100);
    if (rand < 40) then
        return item1;
    elseif (rand < 60) then
        return item2;
    elseif (rand < 70) then
        return item3;
    elseif (rand < 78) then
        return 4115; --Remedy
    elseif (rand < 94) then
        return 5440; --Dusty Wing
    else
        return 4146; --Revitalizer
    end
end;