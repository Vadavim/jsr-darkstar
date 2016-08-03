-----------------------------------
-- Tachi Ageha
-- Great Katana weapon skill
-- Skill Level: 300
-- Lowers target's defense. Chance of lowering target's defense varies with TP.
-- 30% Defense Down
-- Duration of effect is exactly 3 minutes.
-- Aligned with the Shadow Gorget, Soil Gorget.
-- Aligned with the Shadow Belt, Soil Belt.
-- Element: None
-- Skillchain Properties: Compression/Scission
-- Modifiers: CHR:60% STR:40%
-- 100%TP    200%TP    300%TP
-- 2.625     2.625      2.625
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 2.80; params.ftp200 = 2.80; params.ftp300 = 2.80;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.50;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2; params.ftp200 = 2; params.ftp300 = 2;
        params.str_wsc = 0.4; params.chr_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    local duration = fTP(tp, 30, 90, 180);
    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WIND, SKILL_GKT);
    if (damage > 0 and resist >= 0.25) then
        target:addStatusEffect(EFFECT_DEFENSE_DOWN, 20, 0, duration * resist);
        target:setPendingMessage(278, EFFECT_DEFENSE_DOWN);
    end
    return tpHits, extraHits, criticalHit, damage;

end
