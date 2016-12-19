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
--    testPick();
--    player:spawnPet(73);7
--print(player:checkDistance(player:getPet()));
--print(player:getRotPos());
--player:dispelAllStatusEffect();

    local target = player:getCursorTarget();
    printf("Cool: %d\nDelay: %d\nStand: %d", target:getMobMod(MOBMOD_MAGIC_COOL), target:getMobMod(MOBMOD_MAGIC_DELAY), target:getMobMod(MOBMOD_STANDBACK_COOL));
    printf("Fast: %d\nUFast: %d", target:getMod(MOD_FASTCAST), target:getMod(MOD_UFASTCAST));
    if (target ~= nil) then
        player:SayToPlayer("STR: " .. tostring(target:getStat(MOD_STR))
            .. ", VIT: " .. tostring(target:getStat(MOD_VIT))
                .. ", DEX: " .. tostring(target:getStat(MOD_DEX))
                .. ", INT: " .. tostring(target:getStat(MOD_INT))
                .. ", MND: " .. tostring(target:getStat(MOD_MND)))
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
