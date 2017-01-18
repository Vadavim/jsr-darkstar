---------------------------------------------------
-- Poison Nails  M=3? guess
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(25);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
	local numhits = 1;
	local accmod = 1.15;
	local dmgmod = 2.25;
    skill:setSkillchain(49); -- Power Slash = Transfixion
    pet:addTP(200 + skill:getTP()); -- Add TP for using physical skill

    -- Deal Damage
    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,numhits);

    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    -- Inflict Poison
	if(AvatarPhysicalHit(skill, totaldamage) and target:hasStatusEffect(EFFECT_POISON) == false) then
        local chr, summoning, level = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl();
        local duration = utils.clamp(30 + chr + summoning, 30, 90);
--        if (duration > 90) then duration = 90 end;
        local power = 1 + level / 5 + (chr + summoning) / 6;
        local params = {}; params.bonusmab = 0; params.includemab = true;
        power = addBonusesAbility(pet, ELE_WATER, target, power, params, 1.0);

        local success = MobStatusEffectMove(pet, target, EFFECT_POISON, power, 0, duration, MOD_STR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
	end

    return totaldamage;
end
