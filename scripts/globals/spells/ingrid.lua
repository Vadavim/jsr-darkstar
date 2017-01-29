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
    local level = ally:getMainLvl();
--    ally:addMod(MOD_MATT, level / 4);
    ally:addMod(MOD_ENMITY, -15);
    if (ally:getMainLvl() >= 25) then
        ally:addMod(MOD_REFRESH, level / 30);
    end
    ally:addMod(MOD_MACC, 10 + level / 1.5);
    ally:setLocalVar("isAlly", 1);

--    ally:addMod(MOD_STR, level / 6);
--    ally:addMod(MOD_VIT, level / 6);
--    ally:addMod(MOD_DEX, level / 6);
--    ally:addMod(MOD_AGI, level / 4);
--    ally:addMod(MOD_INT, level / 3.5);
--    ally:addMod(MOD_MND, level / 4);
--    ally:addMod(MOD_CHR, level / 2.5);


        --    ally = caster:getRecentAlly();
        --    ally:addMod(MOD_ENMITY, -25);
        --    ally:addMod(MOD_HPHEAL, caster:getMainLvl());


    return 0;
end;