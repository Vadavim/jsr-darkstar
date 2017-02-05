---------------------------------------------------
-- Rock Buster M=4
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 1; local accmod = 1.25; local strRatio = 1.5;
    local dmgmod = summoningDamageBonus(master, 30, 0.85, 120);

    pet:addTP(400 + skill:getTP()); -- add tp for using physical skill
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = addBonusesAbility(pet, ELE_EARTH, target, damage.dmg, nil, 0.77);

    totaldamage = AvatarFinalAdjustments(totaldamage,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);

    if(AvatarPhysicalHit(skill, totaldamage)) then
        local resist = applyPlayerResistance(pet,-1,target,
            pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_EARTH);
        if (resist >= 0.5) then
            local duration = utils.clamp(60 + master:getMod(MOD_CHR) + master:getMod(MOD_SUMMONING) * 2, 60, 120)
            target:addStatusEffect(EFFECT_SLOW, 280, 0, duration * resist);
            target:setPendingMessage(277, EFFECT_SLOW);
        end
    end


    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end