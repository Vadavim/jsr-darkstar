-----------------------------------
-- Global version of onMobDeath
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onMobDeathEx
-----------------------------------

-- item, min, max, zone, job, system, family
local nmRewards = {
    {748, 1, 99, 0, 0, 0, 0}, -- Gold Beastcoin
    {749, 1, 99, 0, 0, 0, 0}, -- Mythril Beastcoin
    {760, 1, 99, 0, 0, 0, 0}, -- Silver Beastcoin
    {1875, 1, 99, 0, 0, 0, 0}, -- Ancient Beastcoin
    {4104, 1, 99, 0, 0, 0, 0}, -- Fire Cluster
    {4105, 1, 99, 0, 0, 0, 0}, -- Ice Cluster
    {4106, 1, 99, 0, 0, 0, 0}, -- Wind Cluster
    {4107, 1, 99, 0, 0, 0, 0}, -- Earth Cluster
    {4108, 1, 99, 0, 0, 0, 0}, -- Lightning Cluster
    {4109, 1, 99, 0, 0, 0, 0}, -- Water Cluster
    {4110, 1, 99, 0, 0, 0, 0}, -- Light Cluster
    {4111, 1, 99, 0, 0, 0, 0}, -- Dark Cluster
    {4145, 1, 99, 0, 0, 0, 0}, -- Elixir
    {4144, 25, 99, 0, 0, 0, 0}, -- Hi-Elixir
    {4254, 50, 99, 0, 0, 0, 0}, -- Megalixer
    {4123, 25, 99, 0, 0, 0, 0}, -- Icarus Wing
    {4155, 1, 99, 0, 0, 0, 0}, -- Remedy
    {4149, 25, 99, 0, 0, 0, 0}, -- Panacea

    {4751, 20, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Erase
    {4720, 25, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Flash
    {4704, 30, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Auspice
    {4629, 30, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Holy
    {4702, 35, 70, 0, JOBS.WHM, 0, 0}, -- Scroll of Sacrifice
    {4750, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Reraise III
    {4613, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Cure V
    {4748, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Raise III
};

function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)

    if (not player:isPC()) then return; end;

    local diff = player:getMainLvl() - mob:getMainLvl();
    diff = (diff * diff) / 2.5;
    if (diff <= 0) then diff = 1; end
    if (math.random(0, 100) < diff) then
        rewardTemporaryItem(player);
    end

    if (mob:getMobMod(MOBMOD_HARD_MODE) > 0) then
        diff = diff * 2;
        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end
    end

    local zid = player:getZoneID()
    local fid = mob:getFamily()
    local sid = mob:getSystem()
    local fname = "achv_f" .. fid .. "_kill"
    local zname = "achv_z" .. zid .. "_kill"
    local sname = "achv_s" .. sid .. "_kill"
    player:setVar(zname, player:getVar(zname) + 1)
    player:setVar(fname, player:getVar(fname) + 1)
    player:setVar(sname, player:getVar(sname) + 1)
    if (mob:isNM()) then
        local NMname = "achv_NM" .. zid .. "_kill"
        player:setVar(NMname, player:getVar(NMname) + 1)

        -- special rewards for fighting NM
        if (not mob:isMobType(0x20) and not mob:isMobType(0x10)) then
        end

    end









    -- Things that happen only to the person who landed killing blow
    if (isKiller == true) then
        -- DRK quest - Blade Of Darkness
        local BladeofDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
        local BladeofDeath = player:getQuestStatus(BASTOK, BLADE_OF_DEATH);
        local ChaosbringerKills = player:getVar("ChaosbringerKills");
        if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then
            if (player:getEquipID(SLOT_MAIN) == 16607 and isWeaponSkillKill == false) then
                if (ChaosbringerKills < 200) then
                    player:setVar("ChaosbringerKills", ChaosbringerKills + 1);
                end
            end
        end
    end

    -- Things that happen to any player in the party/alliance
    if (player:getCurrentMission(WINDURST) == A_TESTING_TIME) then
        if (player:hasCompletedMission(WINDURST,A_TESTING_TIME) and player:getZoneID() == 118) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        elseif (player:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and player:getZoneID() == 117) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        end
    end
end;
