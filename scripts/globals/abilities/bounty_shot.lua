-----------------------------------
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local ranged = player:getStorageItem(0, 0, SLOT_RANGED);
    local ammo = player:getStorageItem(0, 0, SLOT_AMMO);
    
    if ranged and ranged:isType(ITEM_WEAPON) then
        local skilltype = ranged:getSkillType();
        if skilltype == SKILL_ARC or skilltype == SKILL_MRK or skilltype == SKILL_THR then
            if ammo and (ammo:isType(ITEM_WEAPON) or skilltype == SKILL_THR) then
                return 0, 0;
            end;
        end;
    end;
    
    return MSGBASIC_NO_RANGED_WEAPON, 0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    if (player:getWeaponSkillType(SLOT_RANGED) == SKILL_MRK) then
        action:animation(target:getID(), action:animation(target:getID()) + 1);
    end
    local params = {};
    params.numHits = 1;
    local ftp = 1;
    params.ftp100 = ftp; params.ftp200 = ftp; params.ftp300 = ftp;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 1.5; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1
    params.enmityMult = 2.5
    params.bonusACC = 20;

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, 0, params, 100, true)
    player:addHP(damage);
    if (damage > 0) then
        local tpDrain = target:getTP();
        player:addTP(tpDrain * 0.25);
        target:delTP(tpDrain * 0.25);
    end


    if not (tpHits + extraHits > 0) then
        ability:setMsg(MSGBASIC_USES_BUT_MISSES)
        action:speceffect(target:getID(), 0)
    end

    return damage;
end;
