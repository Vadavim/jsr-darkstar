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
    skill:setSkillchain(37);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.0;
--    local info = MobMagicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS, 4.0, 10.25, 13.75);
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.8,ELE_LIGHT,dmgmod,TP_DMG_BONUS, 2, 3, 4);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    local tp = skill:getTP();


    if (dmg > 0) then
        local duration = 30 * (tp / 1000) * (1 + (tp - 1000) / 2000);
        local potency = (1 + (mob:getMod(MOD_CURE_POTENCY) / 100)) * (1 + mob:getMod(MOD_LIGHTATT) / 100);
        local power = math.floor((1 + mob:getMainLvl() / 3)  * potency);
        mob:addStatusEffect(EFFECT_REGEN_II,power,0,duration);
    end


    target:delHP(dmg);
    return dmg;

end;
