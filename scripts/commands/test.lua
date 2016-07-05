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
--    player:spawnPet(73);
--print(player:checkDistance(player:getPet()));
--print(player:getRotPos());
--    local targ = player:getCursorTarget();
--    if (targ ~= nil) then
--        targ:setModelId(amount);
--    end

print(player:getMod(MOD_MEVA));






----        targ:useJobAbility(amount, targ);
--        end
--    blastReward(player);
--    print(player:aetAugmentCount(1064));
--    print(player:getSkillLevel(SKILL_ELE));
--    print(player:getWeaponSkillType(SLOT_RANGED));
end;