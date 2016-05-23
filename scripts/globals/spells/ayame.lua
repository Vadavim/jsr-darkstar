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
    if not (caster:isUniqueAlly(76)) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE;
    end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnAlly(76);
    ally = caster:getRecentAlly();
    ally:addMod(MOD_ENMITY, -25);
    ally:addMod(MOD_HPHEAL, caster:getMainLvl());

    
	return 0;
end;