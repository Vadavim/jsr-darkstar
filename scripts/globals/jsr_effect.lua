require("scripts/globals/status");

function noDominantRune(target)
    local ignis = target:getVar("ignis");
    local gelus = target:getVar("gelus");
    local flabra = target:getVar("flabra");
    local tellus = target:getVar("tellus");
    local sulpor = target:getVar("sulpor");
    local unda = target:getVar("unda");
    local lux = target:getVar("lux");
    local tenebrae = target:getVar("tenebrae");
    
    return (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2);
end;