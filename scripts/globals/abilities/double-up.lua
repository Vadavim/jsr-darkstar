-----------------------------------
-- Ability: Double Up
-- Enhances an active Phantom Roll effect that is eligible for Double-Up.
-- Obtained: Corsair Level 5
-- Recast Time: 8 seconds
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (not player:hasStatusEffect(EFFECT_DOUBLE_UP_CHANCE)) then
        return MSGBASIC_NO_ELIGIBLE_ROLL,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

fiveRolls = {ABILITY_CORSAIRS_ROLL, ABILITY_EVOKERS_ROLL, ABILITY_ROGUES_ROLL,
            ABILITY_FIGHTERS_ROLL, ABILITY_WIZARDS_ROLL};

fourRolls = {ABILITY_NINJA_ROLL, ABILITY_HUNTERS_ROLL, ABILITY_CHAOS_ROLL,
            ABILITY_DRACHEN_ROLL, ABILITY_BEAST_ROLL, ABILITY_WARLOCKS_ROLL};

threeRolls = {ABILITY_MONKS_ROLL, ABILITY_PUPPET_ROLL, ABILITY_GALLANTS_ROLL,
            ABILITY_HEALERS_ROLL, ABILITY_DANCERS_ROLL};

twoRolls = {ABILITY_MAGUSS_ROLL, ABILITY_CHORAL_ROLL, ABILITY_SAMURAI_ROLL,
            ABILITY_SCHOLARS_ROLL};
function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        local du_effect = caster:getStatusEffect(EFFECT_DOUBLE_UP_CHANCE);
        local prev_roll = caster:getStatusEffect(du_effect:getSubPower());
        local roll = prev_roll:getSubPower();
        local oldRoll = roll;
        local job = du_effect:getTier()
        caster:setLocalVar("corsairActiveRoll", du_effect:getSubType())
        local snake_eye = caster:getStatusEffect(EFFECT_SNAKE_EYE);
        if (snake_eye) then
            if (prev_roll:getPower() > 5 and math.random(100) < snake_eye:getPower()) then
                roll = 11
            else
                roll = roll + 1
            end
            caster:delStatusEffect(EFFECT_SNAKE_EYE)
        else
            local newRoll = math.random(1,6);
            if (caster:getLocalVar("crookedCards") == 1) then
                caster:setLocalVar("crookedCards", 0);
                newRoll = 6;
            end


            roll = roll + newRoll;

            if (caster:getLocalVar("cuttingCards") == 1) then
                caster:setLocalVar("cuttingCards", 0);
                roll = math.floor(oldRoll / 2);
            end

            if (roll > 12) then
                roll = 12
                caster:delStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE)
            end
        end

        if (roll == 11) then
            caster:resetRecast(RECAST_ABILITY, 193)
        end
        caster:setLocalVar("corsairRollTotal", roll)
        action:speceffect(caster:getID(),roll-prev_roll:getSubPower())
        checkForJobBonus(caster, job)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    local prev_ability = getAbility(caster:getLocalVar("corsairActiveRoll"));

    if (prev_ability) then
        action:animation(target:getID(),prev_ability:getAnimation());
        action:actionID(prev_ability:getID()+16)
        dofile("scripts/globals/abilities/"..prev_ability:getName()..".lua");
        local total = applyRoll(caster,target,ability,action,total)
        local msg = ability:getMsg()
        if msg == 420 then
            ability:setMsg(424)
        elseif msg == 422 then
            ability:setMsg(425)
        end
        return total;
    end
end;
