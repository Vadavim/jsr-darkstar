
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.0;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);

    local resist = applyPlayerResistance(mob,0,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,ELE_WATER);
    local dispel = EFFECT_NONE;
    if (resist >= 0.5) then
        dispel =  target:dispelStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));
    end


    target:delHP(dmg);
    return dmg;
end;
