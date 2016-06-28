-----------------------------------------
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 30;
    local duration = 600;
    duration = duration * (caster:getMod(MOD_SONG_DURATION_BONUS)/100)

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
        duration = 200;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
        caster:delStatusEffect(EFFECT_MARCATO);
    end

    if ((caster:getID() == target:getID()) and caster:hasStatusEffect(EFFECT_TENUTO)) then
        power = power * 1.5;
    end

    target:addBardSong(caster,EFFECT_CAPRICCIO,power,0,duration,caster:getID(), 0, 1);

    return EFFECT_CAPRICCIO;
end;