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
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(73);
--    ally = caster:getRecentAlly();
--    ally:addMod(MOD_ENMITY, -25);
--    ally:addMod(MOD_HPHEAL, caster:getMainLvl());

    
	return 0;
end;