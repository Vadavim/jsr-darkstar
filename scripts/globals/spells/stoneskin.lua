-----------------------------------------
-- Spell: Stoneskin
-----------------------------------------
-- http://wiki.ffxiclopedia.org/wiki/Stoneskin
-- Max 350 damage absorbed

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local pMod = (caster:getSkillLevel(ENHANCING_MAGIC_SKILL)/3)+caster:getStat(MOD_MND);
    local pAbs = 0;
    local pEquipMods = (caster:getMod(MOD_STONESKIN_BONUS_HP));
    local duration = 300;
    if (pMod < 80) then
        pAbs = pMod;
    elseif (pMod <= 130) then
        pAbs = 2*pMod - 60;
    elseif (pMod > 130) then
        pAbs = 3*pMod - 190;
    end

    -- hard cap of 350 from natural power
    -- pAbs = utils.clamp(1, STONESKIN_CAP); This just always sets it to 350, let's use the actual value, shall we?
    pAbs = utils.clamp(pAbs, 1, STONESKIN_CAP);

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
    end


    local final = pAbs + pEquipMods;
    if (caster:isNM()) then final = final * 2.5; end;


    if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
        final = final * 1.5;
    end

    local subPower = 0
    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_TELLUS) >= 1) then
        final = final * 1.25;
        subPower = 10;
    end

    final, duration = applyEmbolden(caster, final, duration);

    if (target:addStatusEffect(EFFECT_STONESKIN,final,0,duration, 0, subPower)) then
        spell:setMsg(230);
    else
        spell:setMsg(MMSG_BUFF_FAIL);
    end

    return EFFECT_STONESKIN;
end;