-----------------------------------------
-- Spell: Ifrit
-- Summons Ifrit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA;
    elseif (caster:hasPet()) then
        return MSGBASIC_ALREADY_HAS_A_PET;
    elseif (caster:getObjType() == TYPE_PC) then
        return avatarMiniFightCheck(caster);
    end
    return 0;
end;

function onSpellCast(caster,target,spell)
    caster:spawnPet(PET_IFRIT);
    local enspellPower = 1 + caster:getMainLvl() / 2;

    local pet = caster:getPet();
    if (pet ~= nill) then
        pet:addStatusEffect(EFFECT_IFRIT_S_FAVOR, 1, 15, 3000);
        pet:addStatusEffect(EFFECT_ENFIRE,enspellPower,0,3000);
        doSiphonBuff(caster, pet);
    end

    return 0;
end;
