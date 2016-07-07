-----------------------------------
-- Ability: Shield Bash
-- Delivers an attack that can stun the target. Shield required.
-- Obtained: Paladin Level 15, Valoredge automaton frame Level 1
-- Recast Time: 3:00 minutes (3:00 for Valoredge version)
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getShieldSize() == 0) then
        return MSGBASIC_REQUIRES_SHIELD,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)
    target:addStatusEffect(EFFECT_INTERVENE, 30, 0, 30);
    return 0;
end;