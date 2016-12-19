-----------------------------------
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/jsr_mob");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_XP, 1);
    mob:setMod(MOD_ENSPELL_DMG, 15);
    mob:setMod(MOD_ENSPELL, 8);
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setMod(MOD_DARKRES, 50);
    mob:setMod(MOD_DARKDEF, 80);
    mob:setMod(MOD_LIGHTRES, -40);
    mob:setMod(MOD_LIGHTDEF, -60);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 65 and mob:getLocalVar("scarlet") == 0) then
        mob:useJobAbility(ABILITY_SCARLET_DELIRIUM, mob);
        mob:setLocalVar("scarlet", 1);

    elseif (mob:getLocalVar("waterga") == 0) then
        local scarlet = mob:getStatusEffect(EFFECT_SCARLET_DELIRIUM);
        if (scarlet ~= nil) then
            local subPower = scarlet:getSubPower();
            if (subPower >= 50) then
                mob:castSpell(199, target);
                mob:setLocalVar("waterga", 1);
            end
        end

    end


end


function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 3);
end;

