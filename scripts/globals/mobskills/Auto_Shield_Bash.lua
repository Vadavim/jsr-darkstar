---------------------------------------------------
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    mob:addTP(skill:getTP() + 400); -- Ability doesn't consume TP (but does give some)
    local dmg = 2 * mob:getMainLvl() + mob:getStat(MOD_STR);
    local duration = 6;
    if (mob:hasAttachment(8551)) then
        duration = 10;
        dmg = dmg * 2;
    end;
    target:addStatusEffect(EFFECT_STUN, 1, 0, duration);
    dmg = target:physicalDmgTaken(dmg);
    return dmg;
end;

