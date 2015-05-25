-----------------------------------------
-- Spell: Carbuncle
-- Summons Carbuncle to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    else
        return 0;
    end
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_CARBUNCLE);
    local power = math.floor(1 + caster:getMainLvl() / 8);
    local pet = caster:getPet();
    if (pet ~= nill) then
        pet:addStatusEffect(EFFECT_CARBUNCLE_S_FAVOR, power, 15, 3000);
    end
    
	return 0;
end;