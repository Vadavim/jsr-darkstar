-----------------------------------
-- Dulling Arrow
-- Archery weapon skill
-- Skill level: 80
-- Lowers enemy's INT. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:16% ; AGI:25%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.3; params.ftp200 = 1.3; params.ftp300 = 1.3;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.25; params.crit200 = 0.65; params.crit300 = 0.9;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.mnd_wsc = 0.5; params.agi_wsc = 0.5;
	end

	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
    local resist = applyResistanceWeaponskill(player, target, ELE_FIRE, SKILL_ARC);
	local duration = 60 * player:getTP() / 100;
    if (damage > 0 and resist > 0.125) then
		if (target:addStatusEffect(EFFECT_ADDLE, 30, 0, duration * resist, 0, 30)) then
			target:setPendingMessage(277, EFFECT_ADDLE);
        end
    end
    
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end;
