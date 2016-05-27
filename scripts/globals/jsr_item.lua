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