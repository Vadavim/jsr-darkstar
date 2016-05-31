require("scripts/globals/status");

function checkPotion(target)
    local result = 0;
    local mHP = target:getMaxHP();
    local cHP = target:getHP();
    
    if (mHP == cHP) then
        value = 56; -- Does not let player use item if their hp is full
    end
    
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        result = 111;
    end
    return result;
end;

function checkEther(target)
    local result = 0;
    local mMP = target:getMaxMP();
    local cMP = target:getMP();
    
    if (mMP == cMP) then
        value = 56; -- Does not let player use item if their mp is full
    end
    
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        result = 111;
    end
    return result;
end;


function usePotion(target,cap)
    local power = math.floor(target:getMaxHP() * 0.66);
    if (power > cap) then
        power = cap
    end
    target:addStatusEffect(EFFECT_MEDICINE,0,0,60);
	target:messageBasic(24,0,target:addHP(power));
end;

function useEther(target,cap)
    local power = math.floor(target:getMaxMP() * 0.50);
    if (power > cap) then
        power = cap
    end
    target:addStatusEffect(EFFECT_MEDICINE,0,0,60);
	target:messageBasic(25,0,target:addMP(power));
end;


ELE_EFFECTS = {
    [ELE_FIRE] = SUBEFFECT_FIRE_DAMAGE,
    [ELE_ICE] = SUBEFFECT_ICE_DAMAGE,
    [ELE_THUNDER] = SUBEFFECT_LIGHTNING_DAMAGE,
    [ELE_WATER] = SUBEFFECT_WATER_DAMAGE,
    [ELE_WIND] = SUBEFFECT_WIND_DAMAGE,
    [ELE_EARTH] = SUBEFFECT_EARTH_DAMAGE,
    [ELE_LIGHT] = SUBEFFECT_LIGHT_DAMAGE,
    [ELE_DARK] = SUBEFFECT_DARKNESS_DAMAGE,
}

function elementalArrowEffect(player,target,damage, element, stat)
    local chance = 5;
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl()) + player:getMod(MOD_CHR)
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = math.random(5,15) + math.max(0, math.floor(player:getStat(stat) - target:getStat(stat) / 2));
        local params = {};
        params.bonusmab = 0;
        params.includemab = true;
        dmg = addBonusesAbility(player, element, target, dmg, params);
        dmg = dmg * applyResistanceItemEffect(player,target,element,0);
        dmg = adjustForTarget(target,dmg,element);
        dmg = finalMagicNonSpellAdjustments(player,target,element,dmg);

        local message = MSGBASIC_ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = MSGBASIC_ADD_EFFECT_HEAL;
        end

        local ele_effect = ELE_EFFECTS[element];
        return ele_effect,message,dmg;
    end
end;
