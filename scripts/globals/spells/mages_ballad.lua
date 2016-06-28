-----------------------------------------
-- Spell: Mage's Ballad
-- Gradually restores target's MP.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local power = 1;

    local iBoost = caster:getMod(MOD_BALLAD_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    local duration = 600;
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 120;
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
    
    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    
    if not (target:addBardSong(caster,EFFECT_BALLAD,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(75);
    end

    return EFFECT_BALLAD;
end;
