---------------------------------------------
--  Everyones Grudge
--
--  Notes: Invokes collective hatred to spite a single target.
--   Damage done is 5x the amount of tonberries you have killed! For NM's using this it is 50 x damage.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
--    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
--        return 1;
--    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = (1 + hard / 8) * (1 + (((100 - mob:getHPP()) * (100 - mob:getHPP())) / 3500)) ;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,ELE_DARK,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_BIO, 1 + mob:getMainLvl() / 6, 0, 60 + hard * 30, 0, 10 + hard * 3);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_BURN);
        end
    end

    target:delHP(dmg);
    return dmg;

--    local realDmg = 0;
--    local mobID = mob:getID();
--    local power = 5;
--
--    if (target:getID() > 100000) then
--        realDmg = power * math.random(30,100);
--    else
--        realDmg = power * target:getVar("EVERYONES_GRUDGE_KILLS"); -- Damage is 5 times the amount you have killed
--
--        if (mobID == 17428677 or mobID == 17433008 or mobID == 17433006 or mobID == 17433009 or mobID == 17432994 or mobID == 17433007 or mobID == 17428813 or mobID == 17432659 or mobID == 17432846 or mobID == 17428809) then
--            realDmg = realDmg * 10;  -- Sets the Multiplyer to 50 for NM's
--        elseif (mobID == 17432799 or mobID == 17428611 or MobID == 17428554 or mobID == 17428751 or mobID == 17432609 or mobID == 16814432 or mobID == 17432624 or mobID == 17285526 or mobID == 17285460) then
--            realDmg = realDmg * 10;   -- Sets the Multiplyer to 50 for NM's , staggered list
--        end
--    end
--
--    target:delHP(realDmg);
--
--    return realDmg;

end;