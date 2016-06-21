---------------------------------------------------
-- Somnolence
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(45);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local dmg = 10 + pet:getMainLvl() * 2
    local duration = utils.clamp(20 + chr / 2 + summoning / 2, 20, 40);

    local damage = avatarMagicalMove(target, pet, skill, ELE_DARK, 10 + level * 2, 0.5 + level / 20, 0.01 + level / 350);


    local success = MobStatusEffectMove(pet, target, EFFECT_WEIGHT, 80, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end

    return dmg;
end