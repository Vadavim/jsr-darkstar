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
    testPick();
--    blastReward(player);
--    print(player:aetAugmentCount(1064));
--    print(player:getSkillLevel(SKILL_ELE));
--    print(player:getWeaponSkillType(SLOT_RANGED));
end;