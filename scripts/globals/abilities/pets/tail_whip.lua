---------------------------------------------------
-- Tail Whip M=5
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/summon");
require("scripts/globals/utils");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 1;
    local accmod = 1.15;
    local dmgmod = 5;
    skill:setSkillchain(19); -- Gust Slash: detonation
    pet:addTP(200 + skill:getTP()); -- Add TP for using physical skill

    -- Deal Damage
    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);

    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    -- Inflict Weight
    if(AvatarPhysicalHit(skill, totaldamage)) then
        local chr, summoning, level = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl();
        local duration = utils.clamp(30 + chr + summoning, 30, 90);

        local success = MobStatusEffectMove(pet, target, EFFECT_WEIGHT, 60, 0, duration, MOD_STR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_WEIGHT);
        end
    end

    return totaldamage;
end