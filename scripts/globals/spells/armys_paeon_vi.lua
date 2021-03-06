-----------------------------------------
-- Spell: Army's Paeon VI
-- Gradually restores target's HP.
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

    local power = 6;

    if (sLvl+iLvl > 450) then
        power = power + 1;
    end

    local iBoost = caster:getMod(MOD_PAEON_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;
    
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
    
    if not (target:addBardSong(caster,EFFECT_PAEON,power,0,duration,caster:getID(), 0, 6)) then
        spell:setMsg(75);
    end

    return EFFECT_PAEON;
end;