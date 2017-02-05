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
    return summonCheck(caster, target, spell);
end;

function onSpellCast(caster,target,spell)
    caster:spawnPet(PET_TITAN);

    local enspellPower = 1 + caster:getMainLvl() / 2;

    local pet = caster:getPet();
    if (pet ~= nil) then
        summonCost(caster, pet);
        pet:addStatusEffect(EFFECT_TITAN_S_FAVOR, 10 + caster:getMainLvl(), 15, 3000);
        pet:addStatusEffect(EFFECT_ENSTONE,enspellPower,0,3000);
    end

    return 0;
end;
