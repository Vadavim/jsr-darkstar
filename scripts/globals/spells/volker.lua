-----------------------------------------


-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    end
    if not (caster:isUniqueAlly(73)) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE;
	end

	if (caster:hasStatusEffect(EFFECT_CONFRONTATION)) then
		return MSGBASIC_UNABLE_TO_CAST;
    end
    if (not doAllyCost(caster, 10 * caster:getMainLvl())) then
        return MSGBASIC_UNABLE_TO_CAST;
    end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(73);
    local ally = caster:getRecentAlly();
    local level = ally:getMainLvl();
    ally:addMod(MOD_ATTP, 12);
    ally:addMod(MOD_ENMITY, -15);
    ally:addMod(MOD_MACC, 10 + level / 1.5);
    ally:setLocalVar("isAlly", 1);

--    ally:addMod(MOD_STR, level / 2.5);
--    ally:addMod(MOD_VIT, level / 2.5);
--    ally:addMod(MOD_DEX, level / 3);
--    ally:addMod(MOD_AGI, level / 4);
--    ally:addMod(MOD_INT, level / 5);
--    ally:addMod(MOD_MND, level / 4);
--    ally:addMod(MOD_CHR, level / 4);

    
	return 0;
end;