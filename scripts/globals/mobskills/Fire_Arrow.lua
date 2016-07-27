---------------------------------------------------
-- Fire Arrow
-- Deals Fire damage.
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
    local dmgmod = 1.3 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.8,ELE_FIRE,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_BURN, 1 + mob:getMainLvl() / 3.5, 0, 30 + hard * 15);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_BURN);
        end
    end

    target:delHP(dmg);
    return dmg;
end
