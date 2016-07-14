-----------------------------------------


-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA;
    end
    if not (caster:isUniqueAlly(79)) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE;
    end

    if (caster:hasStatusEffect(EFFECT_CONFRONTATION)) then
        return MSGBASIC_UNABLE_TO_CAST;
    end
    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnAlly(79);
    local ally = caster:getRecentAlly();
    ally:addMod(MOD_MATT, caster:getMainLvl() / 4);
    ally:addMod(MOD_ENMITY, 40);

        --    ally = caster:getRecentAlly();
        --    ally:addMod(MOD_HPHEAL, caster:getMainLvl());


    return 0;
end;