---------------------------------------------------
-- Camisado M=3.5
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

function onPetAbility(target, pet, skill, master)
    local numhits = 1;
    local accmod = 1.15;
    local dmgmod = 3.5;

    skill:setSkillchain(84); -- Keen Edge: Compression
    pet:addTP(100 + skill:getTP()); -- Add TP for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    local resist = applyPlayerResistance(pet,-1,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);
    local totaldamage = damage.dmg * resist * addBonusesAbility(pet, ELE_DARK, target, damage.dmg, 0.77);



    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);



    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end