-----------------------------------
-- Ability: Provoke
-- Goads an enemy into attacking you.
-- Obtained: Warrior Level 5
-- Recast Time: 0:30
-- Duration: 30 seconds
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

    if (player:isPet()) then
        target:addEnmity(player, 200, 1000);
    end


--    if (player:getMainJob() ~= 1) then
--        return;
--    end
--
--    if (player:hasStatusEffect(EFFECT_DEFENDER)) then
--        local power = 1 + player:getMainLvl() / 5;
--        player:addStatusEffect(EFFECT_VIT_BOOST_II, power, 0, 15);
--    elseif (player:hasStatusEffect(EFFECT_BERSERK)) then
--        local power = 1 + player:getMainLvl() / 5;
--        player:addStatusEffect(EFFECT_STR_BOOST_II, power, 0, 15);
--
--        local cDif = 2 * (player:getStat(MOD_CHR) - target:getStat(MOD_CHR));
--        local resist = applyResistanceAbility(player, target, ELE_FIRE, 0, cDif);
--        if (resist > 0.125) then
--            target:addStatusEffect(EFFECT_STUN, 1, 0, 3);
--            target:setPendingMessage(277, EFFECT_STUN);
--        end
--    end

end;