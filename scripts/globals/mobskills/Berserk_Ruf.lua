-----------------------------------
-- Ability: Warcry
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- OnUseAbility
-----------------------------------

function OnMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_WARCRY)) then
        return 1;
    end;
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 25;
	local duration = 120;

	local typeEffect = EFFECT_WARCRY;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    --target:addStatusEffect(EFFECT_WARCRY,power,0,60,0,0);
	return typeEffect;
end;


