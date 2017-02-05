---------------------------------------------------
-- Shock Strike M=3.5
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
    local numhits = 1; local accmod = 1.25; local strRatio = 1.0;
    local dmgmod = summoningDamageBonus(master, 12, 0.5, 50);
    skill:setSkillchain(1); -- Combo = Impaction
    pet:addTP(200 + skill:getTP()); -- add tp for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = addBonusesAbility(pet, ELE_THUNDER, target, damage.dmg, nil, 0.77);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
    if (totaldamage > 0 ) then
        target:addStatusEffect(EFFECT_STUN, 1, 0, 4);
    end
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end