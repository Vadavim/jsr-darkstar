-----------------------------------------
-- Spell: Shiva
-- Summons Shiva to fight by your side
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
    caster:spawnPet(PET_SHIVA);

    local enspellPower = 1 + caster:getMainLvl() / 2;

    local pet = caster:getPet();
    if (pet ~= nil) then
        summonCost(caster, pet);
        pet:addStatusEffect(EFFECT_SHIVA_S_FAVOR, 1, 15, 30000);
        pet:addStatusEffect(EFFECT_ENBLIZZARD,enspellPower,0,30000);
    end

    return 0;
end;
