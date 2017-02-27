
require("scripts/globals/status");
require("scripts/globals/magic");


function doConserveTP(player, tp)
    local cTP = player:getMod(MOD_CONSERVE_TP);
    if (math.random(1, 100) < cTP) then
        tp = (tp * math.random(4, 20)) / 24;
    end
    return tp;
end

function handleContradance(player)

    return tp
end