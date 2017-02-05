---------------------------------------------------
-- Moonlit Charge M=6
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
    local chr, summoning, level = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl();
    local numhits = 1; local accmod = 1.25; local strRatio = 1.0;
    local dmgmod = summoningDamageBonus(master, 12, 0.55, 50);
    skill:setSkillchain(49); -- Power Slash = Transfixion
    pet:addTP(300 + skill:getTP()); -- Add TP for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,strRatio);
    local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);

    local duration = utils.clamp(30 + chr / 2 + summoning , 30, 80);

    if(AvatarPhysicalHit(skill, totaldamage)) then
        local success = MobStatusEffectMove(pet, target, EFFECT_PARALYSIS, 33, 0, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_PARALYSIS);
        end
    end

    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end
