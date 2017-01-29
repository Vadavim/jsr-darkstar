-----------------------------------------
-- ID: 18152
-- Item: Venom Bolt
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl()) + player:getMod(MOD_CHR)
        chance = utils.clamp(chance, 5, 95);
    end
    if (target:hasImmunity(256)) then
        spell:setMsg(75);
    elseif (math.random(0,99) >= chance or applyResistanceItemEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_POISON)
        local duration = 60;
        if (not target:hasStatusEffect(EFFECT_POISON)) then
            local marks = player:getSkillLevel(SKILL_MRK);
            local power = 2 + marks * 0.08;

            if (player:hasStatusEffect(EFFECT_FLASHY_SHOT)) then
                power = power + 2;
                duration = duration + 30;
            end

            if (player:hasStatusEffect(EFFECT_TRICK_ATTACK)) then
                power = power + 3;
                duration = duration + 45;
                player:delStatusEffect(EFFECT_TRICK_ATTACK);
            end

            target:addStatusEffect(EFFECT_POISON, power, 3, 60);
        end
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;