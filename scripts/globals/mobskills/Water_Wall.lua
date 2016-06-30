---------------------------------------------------
-- Water Wall
-- Enhances defense.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_EVASION_BOOST) or mob:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60));
    local effect = mob:getStatusEffect(EFFECT_DEFENSE_BOOST);
    if (effect ~= nil) then
        effect:addMod(MOD_FIREDEF, 60);
        target:addMod(MOD_FIREDEF, 60);
        effect:addMod(MOD_THUNDERDEF, -60);
        target:addMod(MOD_THUNDERDEF, -60);
    end

    if (hard > 0 and effect ~= nil) then
        local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
        effect:addMod(MOD_SPIKES, 9);
        target:addMod(MOD_SPIKES, 9);
        effect:addMod(MOD_SPIKES_DMG, power);
        target:addMod(MOD_SPIKES_DMG, power);
    end

    return typeEffect;
end;
