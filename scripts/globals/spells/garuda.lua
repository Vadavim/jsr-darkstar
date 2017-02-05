-----------------------------------------
-- Spell: Garuda
-- Summons Garuda to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return summonCheck(caster, target, spell);
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_GARUDA);
    local enspellPower = 1 + caster:getMainLvl() / 2;
    
    local pet = caster:getPet();
    if (pet ~= nil) then
        summonCost(caster, pet);
        pet:addStatusEffect(EFFECT_GARUDA_S_FAVOR, 1, 15, 3000);
        pet:addStatusEffect(EFFECT_ENAERO,enspellPower,0,3000);
    end
    
	return 0;
end;
