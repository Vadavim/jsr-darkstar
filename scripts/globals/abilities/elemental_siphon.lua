-----------------------------------
-- Ability: Elemental Siphon
-- Drains MP from your summoned spirit.
-- Obtained: Summoner level 50
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
-- onAbilityCheck
-----------------------------------
ELE_NONE      = 0;
ELE_FIRE      = 1;
ELE_EARTH     = 2;
ELE_WATER     = 3;
ELE_WIND      = 4;
ELE_ICE       = 5;
ELE_LIGHTNING = 6;
-- added both because monsterstpmoves calls it thunder
ELE_THUNDER   = 6;
ELE_LIGHT     = 7;
ELE_DARK      = 8;

smnElements = {
    [0] = ELE_FIRE, [1] = ELE_ICE, [2] = ELE_AIR, [3] = ELE_EARTH, [4] = ELE_THUNDER, [5] = ELE_WATER,  [6] = ELE_LIGHT, [7] = ELE_DARK,
    [8] = ELE_LIGHT, [9] = ELE_DARK, [10] = ELE_FIRE, [11] = ELE_EARTH, [12] = ELE_WATER, [13] = ELE_WIND,
    [14] = ELE_ICE, [15] = ELE_THUNDER, [16] = ELE_DARK, [20] = ELE_LIGHT};

smnRecasts = {
    [0] = 288, [1] = 289, [2] = 290, [3] = 291, [4] = 292, [5] = 293,  [6] = 294, [7] = 295,
    [8] = 296, [9] = 297, [10] = 298, [11] = 299, [12] = 300, [13] = 301,
    [14] = 302, [15] = 303, [16] = 304, [20] = 307};

function onAbilityCheck(player,target,ability)
    local id = player:getPetID();
    if ((id >= 0 and id <= 16 ) or id == 20 ) then return 0,0 end;
    return MSGBASIC_UNABLE_TO_USE_JA,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local petID = player:getPetID();
    local pet = player:getPet();
    local spiritEle = smnElements[petID];
    local spiritRecast = smnRecasts[petID];
--    local spiritEle = player:getPetID() + 1; -- get the spirit's ID, then make it line up with element value for the day order.
    -- pet order: fire, ice, air, earth, thunder, water, light, dark
    -- day order: fire, earth, water, wind, ice, thunder, light, dark
--    if (spiritEle == 2) then
--        spiritEle = 5
--    elseif (spiritEle == 3) then
--        spiritEle = 4
--    elseif (spiritEle == 4) then
--        spiritEle = 2
--    elseif (spiritEle == 5) then
--        spiritEle = 6
--    elseif (spiritEle == 6) then
--        spiritEle = 3
--    end;
    
    local pEquipMods = player:getMod(MOD_ENHANCES_ELEMENTAL_SIPHON);
    local basePower = player:getSkillLevel(SKILL_SUM) + pEquipMods - 50;
    if (basePower < 0) then -- skill your summoning magic you lazy bastard !
        basePower = 0;
    end;
    local weatherDayBonus = 1;
    local dayElement = VanadielDayElement();
    local weather = player:getWeather();

    -- Day bonus/penalty
    if (dayElement == dayStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1;
    elseif (dayElement == dayWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1;
    end
    -- Weather bonus/penalty
    if (weather == singleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1;
    elseif (weather == singleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1;
    elseif (weather == doubleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.25;
    elseif (weather == doubleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.25;
    end
    
    local power = math.floor(basePower * weatherDayBonus * 0.5);
    if (petID >= 0 and petID <= 7) then power = power * 2 end;

--    power = utils.clamp(power, 0, spirit:getMP()); -- cap MP drained at spirit's MP
--    power = utils.clamp(power, 0, player:getMaxMP() - player:getMP()); -- cap MP drained at the max MP - current MP

--    spirit:delMP(power);
    player:setLocalVar("siphoned", 1);
    player:setLocalVar("siphonID", petID);
    player:setLocalVar("siphonTP", weatherDayBonus * pet:getTP());
    pet:delHP(999999);
    print(spiritRecast);
    player:insertSpellRecast(spiritRecast, 960);
--    player:addRecast(RECAST_MAGIC, spiritRecast, 3600);

    return player:addMP(power);
end;