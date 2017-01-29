---------------------------------------------------
-- Cocoon
-- Enhances defense.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 35 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    



    skill:setMsg(MobBuffMove(mob, EFFECT_DEFENSE_BOOST, 50 + hard * 3, 0, duration));
    local effect = mob:getStatusEffect(EFFECT_DEFENSE_BOOST);

    if (hard > 0 ) then
        if (effect ~= nil) then
            local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
            effect:addMod(MOD_SPIKES, 8);
            target:addMod(MOD_SPIKES, 8);
            effect:addMod(MOD_SPIKES_DMG, power);
            target:addMod(MOD_SPIKES_DMG, power);
        end
    end


    return typeEffect;
end;
