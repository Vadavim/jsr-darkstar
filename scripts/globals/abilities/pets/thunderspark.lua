---------------------------------------------------
-- Thunderspark M=whatever
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(35);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
    local damage = avatarMagicalMove(target, pet, skill, ELE_THUNDER, 55 + level * 1.5, 2.5, 0.05 + level / 450);

    local duration = utils.clamp(30 + chr + summoning, 30, 90);
    duration = duration + tp / 100;

    local success = MobStatusEffectMove(pet, target, EFFECT_PARALYSIS, 35, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end


    return damage;
end
