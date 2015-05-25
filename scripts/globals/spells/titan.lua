-----------------------------------------
-- Spell: Titan
-- Summons Titan to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if (not caster:canUsePet()) then
		return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif(caster:getObjType() == TYPE_PC) then
		return avatarMiniFightCheck(caster);
	end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_TITAN);
    local power = math.floor(10 + caster:getMainLvl() / 2);
    local pet = caster:getPet();
    if (pet ~= nill) then
        pet:addStatusEffect(EFFECT_TITAN_S_FAVOR, power, 15, 3000);
    end
	return 0;
end;