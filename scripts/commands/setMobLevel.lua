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


function onTrigger(player, amount)
    local target = player:getCursorTarget();
    if (target ~= nil) then
        target:setLevel(amount);
        target:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, 90000);
    end


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
--player:SayToPlayer("STR: " .. tostring(targ:getStat(MOD_STR))
--    .. ", VIT: " .. tostring(targ:getStat(MOD_VIT))
--        .. ", DEX: " .. tostring(targ:getStat(MOD_DEX))
--        .. ", INT: " .. tostring(targ:getStat(MOD_INT))
--        .. ", MND: " .. tostring(targ:getStat(MOD_MND))
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
