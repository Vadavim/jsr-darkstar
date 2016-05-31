-----------------------------------
-- Ability: Last Resort
-- Increases user's attack, but lowers defense.
-- Obtained: Dark Knight Level 15
-- Recast Time: 5:00
-- Duration: 3:00
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
    player:addStatusEffect(EFFECT_LAST_RESORT,player:getMerit(MERIT_DESPERATE_BLOWS),0,180);


    -- JSR: Endark Effect
    local effect = EFFECT_ENDARK;
    local magicskill = target:getSkillLevel(DARK_MAGIC_SKILL);
    local duration = 180;

    local potency = (magicskill / 8) + 12.5;
    player:addStatusEffect(effect,potency,0,duration)
end;