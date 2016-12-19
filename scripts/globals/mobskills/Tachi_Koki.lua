---------------------------------------------
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(149);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,2,4,6);
    local params = {};
    local dmg = addBonusesAbility(mob, ELE_LIGHT, target, info.dmg, params);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local resist = applyPlayerResistance(mob,0,target,mob:getStat(MOD_MND)-target:getStat(MOD_MND),0,ELE_LIGHT);
    if (target:isNM()) then resist = resist - 0.75 end;
    if (dmg > 0 and resist >= 0.25) then
        local dispel = target:dispelStatusEffect();
        if (dispel ~= EFFECT_NONE) then
            mob:addTP(skill:getTP() * 0.5);
        end

    end




    target:delHP(dmg);
    return dmg;

end;
