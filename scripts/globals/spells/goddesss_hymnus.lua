-----------------------------------------
-- Spell: Goddess's Hymnus
-- Grants Reraise.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

        local duration = 600;

        duration = duration * (caster:getMod(MOD_SONG_DURATION_BONUS)/100)
        local power = 1;

        if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
            power = 3;
            duration = 200;
        elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
            power = 2;
            caster:delStatusEffect(EFFECT_MARCATO);
        end

        power = power + math.floor(caster:getMod(MOD_HYMNUS_EFFECT) / 2);


        target:addBardSong(caster,EFFECT_HYMNUS,power,0,duration,caster:getID(), 0, power);

    return EFFECT_HYMNUS;
end;