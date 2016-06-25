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
    local success = MobStatusEffectMove(mob, target, EFFECT_FLASH, 200, 0, 12, MOD_MND);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_FLASH);
    end
    skill:setMsg(MSG_NONE);
    return success;
end;

