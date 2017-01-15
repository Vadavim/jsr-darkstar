---------------------------------------------------
-- Megalith Throw M=5.5 (guesstimated)
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local numhits = 1;
    local accmod = 1.15;
    local dmgmod = 5.5;
    skill:setSkillchain(50); -- Frostbite: Induration
    pet:addTP(400 + skill:getTP()); -- add tp for using physical skill

    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);


    -- Inflict Defense Down
    if(AvatarPhysicalHit(skill, totaldamage)) then
        local chr, summoning, level = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl();
        local duration = utils.clamp(30 + chr + summoning, 30, 90);

        local success = MobStatusEffectMove(pet, target, EFFECT_DEFENSE_DOWN, 10, 0, duration, MOD_STR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_DEFENSE_DOWN);
        end
    end

    return totaldamage;
end