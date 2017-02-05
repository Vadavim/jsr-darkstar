---------------------------------------------------
-- Double Punch M=6, 2 (still guessing here)
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

function onPetAbility(target, pet, skill, master)
    local numhits = 2; local accmod = 1.25; local strRatio = 1.5;
    local dmgmod = summoningDamageBonus(master, 45, 0.7, 140);
    local dmgmodsubsequent = summoningDamageBonus(master, 22, 0.5, 75);

    skill:setSkillchain(84); -- Keen Edge = Compression
    pet:addTP(450 + skill:getTP()); -- Add TP for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,strRatio);
    local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end
