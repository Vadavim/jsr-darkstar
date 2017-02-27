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
    if not (caster:isUniqueAlly(80)) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE;
    end

    if (caster:hasHate()) then
        return MSGBASIC_UNABLE_TO_CAST;
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
	caster:spawnAlly(80);
    local ally = caster:getRecentAlly();
    local level = ally:getMainLvl();
    local rank = caster:getVar("ally_80");
    ally:addMod(MOD_ATTP, 18);
    ally:addMod(MOD_DEFP, 30);
    ally:addMod(MOD_MACC, 10 + level / 1.5);
    ally:setLocalVar("isAlly", 80);
    ally:setLocalVar("rank", rank);
    doAllyBuff(caster, ally, rank);
    if (rank >= 1 and level >= 5) then ally:addMod(MOD_CRITHITRATE, 2); end
    if (rank >= 3 and level >= 15) then ally:addMod(MOD_FIRERES, 40); end
    if (rank >= 5 and level >= 25) then ally:addMod(MOD_MDEF, 20); end
    if (rank >= 7 and level >= 35) then ally:addMod(MOD_ENMITY, -5); end


--    ally:addMod(MOD_STR, level / 2.5);
--    ally:addMod(MOD_VIT, level / 2.5);
--    ally:addMod(MOD_DEX, level / 3);
--    ally:addMod(MOD_AGI, level / 4);
--    ally:addMod(MOD_INT, level / 5);
--    ally:addMod(MOD_MND, level / 4);
--    ally:addMod(MOD_CHR, level / 4);

    
	return 0;
end;