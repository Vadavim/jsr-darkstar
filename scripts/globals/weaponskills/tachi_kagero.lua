 -- ---------------------------------
-- Tachi Goten
-- Great Katana weapon skill
-- Skill Level: 70
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Light Gorget / Thunder Gorget.
-- Aligned with the Light Belt / Thunder Belt.
-- Element: Thunder
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- .5         .75      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
 require("scripts/globals/magic");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1.0; params.ftp200 = 1.0; params.ftp300 = 1.0;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    params.ele = ELE_FIRE;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2.0; params.ftp200 = 5; params.ftp300 = 8;
        params.str_wsc = 0.6;
        params.int_wsc = 0.6;
    end

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_FIRE, SKILL_GKT);
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    if (damage > 0 and resist > 0.125 and not target:hasStatusEffect(EFFECT_DROWN))then
        local DOT = math.floor(player:getMainLvl()/4) + 1;

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        DOT = addBonusesAbility(player, ELE_FIRE, target, DOT, mParams, 1.0);

        local duration = (60 * (tp / 1000) * (1 + (tp - 1000) / 2000));

        -- Remove Frost
        if (target:getStatusEffect(EFFECT_FROST) ~= nil) then
            target:delStatusEffect(EFFECT_FROST);
        end;

        target:addStatusEffect(EFFECT_BURN, DOT, 3, duration * resist,FLAG_ERASABLE);
        target:setPendingMessage(277, EFFECT_BURN);
    end


    return tpHits, extraHits, criticalHit, damage;

end