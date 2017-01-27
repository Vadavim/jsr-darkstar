---------------------------------------------
-- Cyclonic Turmoil
--
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.2,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);

    local resist = applyPlayerResistance(mob,0,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,ELE_WIND);
    local dispel = EFFECT_NONE;
    if (resist >= 0.5) then
        dispel =  target:dispelStatusEffect();
        if (dispel ~= EFFECT_NONE) then
            target:setPendingMessage(427, dispel);
        end

    end


    return dmg;
end;

