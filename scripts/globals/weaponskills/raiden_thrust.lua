-----------------------------------
-- Raiden Thrust
-- Polearm weapon skill
-- Skill Level: 70
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Aligned with the Light Gorget & Thunder Gorget.
-- Aligned with the Light Belt & Thunder Belt.
-- Element: Lightning
-- Modifiers: STR:40% ; INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      3.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.ftp100 = 1.55 params.ftp200 = 3.5; params.ftp300 = 5.5;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.ele = ELE_LIGHTNING;
    params.skill = SKILL_POL;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.60; params.dex_wsc = 0.60;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, primary);
    if (target:hasStatusEffect(EFFECT_SHOCK)) then
        damage = math.floor(damage * 1.20);
    end

    if (target:hasStatusEffect(EFFECT_STUN)) then
        damage = math.floor(damage * 1.20);
    end

    if (damage > 0) then
        local duration = 60 * (tp / 1000) * (1 + tp / 3000);
        local mATK = 1 + player:getMod(MOD_MATT) / 100;
        local tATK = 1 + player:getMod(MOD_THUNDERATT) / 100;
        local power = (1 + player:getMainLvl() / 4) * mATK * tATK;
        player:addStatusEffect(EFFECT_SHOCK_SPIKES,power,0,duration);
    end


    return tpHits, extraHits, criticalHit, damage;

end
