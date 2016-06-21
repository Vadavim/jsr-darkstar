---------------------------------------------------
-- Barracude Dive M=3.5
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(20);
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local numhits = 1;
    local accmod = 1.15;
    local dmgmod = 3.5;
    skill:setSkillchain(33); -- Shadowstitch: Reverberation
    pet:addTP(100 + skill:getTP()); -- Add TP for using physical skill

    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end