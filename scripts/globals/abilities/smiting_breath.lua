
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------
local breaths = {
    {630, MOD_FIREDEF},
    {631, MOD_ICEDEF},
    {632, MOD_WINDDEF},
    {633, MOD_EARTHDEF},
    {634, MOD_THUNDERDEF},
    {635, MOD_WATERDEF}
};

function onUseAbility(player,target,ability)
    local pet = player:getPet();
    if (pet == nil or player:getPetID() ~= PET_WYVERN) then
        return;
    end

    local lowest = 0;
    local id = 0;

    for i,v in ipairs(breaths) do
        if target:getMod(v[2]) < lowest then
            lowest = target:getMod(v[2]);
            id = v[1];
        end
    end

    if (id == 0) then
        id = breaths[math.random(1,6)][1];
    end

    local tpBonus = player:getTP() * 0.25;
    pet:addTP(tpBonus * 4);
    player:delTP(tpBonus);

    pet:useJobAbility(id, target);



end;