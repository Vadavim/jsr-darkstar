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

    if (not doAllyCost(caster, 15 * caster:getMainLvl())) then
        return MSGBASIC_UNABLE_TO_CAST;
    end

    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnAlly(79);
    local ally = caster:getRecentAlly();
    ally:addMod(MOD_MATT, caster:getMainLvl() / 2);
    ally:addMod(MOD_DEF, caster:getMainLvl() * 1.33);
    ally:addMod(MOD_UDMGPHYS, -15);
    ally:addMod(MOD_UDMGMAGIC, -15);
    ally:addMod(MOD_ENMITY, 35);
    ally:addMod(MOD_ENMITY_LOSS_REDUCTION, 60);

        --    ally = caster:getRecentAlly();
        --    ally:addMod(MOD_HPHEAL, caster:getMainLvl());


    return 0;
end;