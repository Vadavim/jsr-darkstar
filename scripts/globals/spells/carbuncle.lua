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
    return summonCheck(caster, target, spell);
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_CARBUNCLE);
    local power = math.floor(1 + caster:getMainLvl() / 8);
    local enspellPower = 1 + caster:getMainLvl() / 2;
    local pet = caster:getPet();
    if (pet ~= nil) then
        summonCost(caster, pet);
        pet:addStatusEffect(EFFECT_CARBUNCLE_S_FAVOR, power, 15, 3000);
        pet:addStatusEffect(EFFECT_ENLIGHT,enspellPower,0,30000);
--        doSiphonBuff(caster, pet);
--        summonAvatar(caster);
    end
    
	return 0;
end;
