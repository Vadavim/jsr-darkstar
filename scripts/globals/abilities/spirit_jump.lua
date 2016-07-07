-----------------------------------
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(EFFECT_FLY_HIGH)) then ability:setRecast(ability:getRecast() / 2) end;
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)

    local params = {};
    params.ftp100 = 1.0 params.ftp200 = 1.0; params.ftp300 = 1.0;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.ele = ELE_LIGHT;
    params.skill = player:getWeaponSkillType(SLOT_MAIN);
    params.includemab = true;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, 0, params, 0);

    if (tpHits + extraHits > 0) then
        -- Under Spirit Surge, Jump also decreases target defence by 20% for 60 seconds
        if (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true or player:hasStatusEffect(EFFECT_FLY_HIGH)) then
            if (target:hasStatusEffect(EFFECT_MAGIC_DEF_DOWN) == false) then
                target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 20, 0, 60);
            end
            player:delStatusEffect(EFFECT_FLY_HIGH);
        end
        if (criticalHit) then
            action:speceffect(target:getID(), 38)
        end
        action:speceffect(target:getID(), 32)
    else
        ability:setMsg(MSGBASIC_USES_BUT_MISSES)
        action:speceffect(target:getID(), 0)
    end


    return damage;
end;
