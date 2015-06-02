---------------------------------------------
--  Snort
--
--  Description: Deals Wind damage to targets in a fan-shaped area of effect. Additional effect: Knockback
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    -- add knockback

    --stop skill if Choke or Drown
    hasChoke = mob:getStatusEffect(EFFECT_CHOKE);
    hasDrown = mob:getStatusEffect(EFFECT_DROWN);
    if ( (hasChoke and random(100) <= 100) or (hasDrown and random(100) <= 100) ) then
        skill:setMsg(MSG_NO_EFFECT);
        mob:addTP(math.floor(skill:getTP() / 2));
        return EFFECT_EVASION_BOOST;
    end
    
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
