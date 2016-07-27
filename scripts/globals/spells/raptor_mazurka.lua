-----------------------------------------
-- Spell: Raptor Mazurka
-- Gives party members enhanced movement
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local power = 12;
    
    local iBoost = caster:getMod(MOD_MAZURKA_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    
    local duration = 600;
    
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
    
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 1.5;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.25
    end
    caster:delStatusEffect(EFFECT_MARCATO);
    
    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    
    if not (target:addBardSong(caster,EFFECT_MAZURKA,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(75);
    end

    return EFFECT_MAZURKA;
end;

