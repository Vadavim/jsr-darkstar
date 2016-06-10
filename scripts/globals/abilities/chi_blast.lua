-----------------------------------
-- Ability: Chi Blast
-- Releases Chi to attack an enemy.
-- Obtained: Monk Level 41
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local boost = player:getStatusEffect(EFFECT_BOOST);
    local bonus = 0;
    if (boost ~= nil) then
        local bSubPower = boost:getSubPower();

        if (bSubPower >= 250) then
            target:delStatusEffectSilent(EFFECT_DIA);
            target:delStatusEffect(EFFECT_BIO);
            target:addStatusEffect(EFFECT_DIA, 5 + player:getStat(MOD_MND) / 3, 3, 120, FLAG_ERASABLE, 12);
            target:setPendingMessage(277, EFFECT_DIA);
        end

        if (bSubPower >= 350) then
            local effect = target:dispelStatusEffect();
            if (effect ~= EFFECT_NONE) then
                target:setPendingMessage(427, effect);
            end


        end



        bSubPower = (bSubPower * 0.75 * (1 + bSubPower / 500)) * (0.01 + 0.008 * player:getMainLvl());
        bonus = bSubPower;


    end
    
    local dmg = math.floor(player:getStat(MOD_MND)*(2.5+(math.random()/2)))  + bonus;
    local mATK = 1 + player:getMod(MOD_MATT) / 100;
    local mDEF = 1 + target:getMod(MOD_MDEF) / 100;
    local tATK = 1 + player:getMod(MOD_LIGHTATT) / 100;
    local lDEF = 1 - target:getMod(MOD_LIGHTDEF) / 255;
    dmg = dmg * mATK * tATK * lDEF * mDEF;

    dmg = utils.stoneskin(target, dmg);
    
    target:delHP(dmg);
    
    target:updateClaim(player);
    target:updateEnmityFromDamage(player,dmg);
    player:delStatusEffect(EFFECT_BOOST);
    return dmg;
end;
