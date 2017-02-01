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
    if not (caster:isUniqueAlly(74)) then
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
	caster:spawnAlly(74);
    local ally = caster:getRecentAlly();
    ally:addMod(MOD_ENMITY, -25);
    ally:addMod(MOD_PARRY, 100);
	ally:addMod(MOD_TACTICAL_PARRY, 250);
	ally:addMod(MOD_MACC, 10 + caster:getMainLvl() / 1.5);
	ally:setLocalVar("isAlly", 1);
--	ally:addMod(MOD_STORETP, 200);
--	ally:addMod(MOD_REGAIN, 200);
--    ally:addMod(MOD_HPHEAL, caster:getMainLvl());

    
	return 0;
end;