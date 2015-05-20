-----------------------------------
-- Ability: Release
-- Sends the avatar away.
-- Obtained: Summoner Level 1
-- Recast Time: 10 seconds (shared by all avatars)
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

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
    local pet = player:getPet();
    local tp = pet:getTP();
    local level = player:getMainLvl();
    local recovery = ( tp / 10 ) * ( 0.2 + (level / 30));
    print(tostring(recovery));
    player:addMP(recovery);
    target:despawnPet();
    target:delStatusEffect(EFFECT_AVATAR);
end;