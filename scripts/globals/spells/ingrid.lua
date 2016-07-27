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
    if not (caster:isUniqueAlly(78)) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE;
    end

    if (caster:hasStatusEffect(EFFECT_CONFRONTATION)) then
        return MSGBASIC_UNABLE_TO_CAST;
    end
    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnAlly(78);
    local ally = caster:getRecentAlly();
    ally:addMod(MOD_MATT, caster:getMainLvl() / 4);
    ally:addMod(MOD_ENMITY, -25);
    if (ally:getMainLvl() >= 25) then
        ally:addMod(MOD_REFRESH, caster:getMainLvl() / 25);
    end

        --    ally = caster:getRecentAlly();
        --    ally:addMod(MOD_ENMITY, -25);
        --    ally:addMod(MOD_HPHEAL, caster:getMainLvl());


    return 0;
end;