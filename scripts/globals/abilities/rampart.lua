-----------------------------------
-- Ability: Rampart
-- Grants a Magic Shield effect and enhances defense for party members within area of effect.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
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
    local merit = player:getMerit(MERIT_RAMPART_RECAST) / 2;
    local iron = player:getMerit(MERIT_IRON_WILL);
    local duration = 30 + player:getMod(MOD_RAMPART_DURATION);
    target:addStatusEffect(EFFECT_MAGIC_SHIELD,4,0,duration, 0, 80 + merit);
    local effect = target:getStatusEffect(EFFECT_MAGIC_SHIELD);
    if (iron > 0 and effect ~= nil) then
        local resistBonus = iron / 5;
        target:addMod(MOD_POISONRES, resistBonus);
        target:addMod(MOD_VIRUSRES, resistBonus);
        target:addMod(MOD_PETRIFYRES, resistBonus);
        target:addMod(MOD_CURSERES, resistBonus);
        target:addMod(MOD_BLINDRES, resistBonus);
        target:addMod(MOD_SLOWRES, resistBonus);
        target:addMod(MOD_GRAVITYRES, resistBonus);
        target:addMod(MOD_BINDRES, resistBonus);
        target:addMod(MOD_DEATHRES, resistBonus);
        target:addMod(MOD_SILENCERES, resistBonus);
        target:addMod(MOD_AMNESIARES, resistBonus);
        target:addMod(MOD_CHARMRES, resistBonus);
        target:addMod(MOD_STUNRES, resistBonus);
        target:addMod(MOD_PARALYZERES, resistBonus);
        target:addMod(MOD_SLEEPRES, resistBonus);
        target:addMod(MOD_LULLABYRES, resistBonus);
        target:addMod(MOD_SPELLINTERRUPT, iron);
        effect:addMod(MOD_POISONRES, resistBonus);
        effect:addMod(MOD_VIRUSRES, resistBonus);
        effect:addMod(MOD_PETRIFYRES, resistBonus);
        effect:addMod(MOD_CURSERES, resistBonus);
        effect:addMod(MOD_BLINDRES, resistBonus);
        effect:addMod(MOD_SLOWRES, resistBonus);
        effect:addMod(MOD_GRAVITYRES, resistBonus);
        effect:addMod(MOD_BINDRES, resistBonus);
        effect:addMod(MOD_DEATHRES, resistBonus);
        effect:addMod(MOD_SILENCERES, resistBonus);
        effect:addMod(MOD_AMNESIARES, resistBonus);
        effect:addMod(MOD_CHARMRES, resistBonus);
        effect:addMod(MOD_STUNRES, resistBonus);
        effect:addMod(MOD_PARALYZERES, resistBonus);
        effect:addMod(MOD_SLEEPRES, resistBonus);
        effect:addMod(MOD_LULLABYRES, resistBonus);
        effect:addMod(MOD_SPELLINTERRUPT, iron);
    end

end;