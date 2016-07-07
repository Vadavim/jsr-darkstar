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
    parameters = "s"
};


function onTrigger(player, amount, target)
--    testPick();
--    player:spawnPet(73);7
--print(player:checkDistance(player:getPet()));
--print(player:getRotPos());
    local targ = player:getCursorTarget();
    if (targ ~= nil) then
--        player:SayToPlayer("Attack: " .. tostring(targ:getStat(MOD_ATT)) .. ", Defense: " .. tostring(targ:getStat(MOD_DEF)));
--        targ:useMobAbility(amount);
        targ:setModelId(amount);
    end
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
end;