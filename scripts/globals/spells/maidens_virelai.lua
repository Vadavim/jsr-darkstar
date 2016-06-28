-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    -- Ix'Aern DRG pets are Wyverns that 2hour.
    if (mob:getID() >= 16921023 and mob:getID() <= 16921025) then
        if (caster:getStatusEffect(EFFECT_SOUL_VOICE)  == nil) then
            return 1;
        end
    end
    
    return 0;
end;

function onSpellCast(caster,target,spell)

    local duration = 90;
    local pCHR = caster:getStat(MOD_CHR);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);

    if (caster:hasStatusEffect(EFFECT_MARCATO)) then
        dCHR = dCHR + 40;
        caster:delStatusEffect(EFFECT_MARCATO);
    end



    local resm = applyResistanceEffect(caster,spell,target,dCHR,SINGING_SKILL,0,EFFECT_CHARM_I);

    if (resm < 0.5) then
        spell:setMsg(85);--resist message
    else
        local iBoost = caster:getMod(MOD_VIRELAI) + caster:getMod(MOD_ALL_SONGS_EFFECT);

        duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

        if (target:addStatusEffect(EFFECT_CHARM_I,1,0,duration)) then
            spell:setMsg(237);
        else
            spell:setMsg(75);
        end
    end

    return EFFECT_CHARM;
end;

