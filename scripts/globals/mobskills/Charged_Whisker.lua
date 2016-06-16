---------------------------------------------------
-- Charged Whisker
-- Deals Lightning damage to enemies within area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.8,ELE_THUNDER,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        mob:addStatusEffect(EFFECT_ENTHUNDER, power, 0, 60);
        mob:setPendingMessage(279, EFFECT_ENTHUNDER);
    end
    return dmg;
end;
