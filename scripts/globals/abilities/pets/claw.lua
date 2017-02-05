---------------------------------------------------
-- Claw M=3.5
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(20);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 1; local accmod = 1.25; local strRatio = 1.0;
    local dmgmod = summoningDamageBonus(master, 18, 0.75, 60);

    skill:setSkillchain(4); -- Backhand Blow: Detonation
    pet:addTP(200 + skill:getTP()); -- add tp for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end