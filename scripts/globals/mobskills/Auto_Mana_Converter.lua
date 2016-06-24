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
    mob:addTP(skill:getTP()); -- Ability doesn't consume TP
    print("Used!");

    local mpHeal = mob:getHP() * 0.5;
    mob:delHP(mpHeal);
    mob:addMP(mpHeal);

    return 0;

end;

