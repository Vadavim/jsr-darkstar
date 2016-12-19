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
        target:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, 90000);
        target:setMod(MOD_FIREDEF, 0);
        target:setMod(MOD_WATERDEF, 0);
        target:setMod(MOD_THUNDERDEF, 0);
        target:setMod(MOD_EARTHDEF, 0);
        target:setMod(MOD_WINDDEF, 0);
        target:setMod(MOD_ICEDEF, 0);
        target:setMod(MOD_LIGHTDEF, 0);
        target:setMod(MOD_DARKDEF, 0);
        target:setMod(MOD_PIERCERES, 1000);
        target:setMod(MOD_IMPACTRES, 1000);
        target:setMod(MOD_HTHRES, 1000);
        target:setMod(MOD_SLASHRES, 1000);

        target:setMod(MOD_FIRERES, 0);
        target:setMod(MOD_WATERRES, 0);
        target:setMod(MOD_THUNDERRES, 0);
        target:setMod(MOD_EARTHRES, 0);
        target:setMod(MOD_WINDRES, 0);
        target:setMod(MOD_ICERES, 0);
        target:setMod(MOD_LIGHTRES, 0);
        target:setMod(MOD_DARKRES, 0);
        target:setMod(MOD_REGEN, 300);

        target:setMod(MOD_MDEF, 0);
--        target:setMod(MOD_HPP, 500);
        target:addHP(99999);
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
