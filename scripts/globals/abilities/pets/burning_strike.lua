---------------------------------------------------
-- Burning Strike M = 6?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP();
	local numhits = 1;
	local accmod = 1.15;
	local dmgmod = 4.5;
    skill:setSkillchain(225); -- Arching Arrow = Fusion
    pet:addTP(150 + skill:getTP()); -- Add TP for using physical skill

    local totaldamage = 0;
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    --get resist multiplier (1x if no resist)
    local resist = applyPlayerResistance(pet,-1,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT) + chr + summoning / 2, 0, ELE_FIRE);

    --get the resisted damage
    local params = {}; params.bonusmab = 0; params.includemab = true;

    totaldamage = damage.dmg * resist * addBonusesAbility(pet, ELE_FIRE, target, damage.dmg, 0.77);



    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    if (resist >= 0.5 and AvatarPhysicalHit(skill, totaldamage)) then
        local DOT = level / 5 + 1;
        target:delStatusEffect(EFFECT_FROST);
        target:addStatusEffect(EFFECT_BURN, DOT, 3, 60 * resist, EFFECTFLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_BURN);
    end


    return totaldamage;
end
