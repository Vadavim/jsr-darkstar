---------------------------------------------------
-- Rock Throw M=3.5
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
    local dmgmod = summoningDamageBonus(master, 18, 0.5, 45);

    pet:addTP(300 + skill:getTP()); -- add tp for using physical skill
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
    totaldamage = addBonusesAbility(pet, ELE_DARK, target, totaldamage, nil, 0.77);

    if(AvatarPhysicalHit(skill, totaldamage)) then
        local resist = applyPlayerResistance(pet,-1,target,
            pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_EARTH);
        if (resist >= 0.5) then
            local duration = utils.clamp(60 + master:getMod(MOD_CHR) + master:getMod(MOD_SUMMONING) * 2, 60, 120)
            target:addStatusEffect(EFFECT_SLOW, 250, 0, duration * resist);
            target:setPendingMessage(277, EFFECT_SLOW);
        end
    end


    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end