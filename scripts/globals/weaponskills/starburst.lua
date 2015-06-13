-----------------------------------
-- Starburst
-- Staff weapon skill
-- Skill Level: 100
-- Deals light or darkness elemental damage. Damage varies with TP.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt.
-- Element: Light/Dark (Random)
-- Modifiers: :	STR:40% MND:40%
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
	params.ftp100 = 1.25; params.ftp200 = 2.5; params.ftp300 = 3.5;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_DARK; params.ele = ELE_LIGHT
	params.skill = SKILL_STF;
	params.includemab = true;

	local darkDef = target:getMod(MOD_DARKDEF);
	local darkRes = target:getMod(MOD_DARKRES);
	local lightDef = target:getMod(MOD_LIGHTDEF);
	local lightRes = target:getMod(MOD_LIGHTRES);
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
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	local resist = applyResistanceWeaponskill(player, target, params.ele, SKILL_STF);
	if (damage > 0 and resist > 0.125) then
        local effect = target:dispelStatusEffect();
		if effect ~= nil then
			target:setPendingMessage(168, effect:getType());
		end
    end
	return tpHits, extraHits, criticalHit, damage;

end
