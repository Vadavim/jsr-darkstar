-----------------------------------------
-- Spell: Blaze Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
--    local duration = SPIKE_EFFECT_DURATION;
    local duration = 300;
  local typeEffect = EFFECT_BLAZE_SPIKES;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local int = caster:getStat(MOD_INT);
    local magicAtk = caster:getMod(MOD_MATT);
    local power = ((int + 2) / 4 + 4) * (1 + (magicAtk / 100));

   if (target:addStatusEffect(typeEffect,power,0,duration)) then
     spell:setMsg(230);
   else
     spell:setMsg(75);
   end

    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_IGNIS) >= 1) then
        power = power * 1.5;
    end

    power, duration = applyEmbolden(caster, power, duration);


   return typeEffect;
end;
