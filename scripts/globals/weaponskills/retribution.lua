-----------------------------------
-- Retribution
-- Staff weapon skill
-- Skill Level: 230
-- Delivers a single-hit attack. Damage varies with TP.
-- In order to obtain Retribution, the quest Blood and Glory must be completed.
-- Despite the appearance of throwing the staff, this is not a long-range Weapon Skill like Mistral Axe.
-- The range only extends the usual 1 yalm beyond meleeing range.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:30% ; MND:50%
-- 100%TP    200%TP    300%TP
-- 2.00      2.50      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2; params.ftp200 = 3.5; params.ftp300 = 4.5;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.atkmulti = 1.5;
    end

    local reflectPower = 33;

    local boost = player:getStatusEffect(EFFECT_BOOST);
    if (boost ~= nil) then
        local bSubPower = boost:getSubPower();
        player:addStatusEffect(EFFECT_RETALIATION, 1, 0, bSubPower / 3);
    end
--
--
--    local maxReflectedDamage = target:getMaxHP() * 2;
--    player:addStatusEffect(EFFECT_REPRISAL, 33, 0, fTP(tp, 45, 90, 180), 0, maxReflectedDamage, 1);

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    if (damage > 0) then
        target:setLocalVar("retribution", 2 + math.floor((tp - 1000) / 500));
    end

    return tpHits, extraHits, criticalHit, damage;

end
