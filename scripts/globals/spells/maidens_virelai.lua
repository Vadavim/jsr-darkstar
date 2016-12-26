-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:getPet() ~= nil) then
        return MSGBASIC_ALREADY_HAS_A_PET;
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return MSGBASIC_THAT_SOMEONES_PET;
    end

    -- Per wiki, Virelai wipes all shadows even if it resists or the target is immune to charm
    -- This can't be done in the onSpellCast function (that runs after it "hits")
    spell:setFlag(SPELLFLAG_WIPE_SHADOWS);

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

    return EFFECT_CHARM_I;
end;

