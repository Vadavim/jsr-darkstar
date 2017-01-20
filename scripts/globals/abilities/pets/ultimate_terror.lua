-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local duration = utils.clamps(60 + chr + summoning * 2, 60, 120) + tp / 20;
    local power = 8 + level / 10;

    local effects = {{EFFECT_STR_DOWN, EFFECT_STR_BOOST},
        {EFFECT_DEX_DOWN, EFFECT_DEX_BOOST},
        {EFFECT_INT_DOWN, EFFECT_INT_BOOST},
        {EFFECT_VIT_DOWN, EFFECT_VIT_BOOST},
        {EFFECT_AGI_DOWN, EFFECT_AGI_BOOST},
        {EFFECT_MND_DOWN, EFFECT_MND_BOOST},
        {EFFECT_CHR_DOWN, EFFECT_CHR_BOOST}};

    -- choose two effects
--    local choice = math.random(1,7);
--    local firstEffect = effects[choice];
--    effects.remove(choice);
--    local secondEffect = effects[math.random(1,6)];

--    local power = 12 + tp / 200;
--    local duration2 = utils.clamp(60 + chr + summoning, 60, 120) + tp / 50;

    for i,v in pairs(effects) do
        if (MobStatusEffectMove(pet, target, v[1], 1, 0, duration, tp / 40) == 242) then
            target:setPendingMessage(277, v[1]);
            target:addStatusEffect(v[1], power, 0, duration);
            pet:addStatusEffect(v[2], power, 0, duration);
        end
    end


--    local success = MobStatusEffectMove(pet, target, EFFECT_TERROR, 1, 0, duration);
--    if (success == 242) then
--        target:setPendingMessage(277, EFFECT_TERROR);
--        target:setPendingMessage(277, firstEffect);
--        target:setPendingMessage(277, secondEffect);
--        target:addStatusEffect(firstEffect, power, 0, duration2);
--        target:addStatusEffect(secondEffect, power, 0, duration2);
--    end

end;