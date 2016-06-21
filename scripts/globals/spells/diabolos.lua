-----------------------------------------
-- Spell: Diabolos
-- Summons Diabolos to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/bcnm");

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
    caster:spawnPet(PET_DIABOLOS);

    local enspellPower = 1 + caster:getMainLvl() / 2;
    local pet = caster:getPet();
    if (pet ~= nill) then
        local refreshBuff = 1;
        if (pet:getMainLvl() > 60) then refreshBuff = 2 end;
        pet:addStatusEffect(EFFECT_DIABOLOS_S_FAVOR, refreshBuff, 15, 3000);
        pet:addStatusEffect(EFFECT_ENDARK,enspellPower,0,3000);
        doSiphonBuff(caster, pet);
    end

    return 0;
end;
