-----------------------------------------
-- Spell: Ramuh
-- Summons Ramuh to fight by your side
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
    caster:spawnPet(PET_RAMUH);
    summonCost(caster);

    local enspellPower = 1 + caster:getMainLvl() / 2;

    local pet = caster:getPet();
    if (pet ~= nil) then
        pet:addStatusEffect(EFFECT_RAMUH_S_FAVOR, 1, 15, 3000);
        pet:addStatusEffect(EFFECT_ENTHUNDER,enspellPower,0,3000);
    end

    return 0;
end;
