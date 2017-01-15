---------------------------------------------------
-- Moonlit Charge M=4
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
    local chr, summoning, level = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl();
	local numhits = 1;
	local accmod = 1.15;
	local dmgmod = 4;
    skill:setSkillchain(84); -- Keen Edge = Compression
    pet:addTP(200 + skill:getTP()); -- Add TP for using physical skill


    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);

    local duration = utils.clamp(90 + chr * 2 + summoning * 2, 90, 180);

    if(AvatarPhysicalHit(skill, totaldamage)) then
        local success = MobStatusEffectMove(pet, target, EFFECT_BLINDNESS, 25, 0, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BLINDNESS);
        end
    end

    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end
