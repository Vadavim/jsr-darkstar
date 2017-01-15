---------------------------------------------------
-- Double Slap M=6, 2 (still guessing here)
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(35);
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local numhits = 2;
    local accmod = 1.15;
    local dmgmod = 6;
    local dmgmodsubsequent = 2.5;

    skill:setSkillchain(53); -- Crescent Moon: Scission
    pet:addTP(400 + skill:getTP()); -- add tp for using physical skill

    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end