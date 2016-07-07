---------------------------------------------------
-- Sand Shield
-- Enhances defense.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_DEFENSE_BOOST) or mob:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 60 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 30, 0, duration));
    local effect = mob:getStatusEffect(EFFECT_DEFENSE_BOOST);
    if (effect ~= nil) then
        mob:addMod(MOD_WINDDEF, -50);
        effect:addMod(MOD_WINDDEF, -50);
        mob:addMod(MOD_WATERDEF, -50);
        effect:addMod(MOD_WATERDEF, -50);
        if (hard > 0) then
            local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
            effect:addMod(MOD_SPIKES, 8);
            target:addMod(MOD_SPIKES, 8);
            effect:addMod(MOD_SPIKES_DMG, power);
            target:addMod(MOD_SPIKES_DMG, power);
        end
    end

    return typeEffect;
end;
