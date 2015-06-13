-----------------------------------
-- Rock Crusher
-- Staff weapon skill
-- Skill Level: 40
-- Delivers an earth elemental attack. Damage varies with TP.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: Earth
-- Modifiers: STR:40% ; INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 1; params.ftp200 = 2; params.ftp300 = 2.5;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_EARTH;
	params.skill = SKILL_STF;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.4; params.int_wsc = 0.4;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	local resist = applyResistanceWeaponskill(player, target, ELE_EARTH, SKILL_STF);
	-- add Rasp
	if (damage > 0 and resist >= 0.125) then
		local DOT = math.floor(player:getMainLvl()/5) + 2;
		local duration = (60 * (player:getTP() / 100));
		target:setPendingMessage(277, EFFECT_RASP);
		target:delStatusEffect(EFFECT_SHOCK);
		target:addStatusEffect(EFFECT_RASP, DOT, 3, duration * resist, EFFECTFLAG_ERASABLE);
	end
	return tpHits, extraHits, criticalHit, damage;

end
