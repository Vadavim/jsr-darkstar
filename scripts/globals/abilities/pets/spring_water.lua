---------------------------------------------------
-- Spring Water
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local base = 47 + pet:getMainLvl()*3 + skill:getTP() / 5;
    local owner = pet:getMaster();
    local bonus = owner:getMod(MOD_CHR) + owner:getMod(MOD_SUMMONING);
    base = base + bonus;

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP(); --cap it
    end
    target:delStatusEffect(EFFECT_BLINDNESS);
    target:delStatusEffect(EFFECT_POISON);
    target:delStatusEffect(EFFECT_PARALYSIS);
    target:delStatusEffect(EFFECT_DISEASE);
    target:delStatusEffect(EFFECT_PETRIFICATION);
        target:wakeUp();
    target:delStatusEffect(EFFECT_SILENCE);
    target:delStatusEffect(EFFECT_SLOW);
    end
    skill:setMsg(MSG_SELF_HEAL);
    target:addHP(base);
    return base;
end
