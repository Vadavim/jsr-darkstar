---------------------------------------------------
-- Impact Roar
-- Emits the roar of an impact event, dealing damage in a fan-shaped area of effect.
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
    local dmgmod = 2.5 + hard / 6;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_STUN, 1, 0, 5 + hard, MOD_VIT);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_STUN);
        end
        
    end
    target:delHP(dmg);
    return dmg;
end;
