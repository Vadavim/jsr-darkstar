---------------------------------------------------
-- Double Slap M=6, 2 (still guessing here)
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(40);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 2; local accmod = 1.25; local strRatio = 2;
    local dmgmod = summoningDamageBonus(master, 60, 0.8, 180);
    local dmgmodsubsequent = summoningDamageBonus(master, 35, 0.60, 100);

    skill:setSkillchain(53); -- Crescent Moon: Scission
    pet:addTP(450 + skill:getTP()); -- add tp for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,strRatio);
    local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end