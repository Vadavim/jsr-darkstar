---------------------------------------------------
-- Blastbomb
-- Deals Fire damage in an area of effect and bind.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 20 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    if (hard > 0) then
        skill:setKnockback(5);
    end




    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
