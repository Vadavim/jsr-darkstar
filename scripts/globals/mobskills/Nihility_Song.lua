---------------------------------------------
--  Nihility Song
--  Family: Hippogryph
--  Description: A song dispels a positive effect in an area of effect, including food.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows 
--  Range: Radial 12.5'
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        mob:addTP(skill:getTP() * 0.5);
    end

    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) > 50) then
        skill:setMsg(MSG_NO_EFFECT);
        return 0;
    end;

    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) > 70) then
        skill:setMsg(MSG_NO_EFFECT);
        return 0;
    end;

    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) > 70) then
        skill:setMsg(MSG_NO_EFFECT);
        return 0;
    end;

    local resist = applyPlayerResistance(mob,0,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,ELE_WIND);
    local dispel = EFFECT_NONE;
    if (resist >= 0.5) then
        dispel =  target:dispelStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));
    end


    if (dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end