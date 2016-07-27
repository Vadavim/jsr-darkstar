-----------------------------------
-- Ability: Mijin Gakure
-- Sacrifices user's life to deal damage to an enemy.
-- Obtained: Ninja Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/monstertpmoves");
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

    local dmg = (player:getHP() * 0.5) + (player:getMainLvl() / 0.5);
    local resist = applyPlayerResistance(player, nil, target, player:getStat(MOD_INT)-target:getStat(MOD_INT), 0, ELE_NONE);

    dmg = dmg * resist * 2;

    target:delHP(dmg);

--    player:setLocalVar("MijinGakure", 1)


    -- shadows
    local effect = player:getStatusEffect(EFFECT_COPY_IMAGE);
    if (effect == nil) then
        player:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_4,5,0,300);
        player:setMod(MOD_UTSUSEMI, 5);
    elseif (effect:getPower() <= 5) then
        effect:setPower(5);
        effect:setIcon(EFFECT_COPY_IMAGE_4);
        effect:resetStartTime();
        player:setMod(MOD_UTSUSEMI, 5);
    end

    -- invisibility and stuff
    player:addStatusEffect(EFFECT_INVISIBLE, 1, 0, 300);
    player:addStatusEffect(EFFECT_SNEAK, 1, 0, 300);
    player:addStatusEffect(EFFECT_DEODORIZE, 1, 0, 300);
    player:addStatusEffect(EFFECT_FLEE, 100, 0, 30);
    target:lowerEnmity(player, 100);

    player:setHP(player:getHP() * 0.5);
    return dmg;
end;
