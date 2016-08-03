-----------------------------------
-- Blast Arrow
-- Archery weapon skill
-- Skill level: 200
-- Delivers a melee-distance ranged attack. params.accuracy varies with TP.
-- Aligned with the Snow Gorget & Light Gorget.
-- Aligned with the Snow Belt & Light Belt.
-- Element: None
-- Modifiers: STR:16% ; AGI:25%
-- 100%TP    200%TP    300%TP
-- 2.00      2.00      2.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1.35; params.ftp200 = 1.35; params.ftp300 = 1.35;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.05; params.crit200 = 0.30; params.crit300 = 0.90;
    params.canCrit = true;
    params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 2.0;
    end

    local isEarthArrow = player:getEquipID(SLOT_AMMO) == 18699;
    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);
    local damage2, criticalHit2, tpHits2, extraHits2 = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    damage = damage + damage2;
    criticalHit = criticalHit or criticalHit2;
    tpHits = tpHits + tpHits2;
    extraHits = extraHits + extraHits2;

    local distance = player:checkDistance(target)
    distance = utils.clamp(distance, 0, 100);
    damage= math.floor(damage * ((100 - distance) / 100));


    return tpHits, extraHits, criticalHit, damage;

end
