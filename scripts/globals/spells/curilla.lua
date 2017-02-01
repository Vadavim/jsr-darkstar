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

    if (caster:hasHate()) then
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
    local level = ally:getMainLvl();
    ally:addMod(MOD_MAGIC_DAMAGE, level * 2);
    ally:addMod(MOD_ATT, level / 1.5);
--    ally:addMod(MOD_DEF, level * 1.33);
    ally:addMod(MOD_UDMGPHYS, -15);
    ally:addMod(MOD_UDMGMAGIC, -15);
    ally:addMod(MOD_ENMITY, 15);
    ally:addMod(MOD_ENMITY_LOSS_REDUCTION, 15);
    ally:addMod(MOD_MACC, 10 + level / 1.5);

    ally:setLocalVar("isAlly", 1);
--    ally:addMod(MOD_STR, level / 3);
--    ally:addMod(MOD_VIT, level / 2.5);
--    ally:addMod(MOD_DEX, level / 3);
--    ally:addMod(MOD_AGI, level / 4);
--    ally:addMod(MOD_INT, level / 4);
--    ally:addMod(MOD_MND, level / 3);
--    ally:addMod(MOD_CHR, level / 3);


    return 0;
end;