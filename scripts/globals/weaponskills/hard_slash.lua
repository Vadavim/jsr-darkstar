-----------------------------------
-- Hard Slash
-- Great Sword weapon skill
-- Skill level: 5
-- Delivers a single-hit attack. Damage varies with TP.
-- Modifiers: STR:30%
-- 100%TP     200%TP     300%TP
-- 1.5         1.75        2.0
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.numHits = 1;
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

    params.ignoresDef = true;
    params.ignored100 = 0.10;
    params.ignored200 = 0.25;
    params.ignored300 = 0.50;

    local system = target:getSystem();
    if (system == SYSTEM_ARCANA) then
        params.ftp100 = params.ftp100 * 1.33; params.ftp200 = params.ftp200 * 1.33; params.ftp300 = params.ftp300 * 1.33;
    end

    if (target:getMod(MOD_IMPACTRES) < 1000) then
        params.ftp100 = params.ftp100 * 1.33; params.ftp200 = params.ftp200 * 1.33; params.ftp300 = params.ftp300 * 1.33;
    end


    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    return tpHits, extraHits, criticalHit, damage;
end
