-----------------------------------
-- Backhand Blow
-- Hand-to-Hand weapon skill
-- Skill Level: 100
-- Deals params.critical damage. Chance of params.critical hit varies with TP.
-- Aligned with the Breeze Gorget.
-- Aligned with the Breeze Belt.
-- Element: None
-- Modifiers: STR:30% ; DEX:30%
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
	params.ftp100 = 1.5; params.ftp200 = 1.5; params.ftp300 = 1.5;
	params.str_wsc = 0.3; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.4; params.crit200 = 0.6; params.crit300 = 0.8;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.5; params.dex_wsc = 0.5;
	end


	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	local resist = applyResistanceWeaponskill(player, target, ELE_WIND, SKILL_H2H);

    if (damage > 0 and criticalHit and resist >= 0.125) then
        target:delStatusEffectSilent(EFFECT_VIT_DOWN);
        target:addStatusEffect(EFFECT_VIT_DOWN, 40, 0, 60 * duration);
        target:setPendingMessage(277, EFFECT_VIT_DOWN);
        local effect = target:getStatusEffect(EFFECT_VIT_DOWN);
        if (effect ~= nil) then
            effect:addMod(MOD_STUNRES, -20);
            target:addMod(MOD_STUNRES, -20);
        end
    end
    
    if (target:isMob() and target:getSystem() == SYSTEM_AMORPH) then
        damage = damage * 1.2;
    end
    
	return tpHits, extraHits, criticalHit, damage;

end
