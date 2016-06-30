---------------------------------------------------
-- MP Absorption
-- Single target MP Drain. (Ignores shadows.)
-- Type: Magical
-- Range: Melee
-- Notes: If used against undead, it will simply do damage and not drain HP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getMP() == 0) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 1 + hard / 5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,ELE_DARK,dmgmod,TP_MAB_BONUS,1);

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_MAGIC_ATK_DOWN, 15 + hard * 5, 0, 60);
        if (success == 242) then
            mob:addStatusEffect(EFFECT_MAGIC_ATK_BOOST, 15 + hard * 5, 0, 60);
            target:setPendingMessage(278, EFFECT_MAGIC_ATK_DOWN);
            mob:setPendingMessage(280, EFFECT_MAGIC_ATK_BOOST);
        end
    end

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg));

    return dmg;
end;
