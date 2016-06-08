-----------------------------------------
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 20;
    local diff = (player:getMod(MOD_CHR) - target:getMod(MOD_CHR)) / 2;

    if (math.random(0,99) >= chance + diff) then
        return 0,0,0;
    else
        local dmg = math.random(9,16);
        local params = {};
        params.bonusmab = 0;
        params.includemab = true;
        dmg = addBonusesAbility(player, ELE_WATER, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_WATER,0);
        dmg = adjustForTarget(target,dmg,ELE_WATER);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_WATER,dmg);

        local message = MSGBASIC_ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = MSGBASIC_ADD_EFFECT_HEAL;
        end

        return SUBEFFECT_WATER_DAMAGE,message,dmg;
    end
end;