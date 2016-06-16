---------------------------------------------------
-- Snowball
-- Deals Ice damage in an area of effect.
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,ELE_ICE,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);

    if (hard > 0) then
        local duration = 60;
        if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
        if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
        if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;
        local power = (1 + mob:getMainLvl() / 10) * (1 + hard / 5);
        local success = MobStatusEffectMove(mob, target, EFFECT_FROST, power, 0, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_FROST);
        end

        local power2 = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        mob:addStatusEffect(EFFECT_ENBLIZZARD, power2, 0, 60);
        mob:setPendingMessage(279, EFFECT_ENBLIZZARD);
    end

    return dmg;
end
