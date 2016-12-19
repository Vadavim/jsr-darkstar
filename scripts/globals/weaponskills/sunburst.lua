-----------------------------------
-- Sunburst
-- Staff weapon skill
-- Skill Level: 150
-- Deals light or darkness elemental damage. Damage varies with TP.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt.
-- Element: Light/Dark
-- Modifiers: :    STR:40% MND:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.50      4.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {};
    params.ftp100 = 1.5; params.ftp200 = 3; params.ftp300 = 5;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 1.5; params.chr_wsc = 0.0;
    params.ele = ELE_DARK; params.ele = ELE_LIGHT;
    local eles = {ELE_DARK, ELE_LIGHT};
    params.skill = SKILL_STF;
    params.includemab = true;

    if (target:getMod(MOD_LIGHTRES) == target:getMod(MOD_DARKRES)) then
        params.ele = eles[math.random(1, 2)];
    elseif (target:getMod(MOD_LIGHTRES) < target:getMod(MOD_DARKRES)) then
        params.ele = ELE_LIGHT;
    else
        params.ele = ELE_DARK;
    end

    local system = target:getSystem();
    if (system == SYSTEM_DEMON or system == SYSTEM_UNDEAD) then
        params.ftp100 = params.ftp100 * 1.33; params.ftp200 = params.ftp200 * 1.33; params.ftp300 = params.ftp300 * 1.33;
    end




    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, tp, primary, action, params);

    if (damage > 0) then

        local healAmount = damage * 0.5;
        local boost = player:getStatusEffect(EFFECT_BOOST);
        local healAll = false;
        if (boost ~= nil) then
            local bSubPower = boost:getSubPower();
            if (bSubPower > 250) then
                healAll = true;
            end
            healAmount = healAmount * (1 + bSubPower / 150);
        end

        if (healAll == true) then
            local party = player:getParty(true, true);
            if (party ~= nil) then
                for i,member in ipairs(party) do
                    member:addHP(damage * 0.5);
                end
            end
        else
            player:addHP(damage * 0.5);
        end



    end
    player:delStatusEffect(EFFECT_BOOST);

    return tpHits, extraHits, criticalHit, damage;

end
