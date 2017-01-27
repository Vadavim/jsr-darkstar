---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
cmdprops =
{
    permission = 0,
    parameters = "s"
};

local notoMonsters = {
    [ZONE_TAHRONGI] = {17256901, 17256899, 17256906, 18, 25}, -- Pixie, Digger, Allocamelus
    [ZONE_LATHEINE] = {17195474, 17195012, 17195477, 18, 25}, -- Goblin Arch, Giant Pugil, Pixie
    [ZONE_KONSCHTAT] = {17220002, 17219997, 17220007, 18, 25}, -- Pixie, Digger, Thunderhead
    [ZONE_SARUTA_WEST] = {17248612, 17248606, 10, 15}, -- Bakru, Yagudo Condottiere
    [ZONE_SARUTA_EAST] = {17252815, 17252900, 10, 15}, -- Bolster, Pyracmon
    [ZONE_RONFAURE_WEST] = {17187272, 17187282, 17187288, 10, 15}, -- Digger, Fighterchief, Gougetooth
    [ZONE_RONFAURE_EAST] = {17190915, 17191322, 10, 15}, -- Mud Pugil, Gawky Gawain
    [ZONE_GUSTABERG_NORTH] = {17211857, 17211930,10, 15}, -- Lead Quadav, Pyracmon
    [ZONE_GUSTABERG_SOUTH] = {17215954,10, 15}, -- Grylio

}
local function spawnNotoMob(player)
    local mobs = notoMonsters[player:getZoneID()];
    if (mobs == nil) then return false; end;

    local size = 0;
    for i,v in pairs(mobs) do
        size = size + 1;
    end

    local mobid = mobs[math.random(1, size - 2)];
    player:setLocalVar("notoSpawner", 1);
    local mob = GetMobByID(mobid);
    local level = player:getMainLvl();
    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos());
    if (level < mobs[size - 1]) then
        level = mobs[size - 1]
    elseif (level > mobs[size]) then
        level = mobs[size]
    end;

    mob:setLevelRange(level + 2, level + 2);

    -- update music for party
    player:ChangeMusic(0, 343);
    player:ChangeMusic(1, 343);
    player:ChangeMusic(2, 343);
    player:ChangeMusic(3, 343);

    local party = player:getParty(false);
    if (party ~= nil) then
        for i,member in ipairs(party) do
            if (member:isPC()) then
                member:ChangeMusic(0, 343);
                member:ChangeMusic(1, 343);
                member:ChangeMusic(2, 343);
                member:ChangeMusic(3, 343);
            end

        end
    end
    local spawnedMob = SpawnMob(mobid);
    local partySize = player:getPartySize(0);
    if (partySize > 4) then
        spawnedMob:addMobMod(MOBMOD_HP_SCALE, 20 * (partySize - 4));
    end
    spawnedMob:updateHealth();
    spawnedMob:addHP(99999);
    return true;

end


local function getLevelRange(player)
    local mobs = notoMonsters[player:getZoneID()];
    if (mobs == nil) then
        player:SayToPlayer("Can't spawn a notorious monster here!");
        return nil;
    end;

    local size = 0;
    for i,v in pairs(mobs) do
        size = size + 1;
    end
    return {mobs[size - 1], mobs[size]}

end


function onTrigger(player, command)
    local notoVar = "noto_z" .. tostring(player:getZoneID());
    local notoVal = player:getVar(notoVar);
    if (command == nil) then
        player:SayToPlayer("Usage: @noto check/spawn");
        return;
    end

    if (command == "check") then
        player:SayToPlayer("Current Zone Notoriety: " .. tostring(notoVal) .. "\n    You need 150 to spawn a notorious monster.");
        return;
    end

    if (command == "spawn") then
        if (notoVal < 150) then
            player:SayToPlayer("You only have " .. tostring(notoVal) .. " notoriety.\n    You need 150 to spawn a notorious monster!");
            return false;
        end

        if (not spawnNotoMob(player)) then
            player:SayToPlayer("Can't spawn a notorious monster here!");
            return false;
        end


        player:setVar(notoVar, notoVal - 150);

        return
    end


    player:SayToPlayer("Unknown command: " .. command);


    --        local target = player:getCursorTarget();
    --        player:SayToPlayer("CHA: " .. tostring(target:getStat(MOD_CHR)));
    --        player:SayToPlayer("DINT: " .. tostring(player:getStat(MOD_INT) - target:getStat(MOD_INT)));
    --        player:SayToPlayer("Earth: " .. tostring(target:getMod(MOD_EARTHDEF)) .. "/" .. tostring(target:getMod(MOD_EARTHRES)));
    --        player:SayToPlayer("Wind: " .. tostring(target:getMod(MOD_WINDDEF)) .. "/" .. tostring(target:getMod(MOD_WINDRES)));

    --    local mob = GetMobByID(17195474)
    --local level = player:getMainLvl();
    --    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos());
    --    mob:setLevelRange(level + 2, level + 2);
    --    SpawnMob(17195474);



    --    testPick();
    --    player:spawnPet(73);7
    --print(player:checkDistance(player:getPet()));
    --print(player:getRotPos());
    --player:dispelAllStatusEffect();

    --player:startEvent(0x7d00, 0, 0, 0, amount, 0, 0, 0, 0);

    local target = player:getCursorTarget();
    --    printf("Cool: %d\nDelay: %d\nStand: %d", target:getMobMod(MOBMOD_MAGIC_COOL), target:getMobMod(MOBMOD_MAGIC_DELAY), target:getMobMod(MOBMOD_STANDBACK_COOL));
    --    printf("Fast: %d\nUFast: %d", target:getMod(MOD_FASTCAST), target:getMod(MOD_UFASTCAST));
    if (target ~= nil) then
        player:SayToPlayer("STR: " .. tostring(target:getStat(MOD_STR))
                .. ", VIT: " .. tostring(target:getStat(MOD_VIT))
                .. ", DEX: " .. tostring(target:getStat(MOD_DEX))
                .. ", AGI: " .. tostring(target:getStat(MOD_AGI))
                .. ", INT: " .. tostring(target:getStat(MOD_INT))
                .. ", MND: " .. tostring(target:getStat(MOD_MND))
                .. "\nHP: " .. tostring(target:getHP())
                .. ", MP: " .. tostring(target:getMP())
                .. ", ATK: " .. tostring(target:getStat(MOD_ATT))
                .. ", DEF: " .. tostring(target:getStat(MOD_DEF))
                .. ", ACC: " .. tostring(target:getACC())
                .. ", EVA: " .. tostring(target:getEVA())
                .. ", DMG: " .. tostring(target:getWeaponDmg())
        )
    end


    --print("Skill: %d\n", player:getSkillLevel(SKILL_ARC));
    --local item = player:getStorageItem(LOC_INVENTORY, 3);
    --    printf("Augment: %d, Val: %d", item:getAugment(0));
    --printf("Augment: %d, Val: %d", item:getAugment(1));
    --printf("Augment: %d, Val: %d", item:getAugment(2));
    --printf("Augment: %d, Val: %d", item:getAugment(3));
end

--        if (target:hasStatusEffect(EFFECT_DEFENDER)) then
--            print("have");
--        end

--        target:addTP(1000);

--        player:SayToPlayer("Attack: " .. tostring(targ:getStat(MOD_ATT)) .. ", Defense: " .. tostring(targ:getStat(MOD_DEF)));
--        targ:useMobAbility(amount);
--        targ:setMobMod(MOBMOD_ADD_EFFECT,1);
--        targ:setModelId(amount);
--        player:SayToPlayer("Skill: " .. tostring(targ:getSkillLevel(SKILL_HEA)));
--);
--local area = player:getTargetsWithinArea(10.0, 16);
--for i,member in ipairs(area) do
--    print(member:getID());
--end








----        targ:useJobAbility(amount, targ);
--        end
--    blastReward(player);
--    print(player:aetAugmentCount(1064));
--    print(player:getSkillLevel(SKILL_ELE));
--    print(player:getWeaponSkillType(SLOT_RANGED));

