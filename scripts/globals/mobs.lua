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

function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)

    if (player:isPC()) then
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
