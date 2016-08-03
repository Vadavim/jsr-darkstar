-----------------------------------
-- Spinning Scythe
-- Scythe weapon skill
-- Skill Level: 125
-- Delivers an area of effect attack. Attack radius varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget & Soil Gorget.
-- Aligned with the Aqua Belt & Soil Belt.
-- Element: None
-- Modifiers: STR:60% MND:60%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.mnd_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    if (damage > 0) then
        local effect = player:getStatusEffect(EFFECT_ATTACK_BOOST);
        if (effect == nil) then
            player:addStatusEffect(EFFECT_ATTACK_BOOST, 5, 0, fTP(tp, 60, 180, 360));
        else
            if (effect:getMod(MOD_ATTP) < 25) then
                effect:addMod(MOD_ATTP, 5);
                player:addMod(MOD_ATTP, 5);
            end
        end
    end

    return tpHits, extraHits, criticalHit, damage;

end
