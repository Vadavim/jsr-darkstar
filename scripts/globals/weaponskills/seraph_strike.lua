-----------------------------------
-- Seraph Strike
-- Club weapon skill
-- Skill level: 40
-- Deals light elemental damage to enemy. Damage varies with TP.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: None
-- Modifiers: STR:40% ; MND:40%
-- 100%TP    200%TP    300%TP
-- 2.125     3.675      6.125
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.ftp100 = 1; params.ftp200 = 2; params.ftp300 = 3;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
    params.ele = ELE_LIGHT;
    params.skill = SKILL_CLB;
    params.includemab = true;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.7; params.ftp200 = 2.5; params.ftp300 = 4;
        params.str_wsc = 0.0; params.mnd_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);
    local duration = fTP(tp, 45, 135, 270);
    local potency = 1 + (player:getMod(MOD_CURE_POTENCY) / 100) + (player:getMod(MOD_LIGHTATT));
    local power = math.floor((1 + player:getMainLvl() / 3)  * potency);
    player:addStatusEffect(EFFECT_REGEN_II,power,0,duration);
    return tpHits, extraHits, criticalHit, damage;

end
