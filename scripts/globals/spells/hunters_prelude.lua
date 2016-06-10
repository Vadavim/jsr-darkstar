-----------------------------------------
-- Spell: Hunter's Prelude
-- Gives party members ranged attack accuracy
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iType = caster:getWeaponSkillType(SLOT_RANGED);
    local iLvl = 0;
    if (iType == SKILL_WND or iType == SKILL_STR) then
        iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);
    end

    local power = 5;

    if (sLvl+iLvl > 85) then
        power = power + math.floor((sLvl+iLvl-300) / 10);
    end
    
    if (power >= 30) then
        power = 30;
    end
    
    local iBoost = caster:getMod(MOD_PRELUDE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + 1 + (iBoost-1)*3;
    end

    
    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(EFFECT_MARCATO);
    
    local duration = 600;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
    
    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end
    
    if not (target:addBardSong(caster,EFFECT_PRELUDE,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(75);
    end

    return EFFECT_PRELUDE;
end;
