require("scripts/globals/common");
require("scripts/globals/jsr_utils");

local tier1 = {
    {{197}, "Pugils"},
    {{46, 47}, "Bats"},
    {{48}, "Bees"},
    {{55}, "Birds"},
    {{75, 76, 77, 372}, "Crabs"},
    {{174}, "Lizards"},
    {{216}, "Saplings"},
    {{178}, "Mandragora"},
    {{206, 404, 405}, "Rabbits"},
    {{258}, "Worms"},
    {{216}, "Saplings"},
    {{226}, "Sheep"},
};

local tier2 = {
    {{113, 374}, "Flies"},
    {{172, 369}, "Leeches"},
    {{49}, "Beetles"},
    {{79}, "Crawlers"},
    {{210, 376, 377}, "Raptors"},
    {{242}, "Tigers"},
    {{200, 201, 202}, "Quadav"},
    {{270}, "Yagudo"},
    {{189, 190}, "Orcs / Orcish Warmachines"},
    {{142, 143}, "Hounds"},
    {{116}, "Funguar"},
    {{133, 184, 327, 373}, "Goblins"},
    {{80}, "Dhalmels"},
};

local tier3 = {
    {{83, 84, 85, 367, 368}, "Dolls"},
    {{188}, "Opo-opo"},
    {{25}, "Antica"},
    {{81}, "Diremites"},
    {{98}, "Efts"},
    {{235, 370}, "Spiders"},
    {{227}, "Skeletons"},
    {{110}, "Evil Weapons"},
    {{115, 221, 222, 223, 359}, "Shadows / Fomor"},
    {{61}, "Cardians"},
    {{126, 127, 128, 129, 130, 328}, "Gigas"},
    {{66, 228, 229, 230}, "Slimes"},
    {{213}, "Sahagin"},
    {{71}, "Coeurl"},
};

local tier4 = {
    {{136}, "Goobbues"},
    {{4}, "Ahriman"},
    {{57}, "Buffalo"},
    {{139}, "Hecteyes"},
    {{70}, "Cockatrice"},
    {{135}, "Golems"},
    {{121}, "Ghosts"},
    {{212}, "Sabotender"},
    {{243, 244}, "Tonberries"},
    {{186}, "Morbols"},
    {{245}, "Treants"},
    {{58}, "Bugards"},
    {{59}, "Bugbears"},
    {{217}, "Scorpions"},
};

local tier5 = {
    {{87}, "Dragons"},
    {{125}, "Rocs"},
    {{266}, "Wyverns"},
    {{169, 358}, "Kindred"},
    {{78, 137, 138, 181, 220, 241, 255, 256}, "Empty"},
    {{3, 109, 122, 123, 124, 144, 194, 269, 271, 272}, "Luminians / Luminions"},
    {{26, 357}, "Antlions"},
    {{240}, "Tauri"},
    {{179}, "Manticores"},
    {{140, 141}, "Hippogryphs"},
};

local tier6 = {
    {{86}, "Doomed"},
    {{74}, "Corse"},
    {{251}, "Uragnite"},
    {{208}, "Rams"},
    {{68, 69, 82, 232}, "Bombs"},
    {{175}, "Magic Pots"},
    {{218, 219}, "Sea Monks"},
    {{99, 100, 101, 102, 103,104, 105, 106}, "Elementals"},
};

local function getRandomBounty(bountyList)
    local size = 0;
    for i,v in pairs(bountyList) do
        size = size + 1;
    end

    return math.random(1, size);
end

function doBountyUpdate()
    local lastMidnight = GetServerVariable("[BNT]Midnight");
    if (lastMidnight == 0 or lastMidnight < os.time()) then

        SetServerVariable("[BNT]Midnight", getMidnight());
        SetServerVariable("[BNT]1", getRandomBounty(tier1));
        SetServerVariable("[BNT]2", getRandomBounty(tier2));
        SetServerVariable("[BNT]3", getRandomBounty(tier3));
        SetServerVariable("[BNT]4", getRandomBounty(tier4));
        SetServerVariable("[BNT]5", getRandomBounty(tier5));
        SetServerVariable("[BNT]6", getRandomBounty(tier6));
    end
end

local function checkValidBounty(player)
    if(player:getVar("LastMidnight") ~= GetServerVariable("[BNT]Midnight")) then
        player:setVar("LastMidnight", GetServerVariable("[BNT]Midnight"));
        player:setVar("[BNT]1", 0);
        player:setVar("[BNT]2", 0);
        player:setVar("[BNT]3", 0);
        player:setVar("[BNT]4", 0);
        player:setVar("[BNT]5", 0);
        player:setVar("[BNT]6", 0);
    end
end

function addIfBountyMob(player, mob)
    checkValidBounty(player);
    local family = mob:getFamily();
    for tier,bountyList in pairs({tier1, tier2, tier3, tier4, tier5, tier6}) do
        local tierName = "[BNT]" .. tostring(tier);
        local curBounty = GetServerVariable(tierName);
        for i,familyid in pairs(bountyList[curBounty][1]) do
            if (familyid == family) then
                player:setVar(tierName, player:getVar(tierName) + 1);
                return true;
            end

        end
    end
    return false;
end

local function doBountyPrint(player, tier, maxKills, rewardAmount)
    doBountyUpdate();
    checkValidBounty(player);
    local tiers = {tier1, tier2, tier3, tier4, tier5, tier6};
    local tierName = "[BNT]" .. tostring(tier);
    local bountyList = tiers[tier];
    local curBounty = GetServerVariable(tierName);
    local bountyMob = bountyList[curBounty];
    local curReward = splitBitValue(player:getVar(tierName));
    local curKills = utils.clamp(curReward[2], 0, maxKills);
    player:SayToPlayer(bountyMob[2] .. ": " .. tostring(curKills) .. "/" .. tostring(maxKills) .. " (" .. tostring(rewardAmount) .. " XP/GIL Each)");
end

local function doBountyClaim(player, tier, maxKills, rewardAmount)
    doBountyUpdate();
    checkValidBounty(player);

    local tierName = "[BNT]" .. tostring(tier);
    local curReward = splitBitValue(player:getVar(tierName));
    local curKills = utils.clamp(curReward[2], 0, maxKills);
    local curClaimed = curReward[1];
    if (curKills > curClaimed) then
        local totalReward = (curKills - curClaimed) * rewardAmount;
        curClaimed = curKills;
        player:setVar(tierName, mergeBitValue(curClaimed, curKills));
        return totalReward;
    end

    return 0;
end


function printBounties(player)
    doBountyPrint(player, 1, 50, 20);
    doBountyPrint(player, 2, 50, 40);
    doBountyPrint(player, 3, 50, 60);
    doBountyPrint(player, 4, 50, 80);
    doBountyPrint(player, 5, 50, 100);
    doBountyPrint(player, 6, 10, 300);
end

function claimBounties(player)
    local reward = 0;
    reward = reward + doBountyClaim(player, 1, 50, 20);
    reward = reward + doBountyClaim(player, 2, 50, 40);
    reward = reward + doBountyClaim(player, 3, 50, 60);
    reward = reward + doBountyClaim(player, 4, 50, 80);
    reward = reward + doBountyClaim(player, 5, 50, 100);
    reward = reward + doBountyClaim(player, 6, 10, 300);

    if (reward > 0) then
        local rewardDict = {
            ["gil"] = reward,
            ["xp"] = reward,
        };
        jsrReward(player, rewardDict);
        return true;
    end

    player:SayToPlayer("Nothing to claim!");
    return false;
end



