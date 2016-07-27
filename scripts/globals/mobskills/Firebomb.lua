---------------------------------------------------
-- Firebomb
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

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.4,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);


    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_BURN, 1 + mob:getMainLvl() / 5, 0, 60);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_BURN);
        end
    end

    target:delHP(dmg);
    return dmg;
end
