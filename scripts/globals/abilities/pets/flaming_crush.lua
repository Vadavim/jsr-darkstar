---------------------------------------------------
-- Flaming Crush M=10, 2, 2? (STILL don't know)
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP();
	local numhits = 3;
	local accmod = 1.15;
	local dmgmod = 10;
	local dmgmodsubsequent = 1;
    skill:setSkillchain(119); -- Wheeling Thrust = Fusion
    pet:addTP(600 + skill:getTP()); -- add tp for using physical skill

    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
    --get resist multiplier (1x if no resist)
    local resist = applyPlayerResistance(pet,-1,target,
        pet:getStat(MOD_INT) - target:getStat(MOD_INT) + chr + summoning / 2, 0, ELE_FIRE);

    --get the resisted damage
    local params = {}; params.bonusmab = 0; params.includemab = true;

    local totaldamage = damage.dmg * resist * addBonusesAbility(pet, ELE_FIRE, target, damage.dmg, params, 0.77);



    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,numhits);
    target:delHP(totaldamage);
    target:updateEnmityFromDamage(pet,totaldamage);

    return totaldamage;
end
