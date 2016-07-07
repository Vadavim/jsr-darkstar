---------------------------------------------------
-- Lightning Roar
-- Emits the roar of an impact event, dealing damage in a fan-shaped area of effect. Lightning damage
-- Ignores Shadows
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
    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * math.random(2,6),ELE_THUNDER,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHTNING,MOBPARAM_IGNORE_SHADOWS);
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_ENTHUNDER, (1 + mob:getMainLvl() / 2) * (1 + hard / 5), 0, 60);
        target:setPendingMessage(280, EFFECT_ENTHUNDER);
    end
    target:delHP(dmg);
    return dmg;
end;
