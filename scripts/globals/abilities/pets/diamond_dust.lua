---------------------------------------------------
-- Diamond Dust
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local level = player:getMainLvl() * 2;

    if(player:getMP()<level) then
        return 87,0;
    end

    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    return doAstralFlow(target, pet, skill, master, ELE_ICE);
end

