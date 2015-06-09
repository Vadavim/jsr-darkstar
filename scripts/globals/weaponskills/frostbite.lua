-----------------------------------
-- Frostbite
-- Great Sword weapon skill
-- Skill Level: 70
-- Delivers an ice elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget.
-- Aligned with the Snow Belt.
-- Element: Ice
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
	params.ftp100 = 1; params.ftp200 = 2; params.ftp300 = 2.5;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_ICE;
	params.skill = SKILL_GSD;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.4; params.int_wsc = 0.4;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
    
    -- add Frost
    if (damage > 0 and target:getStatusEffect(EFFECT_FROST) == nil) then
        local DOT = math.floor(player:getMainLvl()/5) + 2;
        local duration = (30 * (player:getTP() / 100));
        target:addStatusEffect(EFFECT_FROST, DOT, 3, duration, FLAG_ERASBLE);
    end
    
    
	return tpHits, extraHits, criticalHit, damage;

end
