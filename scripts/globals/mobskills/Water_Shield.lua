---------------------------------------------
--  Water Shield
--
--  Description: Enhances evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_EVASION_BOOST) or mob:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_EVASION_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 40, 0, 30));
    local effect = mob:getStatusEffect(EFFECT_EVASION_BOOST);
    if (effect ~= nil) then
        effect:addMod(MOD_FIREDEF, 60);
        target:addMod(MOD_FIREDEF, 60);
        effect:addMod(MOD_THUNDERDEF, -60);
        target:addMod(MOD_THUNDERDEF, -60);
    end


    if (hard > 0) then
        if (effect ~= nil) then
            local power = 20 + hard * 10;
            effect:addMod(MOD_MEVA, power);
            target:addMod(MOD_MEVA, power);
        end
    end

    return typeEffect;
end;
