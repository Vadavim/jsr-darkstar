---------------------------------------------------
-- Camisado M=3.5
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(18);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 1; local accmod = 1.25; local strRatio = 0.8;
    local dmgmod = summoningDamageBonus(master, 12, 0.6, 48);

    skill:setSkillchain(84); -- Keen Edge: Compression
    pet:addTP(300 + skill:getTP()); -- Add TP for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = addBonusesAbility(pet, ELE_DARK, target, damage.dmg, nil, 0.77);

    if(AvatarPhysicalHit(skill, totaldamage)) then
        local resist = applyPlayerResistance(pet,-1,target,
            pet:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);
        if (resist >= 0.5) then
            local duration = utils.clamp(60 + master:getMod(MOD_CHR) + master:getMod(MOD_SUMMONING) * 2, 60, 120)
            target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 15, 0, duration * resist);
            target:setPendingMessage(278, EFFECT_MAGIC_DEF_DOWN);
        end
    end


    totaldamage = AvatarFinalAdjustments(totaldamage,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);



    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end