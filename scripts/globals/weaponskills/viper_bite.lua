-----------------------------------
-- Viper Bite
-- Dagger weapon skill
-- Skill level: 100
-- Deals double damage and Poisons target. Duration of poison varies with TP.
-- Doubles attack and not damage.
-- Despite the animation showing two swings, this is a single-hit weapon skill.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: :
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 2;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 1.0;
        params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    end

    local hasSneak = player:hasStatusEffect(EFFECT_SNEAK_ATTACK);

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);


    local power = (1 + player:getStat(MOD_DEX) / 5) * (tp / 1000);
    if (hasSneak) then
        power = power * 1.5;
    end

    local resist = applyResistanceWeaponskill(player, target, params, tp, ELE_WATER, SKILL_DAG);
    local duration = 60;

    local bonusDamage = 0;
    local bonusMult = tp / 2000;
    local poison = target:getStatusEffect(EFFECT_POISON);
    if (damage > 0 and poison ~= nil) then
        bonusDamage = bonusDamage + (poison:getPower() * poison:getLastTick()) * bonusMult;
        print("Remaining duration: %d\n", poison:getLastTick());
        target:delStatusEffect(EFFECT_POISON);
    end

    local poison2 = target:getStatusEffect(EFFECT_POISON_II);
    if (damage > 0 and poison2 ~= nil) then
        bonusDamage = bonusDamage + (poison2:getPower() * poison2:getLastTick()) * bonusMult;
        print(poison2:getLastTick());
        target:delStatusEffect(EFFECT_POISON_II);
    end

    local bio = target:getStatusEffect(EFFECT_BIO);
    if (damage > 0 and bio ~= nil) then
        bonusDamage = bonusDamage + (bio:getPower() * bio:getLastTick()) * bonusMult;
        print(bio:getLastTick());
        target:delStatusEffect(EFFECT_BIO);
    end

    if (hasSneak) then
        bonusDamage = bonusDamage * 1.33;
    end


    target:delHP(bonusDamage);
    local damage = damage + bonusDamage;

--    local bio = target:getStatusEffect(EFFECT_BIO);
--
    if (bonusDamage == 0 and damage > 0 and resist > 0.25 and not target:hasStatusEffect(EFFECT_POISON)) then
        target:addStatusEffect(EFFECT_POISON, power, 3, duration * resist);
        target:setPendingMessage(277, EFFECT_POISON);
    end

    return tpHits, extraHits, criticalHit, damage;

end
