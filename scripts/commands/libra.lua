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
                .. ", LVL: " .. tostring(target:getMainLvl())
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

