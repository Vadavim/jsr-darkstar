-----------------------------------
-- Sunburst
-- Staff weapon skill
-- Skill Level: 150
-- Deals light or darkness elemental damage. Damage varies with TP.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt.
-- Element: Light/Dark
-- Modifiers: :	STR:40% MND:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.50      4.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 1; params.ftp200 = 2.5; params.ftp300 = 4;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_DARK; params.ele = ELE_LIGHT;
	params.skill = SKILL_STF;
	params.includemab = true;
	if (darkDef < 0 or darkRes < 0) then
		params.ele = ELE_DARK;
	elseif (lightDef < 0 or lightRes < 0) then
		params.ele = ELE_LIGHT;
	else
		local rand = math.random();
		if (rand < 0.5) then
			params.ele = ELE_LIGHT;
		else
			params.ele = ELE_DARK;
		end
	end

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.int_wsc = 0.5; params.mnd_wsc = 0.5;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER

	if (target:isMob() and (target:getSystem() == SYSTEM_DEMON or target:getSystem() == SYSTEM_UNDEAD)) then
		damage = damage * 1.20;
	end

	player:addHP(damage / 4);

	return tpHits, extraHits, criticalHit, damage;

end
