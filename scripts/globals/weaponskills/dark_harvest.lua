-----------------------------------
-- Dark Harvest
-- Scythe weapon skill
-- Skill Level: 30
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: Dark
-- Modifiers: STR:20% ; INT:20%
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
	params.ftp100 = 1; params.ftp200 = 3; params.ftp300 = 6;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_DARK;
	params.skill = SKILL_SYH;
	params.includemab = true;
    local tp = player:getTP();
    local duration = (tp/100 * 60);
    player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST, 35, 0, duration); -- caster gains MATK

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.4; params.int_wsc = 0.6;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
    player:addMP(damage * 0.1);
	return tpHits, extraHits, criticalHit, damage;

end
