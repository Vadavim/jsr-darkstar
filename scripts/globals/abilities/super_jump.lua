-----------------------------------
-- Ability: Super Jump
-- Performs a super jump.
-- Obtained: Dragoon Level 50
-- Recast Time: 3:00
-- Duration: Instant
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
    if (target:isMob()) then
        local enmityShed = 100
        target:lowerEnmity(player, enmityShed);
    end

    if (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) or player:hasStatusEffect(EFFECT_FLY_HIGH)) then
        target:addStatusEffect(EFFECT_CHAINBOUND,1,0,15);
        player:delStatusEffect(EFFECT_FLY_HIGH);
    end

    player:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE, 1, 0, 5);
    player:setMod(MOD_UTSUSEMI, 1);
end;