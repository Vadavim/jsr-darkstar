-----------------------------------
-- Ability: Swipe
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

function onUseAbility(player, target, ability)

    local damage = 100;

    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);

    ability:setMsg(110);

    return damage;
end;