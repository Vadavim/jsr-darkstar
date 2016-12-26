-----------------------------------
-- Ability: Super Jump
-- Performs a super jump.
-- Obtained: Dragoon Level 50
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

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

    -- Reduce 99% of total accumulated enmity
    if (target:isMob()) then
        target:lowerEnmity(player, 99);
    end

    ability:setMsg(0);

    -- Prevent the player from performing actions while in the air
    player:stun(5000);

    -- If the Dragoon's wyvern is out and alive, tell it to use Super Climb
    local wyvern = player:getPet();
    if (wyvern ~= nil and player:getPetID() == PET_WYVERN and wyvern:getHP() > 0) then
        wyvern:useJobAbility(636, wyvern);
    end


    if (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) or player:hasStatusEffect(EFFECT_FLY_HIGH)) then
        target:addStatusEffect(EFFECT_CHAINBOUND,1,0,15);
        player:delStatusEffect(EFFECT_FLY_HIGH);
    end

    player:addStatusEffectEx(EFFECT_COPY_IMAGE, EFFECT_COPY_IMAGE, 1, 0, 5);
    player:setMod(MOD_UTSUSEMI, 1);

end;
