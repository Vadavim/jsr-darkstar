-----------------------------------
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/jsr_utils");
require("scripts/globals/weaponskills");

function onUseWeaponSkill(player, target, wsID, tp, primary)
    local ignis = player:getEffectsCount(EFFECT_IGNIS);
    local gelus = player:getEffectsCount(EFFECT_GELUS);
    local flabra = player:getEffectsCount(EFFECT_FLABRA);
    local tellus = player:getEffectsCount(EFFECT_TELLUS);
    local sulpor = player:getEffectsCount(EFFECT_SULPOR);
    local unda = player:getEffectsCount(EFFECT_UNDA);
    local lux = player:getEffectsCount(EFFECT_LUX);
    local tenebrae = player:getEffectsCount(EFFECT_TENEBRAE);
    local element = ELE_NONE;
    if (ignis >= 2) then element = ELE_FIRE;
    elseif (gelus >= 2) then element = ELE_ICE;
    elseif (flabra >= 2) then element = ELE_WIND;
    elseif (tellus >= 2) then element = ELE_EARTH;
    elseif (sulpor >= 2) then element = ELE_THUNDER;
    elseif (unda >= 2) then element = ELE_WATER;
    elseif (lux >= 2) then element = ELE_LIGHT;
    elseif (tenebrae >= 2) then element = ELE_DARK;
    end



    local params = {};
    params.numHits = 2;
    params.ele = element;
--    params.ele = element;
    -- ftp damage mods (for Damage Varies with TP; lines are calculated in the function
    params.ftp100 = 1.5; params.ftp200 = 2.1; params.ftp300 = 3.0;
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    -- critical mods, again in % (ONLY USE FOR params.critICAL HIT VARIES WITH TP)
    params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
    params.canCrit = false;
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0; params.acc200=0; params.acc300=0;
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atkmulti = 1;


    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0; params.mnd_wsc = 1.0;
        params.ftp100 = 2.0; params.ftp200 = 3.0; params.ftp300 = 4.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_LIGHT, SKILL_GSD);
    if (damage > 0 and resist > 0.5) then
        if(target:addStatusEffect(EFFECT_FLASH, 200, 0, 8 * resist)) then
            target:setPendingMessage(277, EFFECT_FLASH);
        end
    end


    return tpHits, extraHits, criticalHit, damage;
end
