require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/jsr_augment");
require("scripts/globals/common");
require("scripts/globals/quests");

WOOD = "woodworking"
FISH = "fishing"
SMIT = "smithing"
GOLD = "goldsmithing"
WEAV = "weaving"
LEAT = "leathercraft"
BONE = "bonecraft"
ALCH = "alchemy"
COOK = "cooking"


function doesNotHaveItem(player, itemid)
    for i=0, 12 do
        if (player:hasItem(2176, i)) then
            return false;
        end
    end
    return true;
end


local function addRewards(mob, player, curRewards, rewardsTable)
    local zoneid = mob:getZoneID();
    local level = mob:getMainLvl();

    for i,v in pairs(rewardsTable) do
        if (doesNotHaveItem(player, v[1]) and level >= v[2] and level <= v[3]) then
            local containsId = v[4] == 0;
            if (not containsId) then
                for n,k in pairs(v[4]) do
                    if (zoneid == k) then
                        containsId = true;
                        break;
                    end
                end
            end

            if (containsId) then
                table.insert(curRewards, v[1]);
            end
        end

    end

    return curRewards;
end



function noDominantRune(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    return (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2);
end;

local gil_zone_ids = {
    [44] = 6385,[218] = 6385,[215] = 6385,[255] = 6385,[254] = 6385,[15] = 6385,[132] = 6385,[216] = 6385,[45] = 6385,[253] = 6385,[217] = 6385,[50] = 222,[50] = 226,[33] = 6385,[152] = 6385,[72] = 6385,[48] = 6385,[38] = 6385,[54] = 6385,[7] = 6385,[68] = 6385,[146] = 6385,[224] = 6385,[235] = 6385,[235] = 6389,[87] = 6385,[234] = 6385,[234] = 6389,[105] = 6407,[84] = 6385,[147] = 6385,[92] = 6385,[111] = 6566,[136] = 6385,[127] = 6385,[75] = 6385,[52] = 6385,[4] = 6385,[8] = 6385,[167] = 6544,[118] = 6420,[79] = 6385,[113] = 6385,[2] = 6385,[151] = 6570,[99] = 6385,[161] = 6544,[138] = 6385,[162] = 6544,[155] = 6385,[261] = 6385,[284] = 6385,[168] = 6385,[233] = 6593,[70] = 6385,[270] = 6385,[271] = 6385,[207] = 6385,[203] = 6385,[201] = 6385,[202] = 6385,[211] = 6385,[209] = 6385,[197] = 6575,[171] = 8641,[191] = 6544,[149] = 6385,[160] = 6385,[290] = 6383,[272] = 6385,[43] = 6385,[154] = 6385,[186] = 6385,[134] = 6385,[40] = 6385,[188] = 6385,[41] = 6385,[185] = 6385,[42] = 6385,[39] = 6385,[187] = 6385,[135] = 6385,[257] = 6385,[114] = 6385,[101] = 6407,[81] = 6385,[116] = 6385,[36] = 6385,[289] = 6383,[288] = 6383,[86] = 6385,[204] = 6564,[285] = 6385,[262] = 6385,[141] = 6544,[96] = 6385,[170] = 6385,[200] = 6544,[164] = 6385,[140] = 6911,[129] = 6385,[145] = 6385,[210] = 6385,[34] = 6385,[89] = 6385,[196] = 6385,[212] = 6385,[251] = 6385,[14] = 6385,[62] = 6385,[78] = 6385,[242] = 7126,[139] = 6385,[205] = 6385,[55] = 6385,[192] = 6554,[67] = 6385,[104] = 6407,[82] = 6385,[267] = 6385,[250] = 6385,[226] = 6385,[190] = 6544,[108] = 6385,[173] = 6385,[174] = 6385,[213] = 6385,[180] = 6385,[102] = 6385,[85] = 6385,[184] = 6574,[245] = 6385,[245] = 6391,[24] = 6385,[65] = 6385,[66] = 6385,[3] = 6385,[183] = 6385,[266] = 6385,[198] = 6385,[119] = 6407,[97] = 6385,[237] = 6440,[237] = 6444,[249] = 6385,[249] = 6389,[157] = 6548,[13] = 6385,[25] = 6385,[280] = 6385,[280] = 6389,[269] = 6385,[31] = 6385,[150] = 6385,[131] = 6544,[265] = 6385,[61] = 6385,[53] = 6385,[64] = 6385,[12] = 6385,[252] = 6407,[231] = 11512,[231] = 6593,[231] = 6597,[106] = 6566,[88] = 6385,[77] = 6385,[11] = 6385,[46] = 6385,[47] = 6385,[193] = 6544,[194] = 6590,[274] = 6385,[275] = 6385,[143] = 6385,[109] = 6407,[90] = 6385,[1] = 6385,[27] = 6385,[236] = 6385,[236] = 6389,[246] = 6385,[232] = 6429,[240] = 10968,[240] = 10972,[18] = 6385,[16] = 6385,[20] = 6385,[22] = 6385,[222] = 6385,[9] = 6385,[206] = 6385,[126] = 6385,[208] = 6385,[148] = 6385,[247] = 6407,[247] = 6411,[276] = 6385,[277] = 6385,[258] = 6385,[259] = 6385,[166] = 6385,[291] = 6383,[292] = 6383,[293] = 6383,[0] = 0,[214] = 0,[30] = 6385,[29] = 6385,[110] = 6407,[110] = 6411,[91] = 6385,[122] = 6385,[130] = 6385,[93] = 6385,[243] = 6525,[28] = 6385,[163] = 6385,[223] = 6385,[120] = 6407,[98] = 6385,[32] = 6385,[176] = 6385,[248] = 6385,[248] = 6389,[221] = 6385,[228] = 6385,[220] = 6385,[227] = 6385,[268] = 6385,[283] = 6379,[76] = 6385,[59] = 6385,[58] = 6385,[230] = 6429,[230] = 6433,[80] = 12904,[80] = 6385,[107] = 6407,[19] = 6385,[17] = 6385,[21] = 6385,[23] = 6385,[179] = 6385,[117] = 6566,[57] = 6385,[26] = 6385,[37] = 6385,[159] = 6385,[60] = 6385,[153] = 6385,[181] = 6385,[71] = 6385,[195] = 6544,[175] = 6385,[35] = 6385,[121] = 6385,[178] = 6385,[10] = 6385,[165] = 6385,[156] = 6385,[169] = 6431,[5] = 6398,[158] = 6420,[244] = 6544,[244] = 6548,[103] = 6407,[128] = 6385,[177] = 6385,[83] = 6385,[51] = 6385,[182] = 6385,[144] = 6385,[256] = 6385,[256] = 6389,[125] = 6385,[100] = 6407,[115] = 6385,[95] = 6385,[225] = 6385,[239] = 6544,[238] = 6544,[94] = 6385,[241] = 6544,[241] = 6548,[273] = 6385,[112] = 6398,[137] = 6385,[260] = 6385,[124] = 6385,[263] = 6385,[264] = 6385,[142] = 6544,[123] = 6385,[172] = 6544,[73] = 6385,
}

local key_item_zone_ids = {
    [44] = 6387,[218] = 6387,[215] = 6387,[255] = 6387,[254] = 6387,[15] = 6387,[132] = 6387,[216] = 6387,[45] = 6387,[253] = 6387,[217] = 6387,[50] = 224,[33] = 6387,[152] = 6387,[72] = 6387,[48] = 6387,[38] = 6387,[54] = 6387,[7] = 6387,[68] = 6387,[146] = 6387,[224] = 6387,[87] = 6387,[105] = 6409,[84] = 6387,[147] = 6387,[92] = 6387,[111] = 6568,[136] = 6387,[127] = 6387,[75] = 6387,[52] = 6387,[4] = 6387,[8] = 6387,[167] = 6546,[118] = 6422,[79] = 6387,[113] = 6387,[2] = 6387,[151] = 6572,[99] = 6387,[161] = 6546,[138] = 6387,[162] = 6546,[155] = 6387,[261] = 6387,[284] = 6387,[168] = 6387,[70] = 6387,[270] = 6387,[271] = 6387,[207] = 6387,[203] = 6387,[201] = 6387,[202] = 6387,[211] = 6387,[209] = 6387,[197] = 6577,[191] = 6546,[149] = 6387,[160] = 6387,[290] = 6385,[272] = 6387,[43] = 6387,[154] = 6387,[186] = 6387,[134] = 6387,[40] = 6387,[188] = 6387,[41] = 6387,[185] = 6387,[42] = 6387,[39] = 6387,[187] = 6387,[135] = 6387,[257] = 6387,[114] = 6387,[101] = 6409,[81] = 6387,[116] = 6387,[36] = 6387,[289] = 6385,[288] = 6385,[86] = 6387,[204] = 6566,[285] = 6387,[262] = 6387,[141] = 6546,[96] = 6387,[170] = 6387,[200] = 6546,[164] = 6387,[140] = 6913,[129] = 6387,[145] = 6387,[210] = 6387,[34] = 6387,[89] = 6387,[196] = 6387,[212] = 6387,[251] = 6387,[14] = 6387,[62] = 6387,[78] = 6387,[139] = 6387,[205] = 6387,[55] = 6387,[192] = 6556,[67] = 6387,[104] = 6409,[82] = 6387,[267] = 6387,[250] = 6387,[226] = 6387,[190] = 6546,[108] = 6387,[173] = 6387,[174] = 6387,[213] = 6387,[180] = 6387,[102] = 6387,[85] = 6387,[184] = 6576,[245] = 6387,[24] = 6387,[65] = 6387,[66] = 6387,[3] = 6387,[183] = 6387,[266] = 6387,[198] = 6387,[119] = 6409,[97] = 6387,[249] = 6387,[157] = 6550,[13] = 6387,[25] = 6387,[280] = 6387,[269] = 6387,[31] = 6387,[150] = 6387,[131] = 6546,[265] = 6387,[61] = 6387,[53] = 6387,[64] = 6387,[12] = 6387,[252] = 6409,[106] = 6568,[88] = 6387,[77] = 6387,[11] = 6387,[46] = 6387,[47] = 6387,[193] = 6546,[194] = 6592,[274] = 6387,[275] = 6387,[143] = 6387,[109] = 6409,[90] = 6387,[1] = 6387,[27] = 6387,[246] = 6387,[18] = 6387,[16] = 6387,[20] = 6387,[22] = 6387,[222] = 6387,[9] = 6387,[206] = 6387,[126] = 6387,[208] = 6387,[148] = 6387,[247] = 6409,[276] = 6387,[277] = 6387,[258] = 6387,[259] = 6387,[166] = 6387,[291] = 6385,[292] = 6385,[293] = 6385,[0] = 0,[214] = 0,[30] = 6387,[29] = 6387,[110] = 6409,[91] = 6387,[122] = 6387,[130] = 6387,[93] = 6387,[243] = 6527,[28] = 6387,[163] = 6387,[223] = 6387,[120] = 6409,[98] = 6387,[32] = 6387,[176] = 6387,[248] = 6387,[221] = 6387,[228] = 6387,[220] = 6387,[227] = 6387,[268] = 6387,[283] = 6381,[76] = 6387,[59] = 6387,[58] = 6387,[80] = 6387,[107] = 6409,[19] = 6387,[17] = 6387,[21] = 6387,[23] = 6387,[179] = 6387,[117] = 6568,[57] = 6387,[26] = 6387,[37] = 6387,[159] = 6387,[60] = 6387,[153] = 6387,[181] = 6387,[71] = 6387,[195] = 6546,[175] = 6387,[35] = 6387,[121] = 6387,[178] = 6387,[10] = 6387,[165] = 6387,[156] = 6387,[169] = 6433,[5] = 6400,[158] = 6422,[244] = 6546,[103] = 6409,[128] = 6387,[177] = 6387,[83] = 6387,[51] = 6387,[182] = 6387,[144] = 6387,[256] = 6387,[125] = 6387,[100] = 6409,[115] = 6387,[95] = 6387,[225] = 6387,[94] = 6387,[273] = 6387,[112] = 6400,[137] = 6387,[260] = 6387,[124] = 6387,[263] = 6387,[264] = 6387,[142] = 6546,[123] = 6387,[172] = 6546,[73] = 6387,
}

local item_zone_ids = {
    [44] = 6384,[218] = 6384,[215] = 6384,[255] = 6384,[254] = 6384,[15] = 6384,[132] = 6384,[216] = 6384,[45] = 6384,[253] = 6384,[217] = 6384,[50] = 221,[33] = 6384,[152] = 6384,[72] = 6384,[48] = 6384,[38] = 6384,[54] = 6384,[7] = 6384,[68] = 6384,[146] = 6384,[224] = 6384,[87] = 6384,[105] = 6406,[84] = 6384,[147] = 6384,[92] = 6384,[111] = 6565,[136] = 6384,[127] = 6384,[75] = 6384,[52] = 6384,[4] = 6384,[8] = 6384,[167] = 6543,[118] = 6419,[79] = 6384,[113] = 6384,[2] = 6384,[151] = 6569,[99] = 6384,[161] = 6543,[138] = 6384,[162] = 6543,[155] = 6384,[261] = 6384,[284] = 6384,[168] = 6384,[70] = 6384,[270] = 6384,[271] = 6384,[207] = 6384,[203] = 6384,[201] = 6384,[202] = 6384,[211] = 6384,[209] = 6384,[197] = 6574,[171] = 7504,[191] = 6543,[149] = 6384,[160] = 6384,[290] = 6382,[272] = 6384,[43] = 6384,[154] = 6384,[186] = 6384,[134] = 6384,[40] = 6384,[188] = 6384,[41] = 6384,[185] = 6384,[42] = 6384,[39] = 6384,[187] = 6384,[135] = 6384,[257] = 6384,[114] = 6384,[101] = 6406,[81] = 6384,[116] = 6384,[36] = 6384,[289] = 6382,[288] = 6382,[86] = 6384,[204] = 6563,[285] = 6384,[262] = 6384,[141] = 6543,[96] = 6384,[170] = 6384,[200] = 6543,[164] = 6384,[140] = 6910,[129] = 6384,[145] = 6384,[210] = 6384,[34] = 6384,[89] = 6384,[196] = 6384,[212] = 6384,[251] = 6384,[14] = 6384,[62] = 6384,[78] = 6384,[139] = 6384,[205] = 6384,[55] = 6384,[192] = 6553,[67] = 6384,[104] = 6406,[82] = 6384,[267] = 6384,[250] = 6384,[226] = 6384,[190] = 6543,[108] = 6384,[173] = 6384,[174] = 6384,[213] = 6384,[180] = 6384,[102] = 6384,[85] = 6384,[184] = 6573,[245] = 6384,[24] = 6384,[65] = 6384,[66] = 6384,[3] = 6384,[183] = 6384,[266] = 6384,[198] = 6384,[119] = 6406,[97] = 6384,[249] = 6384,[157] = 6547,[13] = 6384,[25] = 6384,[280] = 6384,[269] = 6384,[31] = 6384,[150] = 6384,[131] = 6543,[265] = 6384,[61] = 6384,[53] = 6384,[64] = 6384,[12] = 6384,[252] = 6406,[106] = 6565,[88] = 6384,[77] = 6384,[11] = 6384,[46] = 6384,[47] = 6384,[193] = 6543,[194] = 6589,[274] = 6384,[275] = 6384,[143] = 6384,[109] = 6406,[90] = 6384,[1] = 6384,[27] = 6384,[246] = 6384,[18] = 6384,[16] = 6384,[20] = 6384,[22] = 6384,[222] = 6384,[9] = 6384,[206] = 6384,[126] = 6384,[208] = 6384,[148] = 6384,[247] = 6406,[276] = 6384,[277] = 6384,[258] = 6384,[259] = 6384,[166] = 6384,[291] = 6382,[292] = 6382,[293] = 6382,[0] = 0,[214] = 0,[30] = 6384,[29] = 6384,[110] = 6406,[91] = 6384,[122] = 6384,[130] = 6384,[93] = 6384,[243] = 6524,[28] = 6384,[163] = 6384,[223] = 6384,[120] = 6406,[98] = 6384,[32] = 6384,[176] = 6384,[248] = 6384,[221] = 6384,[228] = 6384,[220] = 6384,[227] = 6384,[268] = 6384,[283] = 6378,[76] = 6384,[59] = 6384,[58] = 6384,[80] = 6384,[107] = 6406,[19] = 6384,[17] = 6384,[21] = 6384,[23] = 6384,[179] = 6384,[117] = 6565,[57] = 6384,[26] = 6384,[37] = 6384,[159] = 6384,[60] = 6384,[153] = 6384,[181] = 6384,[71] = 6384,[195] = 6543,[175] = 6384,[35] = 6384,[121] = 6384,[178] = 6384,[10] = 6384,[165] = 6384,[156] = 6384,[169] = 6430,[5] = 6397,[158] = 6419,[244] = 6543,[103] = 6406,[128] = 6384,[177] = 6384,[83] = 6384,[51] = 6384,[182] = 6384,[144] = 6384,[256] = 6384,[125] = 6384,[100] = 6406,[115] = 6384,[95] = 6384,[225] = 6384,[94] = 6384,[273] = 6384,[112] = 6397,[137] = 6384,[260] = 6384,[124] = 6384,[263] = 6384,[264] = 6384,[142] = 6543,[123] = 6384,[172] = 6543,[73] = 6384,
}

local item_cannot_zone_ids = {
    [44] = 6379,[218] = 6379,[215] = 6383,[255] = 6379,[254] = 6379,[15] = 6379,[132] = 6379,[216] = 6379,[45] = 6379,[253] = 6379,[217] = 6379,[50] = 218,[50] = 220,[33] = 6379,[152] = 6379,[72] = 6379,[48] = 6379,[38] = 6379,[54] = 6379,[7] = 6379,[68] = 6379,[146] = 6379,[224] = 6379,[235] = 6379,[87] = 11209,[234] = 6379,[105] = 6401,[84] = 6379,[147] = 6379,[92] = 6379,[111] = 6562,[136] = 6379,[127] = 6379,[75] = 6379,[52] = 6379,[4] = 6379,[8] = 6379,[167] = 6538,[118] = 6414,[79] = 6379,[113] = 6379,[2] = 6379,[151] = 6564,[99] = 6379,[161] = 6538,[138] = 6379,[162] = 6538,[155] = 6379,[261] = 6379,[284] = 6379,[168] = 6379,[233] = 6587,[70] = 6379,[270] = 6379,[271] = 6379,[207] = 6379,[203] = 6379,[201] = 6379,[202] = 6379,[211] = 6379,[209] = 6379,[197] = 6569,[171] = 6903,[191] = 6538,[149] = 6379,[160] = 6379,[290] = 6379,[272] = 6379,[43] = 6379,[154] = 6379,[186] = 6379,[134] = 6379,[40] = 6379,[188] = 6379,[41] = 6379,[185] = 6379,[42] = 6379,[39] = 6379,[187] = 6379,[135] = 6379,[257] = 6379,[114] = 6379,[101] = 6401,[81] = 6379,[116] = 6379,[36] = 6379,[289] = 6379,[288] = 6379,[86] = 6379,[204] = 6558,[285] = 6379,[262] = 6379,[141] = 6538,[96] = 6379,[170] = 6379,[200] = 6538,[164] = 6379,[140] = 6905,[129] = 6379,[145] = 6379,[210] = 6379,[34] = 6379,[89] = 6379,[196] = 6379,[212] = 6379,[251] = 6379,[14] = 6379,[62] = 6379,[78] = 6379,[242] = 7120,[139] = 6379,[205] = 6379,[55] = 6379,[192] = 6548,[67] = 6379,[104] = 6401,[82] = 6379,[267] = 6379,[250] = 6379,[226] = 6379,[190] = 6538,[108] = 6379,[173] = 6379,[174] = 6379,[213] = 6379,[180] = 6379,[102] = 6379,[85] = 6379,[184] = 6568,[245] = 6379,[24] = 6379,[65] = 6379,[66] = 6379,[3] = 6379,[183] = 6379,[266] = 6379,[198] = 6379,[119] = 6401,[97] = 6379,[237] = 6434,[249] = 6379,[157] = 6542,[13] = 6379,[25] = 6379,[280] = 6379,[280] = 6379,[269] = 6379,[31] = 6379,[150] = 6379,[131] = 6538,[265] = 6379,[61] = 6379,[53] = 6378,[53] = 6379,[64] = 6379,[12] = 6379,[252] = 6401,[231] = 6587,[106] = 6559,[106] = 6560,[88] = 6379,[77] = 6379,[11] = 6379,[46] = 6379,[47] = 6379,[193] = 6538,[194] = 6584,[274] = 6379,[275] = 6379,[143] = 6379,[109] = 6401,[90] = 6379,[1] = 6379,[27] = 6379,[236] = 6379,[246] = 6379,[232] = 6422,[232] = 6423,[232] = 6425,[240] = 10962,[18] = 6379,[16] = 6379,[20] = 6379,[22] = 6379,[222] = 6379,[9] = 6379,[206] = 6379,[126] = 6379,[208] = 6379,[148] = 6379,[247] = 6401,[276] = 6379,[277] = 6379,[258] = 6379,[259] = 6379,[166] = 6379,[291] = 6379,[292] = 6379,[293] = 6379,[0] = 0,[214] = 0,[30] = 6379,[29] = 6379,[110] = 6401,[91] = 6379,[122] = 6379,[130] = 6379,[93] = 6379,[243] = 6519,[28] = 6379,[163] = 6379,[223] = 6379,[120] = 6401,[98] = 6379,[32] = 6379,[176] = 6379,[248] = 6379,[221] = 6379,[228] = 6379,[220] = 6379,[227] = 6379,[268] = 6379,[283] = 6375,[76] = 6379,[59] = 6379,[58] = 6379,[230] = 6423,[80] = 6379,[107] = 6401,[19] = 6379,[17] = 6379,[21] = 6379,[23] = 6379,[179] = 6379,[117] = 6560,[57] = 6379,[26] = 6379,[37] = 6379,[159] = 6379,[60] = 6379,[153] = 6379,[181] = 6379,[71] = 6379,[195] = 6538,[175] = 6379,[35] = 6379,[121] = 6379,[178] = 6379,[10] = 6379,[165] = 6379,[156] = 6379,[169] = 6425,[5] = 6392,[158] = 6414,[244] = 6538,[103] = 6401,[128] = 6379,[177] = 6379,[83] = 6379,[51] = 6379,[182] = 6379,[144] = 6379,[256] = 6379,[125] = 6379,[100] = 6401,[115] = 6379,[95] = 6379,[225] = 6379,[239] = 6538,[238] = 6538,[94] = 6379,[241] = 6538,[273] = 6379,[112] = 6392,[137] = 6379,[260] = 6379,[124] = 6379,[263] = 6379,[264] = 6379,[142] = 6538,[123] = 6379,[172] = 6538,[73] = 6379,
}


function addRune(player, rune)
    local runLevel = 0;
    local minRunes = 0;
    if(player:getMainJob() == JOBS.RUN or player:getMainJob() == JOBS.GEO) then
        runLevel = player:getMainLvl();
    else
        runLevel = player:getSubLvl();
    end
    if (runLevel < 35) then
        minRunes = 1;
    elseif (runLevel < 65) then
        minRunes = 2;
    else
        minRunes = 3;
    end
        
    if (player:getActiveRunes() >= minRunes) then
        player:removeOldestRune();
    end
    local power = math.floor(5 + runLevel * 0.3);
    player:addStatusEffect(rune,power,3,300);
end;

local runeTypes = {
    [EFFECT_IGNIS] = 1,
    [EFFECT_GELUS] = 2,
    [EFFECT_FLABRA] = 3,
    [EFFECT_TELLUS] = 4,
    [EFFECT_SULPOR] = 5,
    [EFFECT_UNDA] = 6,
    [EFFECT_LUX] = 7,
    [EFFECT_TENEBRAE] = 8,
};

function getRuneSpecEffect(player, target, ability, action, mult)
    if (mult == nil) then mult = 1; end
    local highest = 0;
    local position = 0;
    local runes = {
        player:getEffectsCount(EFFECT_IGNIS),
        player:getEffectsCount(EFFECT_GELUS),
        player:getEffectsCount(EFFECT_FLABRA),
        player:getEffectsCount(EFFECT_TELLUS),
        player:getEffectsCount(EFFECT_SULPOR),
        player:getEffectsCount(EFFECT_UNDA),
        player:getEffectsCount(EFFECT_LUX),
        player:getEffectsCount(EFFECT_TENEBRAE)
    };

    for i,v in pairs(runes) do
        if v > highest then
            highest = v;
            position = i;
        end
    end

    if (highest == 1) then
        position = runeTypes[player:getNewestRune()];
    end

    action:speceffect(target:getID(), position * mult);
end

function setRuneWeaponOffset(player, target, ability, action)
    local skill = player:getWeaponSkillType(SLOT_MAIN);
    local offset = 0;
    if      (skill ==  SKILL_H2H) then offset = 1;
    elseif  (skill ==  SKILL_AXE) then offset = 2;
    elseif  (skill ==  SKILL_CLB) then offset = 3;
    elseif  (skill ==  SKILL_SYH) then offset = 4;
    elseif  (skill ==  SKILL_GKT) then offset = 5;
    elseif  (skill ==  SKILL_STF or skill == SKILL_POL) then offset = 6;
    elseif  (skill ==  SKILL_DAG or skill == SKILL_KAT) then offset = 7;
    elseif  (skill ==  SKILL_GSD) then offset = 8;
    elseif  (skill ==  SKILL_GAX) then offset = 9;
    end

    local id = action:animation(target:getID());
    action:animation(target:getID(), id + offset);
end



function vallationDefense(count)
    if (count == 1) then
        return 50;
    elseif (count == 2) then
        return 65;
    elseif (count == 3) then
        return 80;
    else
        return 0;
    end
end;

function pflugRes(count)
    if (count == 1) then
        return 60;
    elseif (count == 2) then
        return 80;
    elseif (count == 3) then
        return 100;
    else
        return 0;
    end
end;

function createRuneMask(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    local mask = 0;
    local subMask = 0;
    
    mask = mask + ignis;
    mask = mask + gelus * 4;
    mask = mask + flabra * 16;
    mask = mask + tellus * 64;
    mask = mask + sulpor * 256;
    mask = mask + unda * 1024;
    mask = mask + lux * 4096;
    mask = mask + tenebrae * 16384;
    return mask;
end;

function applyValianceMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIREDEF, vallationDefense(unda));
    effect:addMod(MOD_ICEDEF, vallationDefense(ignis));
    effect:addMod(MOD_WATERDEF, vallationDefense(sulpor));
    effect:addMod(MOD_EARTHDEF, vallationDefense(flabra));
    effect:addMod(MOD_THUNDERDEF, vallationDefense(tellus));
    effect:addMod(MOD_WINDDEF, vallationDefense(gelus));
    effect:addMod(MOD_LIGHTDEF, vallationDefense(tenebrae));
    effect:addMod(MOD_DARKDEF, vallationDefense(lux));
end;

function applyPflugMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIRERES, pflugRes(unda) / 5);
    effect:addMod(MOD_VIRUSRES, pflugRes(unda) / 3);
    effect:addMod(MOD_AMNESIARES, pflugRes(unda) / 3);

    effect:addMod(MOD_ICERES, pflugRes(ignis) / 5);
    effect:addMod(MOD_PARALYZERES, pflugRes(ignis) / 3);
    effect:addMod(MOD_BINDRES, pflugRes(ignis) / 3);

    effect:addMod(MOD_WATERRES, pflugRes(sulpor) / 5);
    effect:addMod(MOD_POISONRES, pflugRes(sulpor) / 3);
    effect:addMod(MOD_CHARMRES, pflugRes(sulpor) / 3);

    effect:addMod(MOD_EARTHRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_SLOWRES, pflugRes(flabra) / 3);
    effect:addMod(MOD_PETRIFYRES, pflugRes(flabra) / 3);

    effect:addMod(MOD_THUNDERRES, pflugRes(tellus) / 5);
    effect:addMod(MOD_STUNRES, pflugRes(tellus) / 3);

    effect:addMod(MOD_WINDRES, pflugRes(gelus) / 5);
    effect:addMod(MOD_SILENCERES, pflugRes(gelus) / 3);
    effect:addMod(MOD_GRAVITYRES, pflugRes(gelus) / 3);

    effect:addMod(MOD_LIGHTRES, pflugRes(tenebrae) / 5);
    effect:addMod(MOD_CHARMRES, pflugRes(tenebrae) / 3);

    effect:addMod(MOD_DARKRES, pflugRes(lux) / 5);
    effect:addMod(MOD_SLEEPRES, pflugRes(lux) / 3);
    effect:addMod(MOD_BLINDRES, pflugRes(lux) / 3);
    effect:addMod(MOD_CURSERES, pflugRes(lux) / 3);
    effect:addMod(MOD_DEATHRES, pflugRes(lux) / 3);
end;

function startConfrontation(player, power, duration, mobs, hardmode)
    local mob = nil;
    player:applyConfrontationToParty(power, duration);
    for k,v in pairs(mobs) do
        mob = SpawnMob(v);
        mob:updateClaim(player);
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        mob:addStatusEffect(EFFECT_CONFRONTATION, power, 0, duration);
        mob:setSpawner(player);
        mob:addMod(MOD_ATTP, -15);
        mob:addMod(MOD_ACC, 10);
        mob:addMod(MOD_DEFP, 15);
        mob:addMod(MOD_EVA, 20);
        mob:addMod(MOD_MEVA, 20);
        mob:addMod(MOD_UDMGPHYS, -25);
        mob:addMod(MOD_UDMGMAGIC, -25);
        mob:addMod(MOD_UDMGRANGE, -25);
        mob:addMobMod(MOBMOD_HP_SCALE, 100);
        if (hardmode == false) then
            mob:setMobMod(MOBMOD_HARD_MODE, 1);
        else
            mob:addMod(MOD_DEFP, 10);
            mob:addMod(MOD_ATTP, 10);
            mob:addMod(MOD_EVA, 20);
            mob:addMod(MOD_ACC, 20);
            mob:addMod(MOD_MEVA, 20);
            mob:addMod(MOD_MATT, 15);
            mob:addMod(MOD_MACC, 20);
            mob:addMod(MOD_STORETP, 35);
            mob:addMod(MOD_MDEF, 10);
            mob:addMod(MOD_HASTE_MAGIC, 100);
            mob:setMobMod(MOBMOD_HARD_MODE, 2);
        end

        local partySize = player:getPartySize(0);
        if (partySize > 1) then
            mob:addMobMod(MOBMOD_HP_SCALE, 35 * (partySize - 1));
--            mob:addMod(MOD, (15 * (partySize - 1)));
--            mob:addMod(MOD_UDMGPHYS, (-6 * (partySize - 1)));
--            mob:addMod(MOD_UDMGRANGE, (-6 * (partySize - 1)));
--            mob:addMod(MOD_UDMGMAGIC, (-6 * (partySize - 1)));
        end
        mob:addHP(99999);



        --DespawnMob(mob, 25);
    end
end;

function applyBarDurationReduction(target, effect, barType)
    if (target:hasStatusEffect(barType)) then
        local duration = effect:getDuration();
        duration = math.floor(duration * 3 / 2);
        if (duration == 0) then
            duration = 1;
        end
        effect:setDuration(duration);
    end
end;


local function sayItem(player, curItemId, isTemp)
    local item = getItem(curItemId);
    if (item == nil or item == 0) then
        print("[ERROR]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        player:SayToPlayer("ERRORRRRR!!!!!!");
        return false;
    end

    local name = item:getName();
    name = string.gsub(" "..name, "%W%l", string.upper):sub(2):gsub("_", " ");
    if (isTemp ~= nil) then
        player:SayToPlayer("Received Temporary: " .. name);
    else
        player:SayToPlayer("Received: " .. name);
    end

end


function jsrReward(player, rewards)
    local zoneID = player:getZoneID();


    if (rewards["xp"] ~= nil) then
        player:addLimitPoints(rewards["xp"]);
        player:addExp(rewards["xp"]);
    end

    if (rewards["gil"] ~= nil) then
        player:addGil(rewards["gil"]);
--        player:SayToPlayer("Received " .. tostring(rewards["gil"]) .. " gil.");
--        player:messageSpecial(gil_zone_ids[zoneID],rewards["gil"]);
        player:messageSpecial(GIL_OBTAINED,rewards["gil"]);
    end

    if (rewards["cp"] ~= nil) then
        player:addCP(rewards["cp"]);
        player:SayToPlayer("Received " .. tostring(rewards["cp"]) .. " cp.");
    end

    if (rewards["beast"] ~= nil) then
        player:addItem(1126, rewards["beast"]);
        if (rewards["beast"] == 1) then
            player:messageSpecial(ITEM_OBTAINED,1126, rewards["beast"]);
        else
            player:SayToPlayer("Received " .. tostring(rewards["beast"]) .. " beastman seals.");
        end
    end

    if (rewards["kindred"] ~= nil) then
        player:addItem(1127, rewards["kindred"]);
        if (rewards["kindred"] == 1) then
            player:messageSpecial(ITEM_OBTAINED,1127, rewards["kindred"]);
        else
            player:SayToPlayer("Received " .. tostring(rewards["kindred"]) .. " kindred's seals.");
        end
    end

    if (rewards["crest"] ~= nil) then
        player:addItem(2955, rewards["crest"]);
        if (rewards["crest"] == 1) then
            player:messageSpecial(ITEM_OBTAINED,2955, rewards["crest"]);
        else
            player:SayToPlayer("Received " .. tostring(rewards["crest"]) .. " kindred's crests.");
        end
    end

    if (rewards["item"] ~= nil) then
        player:addItem(rewards["item"]);
        sayItem(player, rewards["item"]);
    end

    if (rewards["item2"] ~= nil) then
        sayItem(player, rewards["item2"]);
--        player:messageSpecial(item_zone_ids[zoneID],rewards["item2"]);
--        player:messageSpecial(ITEM_OBTAINED,rewards["item2"]);
    end

    if (rewards["augment"] ~= nil) then
        local arr = rewards["augment"];
        sayItem(player, arr[1]);
        player:addItem(arr[1], 1, arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9]);
--        player:messageSpecial(item_zone_ids[zoneID],arr[1]);
--        player:messageSpecial(ITEM_OBTAINED,arr[1]);
    end

    if (rewards["guild"] ~= nil) then
        local arr = rewards["guild"]
        player:addCurrency("guild_" .. arr[1], arr[2]);
        player:SayToPlayer("Received " .. tostring(arr[2]) .. " " .. arr[1] .. " points.");
    end

    if (rewards["scyld"] ~= nil) then
        player:addCurrency("scyld", rewards["scyld"]);
        player:SayToPlayer("Received " .. tostring(rewards["scyld"]) .. " scylds.");
    end

    if (rewards["jetton"] ~= nil) then
        player:addCurrency("jetton", rewards["jetton"]);
        player:SayToPlayer("Received " .. tostring(rewards["jetton"]) .. " jettons.");
    end

    if (rewards["spark"] ~= nil) then
        player:addCurrency("spark_of_eminence", rewards["spark"]);
        player:SayToPlayer("Received " .. tostring(rewards["spark"]) .. " sparks of eminence.");
    end

end


function onEliteDeath(mob, player, tier)
    if (mob == nil or mob:getLocalVar("TimedOut") == 1) then
        return;
    end

    if (mob:getSpawner() ~= nil) then
        local player = mob:getSpawner();
        if (player ~= nil) then
            player:removeConfrontationFromParty();
        end
        player:setVar("killedFoVNM", mob:getZoneID());

        local party = player:getParty();

        local scyld = 10 + tier * 5;
        local xpReward = 200 + 100 * tier + mob:getLocalVar("bonusEliteXP");
        if (mob:getMobMod(MOBMOD_HARD_MODE) == 2) then
            xpReward = xpReward + tier * 50 + 50;
            scyld = scyld + 10;
        end;

        if (party ~= nil) then
            for i,member in ipairs(party) do
                member:addLimitPoints(xpReward);
                member:addExp(xpReward);
            end
        else
            player:addLimitPoints(xpReward);
            player:addExp(xpReward);
        end
        mob:setSpawner(nil);

        jsrReward(player, {["scyld"] = scyld});
    end
end



function tradeElite(player, npc, trade, tier, monsters)
    local curTime = player:getVar(string.format("elite_%d", player:getZoneID()));
--    if (curTime > os.time()) then
--        player:SayToPlayer("You must wait until after midnight to attempt this elite regime again.");
--        return
--    end


    local count = trade:getItemCount();
--    local beastSeals = trade:hasItemQty(1126, tier);
    local gil = trade:getGil();
    local thirdSlot = trade:getItem(1);
    local leftover = tier - math.floor(tier);
    tier = math.floor(tier);
    if (leftover > 0) then leftover = 5; end
    npc:setLocalVar("gilReward", tier * 1000);

    -- normal mode
    if (count == 1 and gil == tier * 500) then
        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", 0);
        player:tradeComplete();
        player:setVar(string.format("elite_%d", player:getZoneID()), getMidnight());
        startConfrontation(player, tier * 10 + leftover - 5, 1200, monsters, false);
    -- hard mode
    elseif (count == 2 and gil == tier * 500 and thirdSlot ~= 0) then

        local augmented = (trade:isAugmented(1));
        local item = getItem(thirdSlot);
        local iLevel = item:getLevel();
        if (augmented) then
            player:SayToPlayer("Cannot trade augmented item.");
            return;
        end

        if (iLevel > tier * 10) then
            player:SayToPlayer(string.format("Item must be level %d or lower.", math.floor(tier * 10)));
            return;
        end

        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", thirdSlot);
        player:tradeComplete();
        startConfrontation(player, tier * tie + leftover - 5, 1200, monsters, true);
    end

end




function rewardElite(player, npc, items)
    local tradedItem = npc:getLocalVar("traded");
    local killed = player:getVar("killedFoVNM");
    local trader = npc:getLocalVar("trader");
    if (killed == npc:getZoneID() and trader == player:getID()) then
        player:setVar("killedFoVNM", 0);
        npc:setLocalVar("trader", 0);
        npc:setLocalVar("traded", 0);

        -- reward basic item
        local size = 0;
        for i,v in pairs(items) do
            size = size + 1;
        end
        local id = items[math.random(1, size)];
        local item = getItem(id);
        local augments = pickAugments(item);
        local reward = {
            ["augment"] = {id, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]},
            ["gil"] = npc:getLocalVar("gilReward");
        };
        jsrReward(player, reward);


        -- reward second item if player traded one
        if (tradedItem ~= 0) then
            item = getItem(tradedItem);
            augments = pickAugments(item);
            reward = {["augment"] = {tradedItem, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]}};
            jsrReward(player, reward);
        end

    end

end


function afterTime(player, varName)
    return player:getVar(varName) < os.time();
end

function setMidnight(player, varName)
    return player:setVar(varName, getMidnight());
end

function setTally(player, varName)
    return player:setVar(varName, getConquestTally());
end

function setSpecialMobStats(mob, hpbonus)
    local hpbonus = mob:getMainLvl() * 90;
    mob:addMod(MOD_HP, hpbonus);
    mob:updateHealth();
    mob:addHP(hpbonus);
    local hard = mob:setMobMod(MOBMOD_HARD_MODE, 1);
    mob:setMobMod(MOBMOD_NO_DROPS, 1);
    mob:setMobMod(MOBMOD_NO_XP, 1);

    mob:addMod(MOD_ATTP, 15);
    mob:addMod(MOD_ACC, 20);
    mob:addMod(MOD_MACC, 20);
    mob:addMod(MOD_MATT, -15);
    mob:addMod(MOD_STORETP, -25);
--    mob:addMod(MOD_UDMGPHYS, -10);
--    mob:addMod(MOD_UDMGMAGIC, -10);
    mob:addMod(MOD_MEVA, 25);
    mob:addMod(MOD_EVA, 25);
end


function rewardTemporaryItem(player)
    local level = player:getMainLvl();
    local hasMP = player:getMaxMP() > 25;
    local boostItems = { -- Count: 18
        5440, -- Dusty Wing
        5392, -- Champion's Drink
        5389, -- Spy's Drink
        5386, -- Fighter's Drink
        5385, -- Barbarian's Drink
        5849, -- Berserker's Drink
        5241, -- Giant's Drink
        5395, -- Cleric's Drink
        4199, -- Stat Potion
        4201, -- Stat Potion
        4203, -- Stat Potion
        4207, -- Stat Potion
        4209, -- Stat Potion
        4211, -- Stat Potion
        5770, -- Super Reraiser
        5322, -- Healing Powder
        5832, -- Healing Mist
        5833, -- Mana Mist
        5990, -- Instant Stoneskin
        4255, -- Mana Powder
        5834, -- Lucid Wings
        6475, -- Lucid Wings II
        5824, -- Lucid Potion
        5825, -- Lucid Potion II
        5387, -- Oracle's Drink
        5826, -- Lucid Potion III
        5827, -- Lucid Ether
        5445, -- Lucid Ether
        5828, -- Lucid Ether II
--        5945, -- Prize Powder
        5829, -- Lucid Ether III
        4146, -- Revitalizer
        5445, -- Prismatic Elixir
        4202, -- Daedalus Wing
        5390, -- Braver's Drink
        5440, -- Dusty Wing
        5393, -- Monarch's Drink
        5437, -- Strange Milk
        5438, -- Strange Juice
        4174, -- Vile Elixir
        4175, -- Vile Elixir +1
        4254, -- Megalixir
        5514, -- Lake of Light Tincture
        5507, -- Luminous Isle Tincture
        5510, -- Immaculate Sands Tincture
        5518, -- Sanctum of Life Tincture
        5519, -- Soil's Prominence Tincture
        5520, -- Snowdrift Arbor Tincture
        4155 -- Remedy
    };

    local boostSize = 0;
    for i,v in pairs(boostItems) do
        boostSize = boostSize + 1;
    end



    local item = boostItems[math.random(1,boostSize)];

    player:addTempItem(item);
--    player:messageSpecial(item_zone_ids[player:getZoneID()], item);
    sayItem(player, item, true);

end




 itemReward10 = {
    16449, -- Brass Dagger
    17153, -- Self Bow
    19224, -- Musketoon
    17223, -- Legionarre's Crossbow
    17290, -- Coarse Boomerang
    17028, -- Freesword's Club
    17130, -- Freesword's Staff
    16641, -- Brass Axe
    16966, -- Tachi
    16449, -- Brass Dagger
    16391, -- Brass Knuckles
    16583, -- Claymore
    16833, -- Bronze Spear
    16900, -- Wakazashi
    16769, -- Brass Zaghnal
    17347, -- Piccolo
    12497, -- Brass Hairpin
    13331, -- Sardonyx Earring
    13335, -- Amber Earring
    13282, -- Saintly Ring
    13284, -- Eremite's Ring
    13465, -- Brass Ring
    12560, -- Scale Mail
    13101, -- Green Scarf
    14803, -- Optical Earring
    14670, -- Safeguard Ring
    13380, -- Hope Earring
    13398, -- Physical Earring
    12944, -- Scale Greaves
    12456, -- Hachimaki
    12584, -- Kenpogi
    12608, -- Tunic
    12712, -- Tekko
    12736, -- Mitts
    13583, -- Cape
    13192, -- Leather Belt
    13081, -- Leather Gorget
    12864, -- Slacks
    12840, -- Sitabaki
    12824, -- Leather Trousers
    12290, -- Maple Shield
    12952, -- Leather Highboots
    12696, -- Leather Gloves
    12440, -- Leather Bandana
    12968, -- Kyahan
    12992, -- Solea
    13204, -- Heko Obi
    16185, -- Pelte
    12299, -- Aspis
};

 itemReward15 = {
    16407, -- Brass Baghnakhs
    16386, -- Lizard Cesti
    16834, -- Brass Spear
    16450, -- Dagger
    18599, -- Pestle
    16552, -- Scimitar
    16412, -- Bilbo
    16642, -- Bone Axe
    17280, -- Boomerang
    17354, -- Harp
    16531, -- Brass Xiphos
    17780, -- Kyofu
    16960, -- Uchigatana
    17081, -- Brass Rod
    17217, -- Crossbow
    17183, -- Hunter's Longbow
    17043, -- Brass Hammer
    16572, -- Bee Spatha
    16667, -- Light Axe
    17089, -- Holly Staff
    17412, -- Wild Cudgel
    19305, -- Pike
    12449, -- Brass Cap
    12506, -- Shell Hairpin
    15503, -- Van Pendant
    13327, -- Silver Earring
    13469, -- Leather Ring
    13456, -- Silver Ring
    13211, -- Friar's Rope
    13194, -- Warrior's Belt
    15559, -- Vision Ring
    14654, -- Poisona Ring
    12464, -- Headgear
    12577, -- Brass Harness
    12291, -- Elm Shield
    12592, -- Doublet
    12705, -- Brass Mittens
    12720, -- Gloves
    12798, -- Zealot's Mitts
    12848, -- Brais
    12961, -- Brass Leggings
    12976, -- Gaiters
    12601, -- Linen Robe
    12729, -- Linen Cuffs
    12857, -- Linen Slops
    12985, -- Holly Clogs
    13227, -- Plate Belt
    13071, -- Scalle Gorget
    13313, -- Shell Earring
    13442, -- Shell Ring
};

 itemReward25 = {
    16451, -- Mythril Dagger
    16513, -- Tuck
    16406, -- Baghnakhs
    16754, -- Parrying Knife
    17230, -- Power Crossbow
    17424, -- Spiked Club
    17942, -- Tomahawk
    16835, -- Spear
    16935, -- Barbarian's Sword
    17154, -- Wrapped Bow
    17281, -- Wingedge
    17650, -- Nadrs
    17776, -- Hibari
    19119, -- Ranging Knife
    16987, -- Okanehira
    17090, -- Elm Staff
    12414, -- Turtle Shield
    12424, -- Iron Mask
    12552, -- Chainmail
    12680, -- Chain Mittens
    12808, -- Chain Hose
    12936, -- Greaves
    13059, -- Fine Choker
    13082, -- Chain Gorget
    13083, -- Chain Choker
    13209, -- Chain Belt
    13614, -- Bronze Cape
    13328, -- Mythril Earring
    13446, -- Mythril Ring
    12455, -- Beetle Mask
    12583, -- Beetle Harness
    12711, -- Beetle Mittens
    12835, -- Beetle Subligar
    12967, -- Beetle Leggings
    13061, -- Spike Necklace
    13062, -- Green Gorget
    13090, -- Beetle Gorget
    13323, -- Beetle Earring
    13457, -- Beetle Ring
    12465, -- Cotton Headgear
    12721, -- Cotton Glovs
    12593, -- Cotton Doublet
    12849, -- Cotton Brais
    12977, -- Cotton Gaiters
    13085, -- Hemp Gorget
};

 itemReward35 = {
    16467, -- Mythril Knife
    16475, -- Mythril Kukri
    16576, -- Hunting Sword
    16706, -- Heavy Axe
    16812, -- War Sword
    16845, -- Lance
    16973, -- Homura
    17061, -- Mythril Rod
    17193, -- Shadow Bow
    17256, -- Serpentine Gun
    17828, -- Koen
    15173, -- Kosshin
    18375, -- Falx
    16399, -- Katars
    16410, -- Poison Baghnakhs
    17292, -- Long Boomerang
    17580, -- Military Pole
    17839, -- Military Harp
    16650, -- War Pick
    16901, -- Kodachi
    17052, -- Chestnut Wand
    17348, -- Traversiere
    17533, -- Whale Staff
    17782, -- Reppu
    17045, -- Maul
    18214, -- Voulge
    12300, -- Targe
    16406, -- Baghnakhs
    13750, -- Linen Doublet
    12450, -- Padded Cap
    12578, -- Padded Armor
    12706, -- Iron Mittens
    12936, -- Iron Subligar
    12962, -- Leggings
    13118, -- Shield Pendant
    13322, -- Wing Earring
    13459, -- Horn Ring
    13796, -- Bishop's Robe
    13730, -- Frost Robe
    12610, -- Coak
    12738, -- Linen Mitts
    12866, -- Linen Slacks
    12994, -- Shoes
    13206, -- Gold Obi
    13196, -- Silver Belt
    15940, -- Gosha Sarashi
    15291, -- Hojutsu Belt
    15838, -- Protect Ring
    13577, -- Black Cape
    13585, -- White Cape
}

 itemReward45 = {
    16412, -- Mythril Claws
    16590, -- Greatsword
    17523, -- Quarterstaff
    18506, -- Tewhatewha
    18591, -- Pastoral Staff
    19231, -- Tracker's Bow
    17701, -- Shotel
    16837, -- Trident
    16523, -- Holy Degen
    16558, -- Falchion
    18207, -- Kheten
    17231, -- Tell's Crossbow
    17356, -- Lamia Harp
    16967, -- Mikazuki
    16722, -- Heavy Moth Axe
    16902, -- Sakurafubuki
    17062, -- Bone Rod
    18427, -- Hanafubuki
    18607, -- Ceres's Spica
    18611, -- Qi Staff
    17041, -- Holy Mace
    16657, -- Tabar
    16675, -- Storm Axe
    17968, -- Veldt Axe
    18210, -- Raifu
    17267, -- Negoroshiki
    16796, -- Mythril Zaghnal
    16905, -- Bokuto
    17188, -- Sniping Bow
    13752, -- Wool Doublet
    12307, -- Heater Shield
    12301, -- Buckler
    12356, -- Viking Shield
    12727, -- Engineer's Gloves
    13063, -- Blue Gorget
    13315, -- Gold Earring
    13324, -- Tortoise Earring
    13461, -- Carapace Ring
    13596, -- Green Cape
    13198, -- Swordbelt
    13586, -- Red Cape
    12459, -- Zunari Kabuto
    12843, -- Haidate
    13703, -- Brigandine
    13711, -- Carapace Mask
    13712, -- Carapace Harness
    13713, -- Carapace Mittens
    13715, -- Carapace Leggings
    13723, -- Pyro Robe
    14866, -- Concealing Cuffs
    15434, -- Vanguard Belt
    13882, -- Corsair's Hat
    15443, -- Powerful Rope
    14286, -- Frog Trousers
    15801, -- Tigereye Ring
    13979, -- Silver Bangles
    14164, -- Inferno Sabots
    15432, -- Quick Belt
    13230, -- Adept's Rope
    13120, -- Clay Amulet
    15433, -- Reverand Sash
};
 itemReward55 = {
    16538, -- Darksteel Sword
    16528, -- Bloody Rapier
    17240, -- Lightning Bow
    17660, -- Kilij
    18362, -- Sainti
    18226, -- Darksteel Voulge
    16580, -- Bloodsword
    16888, -- Battle Fork
    16974, -- Dotanuki
    16899, -- Hototogisu
    16389, -- Coeurl Cesti
    19103, -- Darksteel Jambiya
    16985, -- Jindachi
    17778, -- Muketsu
    17236, -- Leo Crossbow
    17416, -- Arcana Breaker
    16513, -- Darksteel Claws
    16794, -- Bone Scythe
    16468, -- Darksteel Knife
    16559, -- Darksteel Falchion
    16858, -- Sacred Lance
    16883, -- Monsoon Spear
    17186, -- Sagittarius Bow
    16871, -- Kamayari
    16913, -- Shinogi
    17529, -- Sunlight Pole
    17802, -- Kiku-ichomonji
    16767, -- Triple Dagger
    11532, -- Accura Cape
    13325, -- Fang Earring
    13458, -- Scorpion Ring
    13103, -- Checkered Scarf
    11537, -- Kinesis Mantle
    12348, -- Serket Shield
    12344, -- Master Shield
    12311, -- Hoplon
    13800, -- Master's Gi
    14746, -- Verming Earring
    14751, -- Plantoid Earring
    13273, -- Twinthread Obi
    13798, -- Gaia Doublet
    13983, -- Gold Bangles
    13637, -- Gaia Mantle
    12476, -- Silk Hat
    12604, -- Silk Coat
    12732, -- Silk Cuffs
    12860, -- Silk Slops
    14254, -- Master's Sitabaki
    12988, -- Pigaches
    12323, -- Scutum
    13134, -- Ashura Necklace
    13579, -- Jester's Cape
    13417, -- Eris's Earring
    13248, -- Flagellant's Rope
    15463, -- Safety Mantle
    15431, -- Astral Rope
};

 itemReward65 = {
    17100, -- Ebony Pole
    16521, -- Rapier
    18769, -- Severus Claws
    16730, -- Colossal Axe
    16658, -- Darksteel Tabar
    16789, -- Darksteel Scythe
    16842, -- Golden Spear
    16959, -- Onikiri
    17046, -- Darksteel Maul
    17433, -- Mythic Wand
    16421, -- Gold Patas
    16541, -- Jadgplaute
    17724, -- Darksteel Kilij
    16846, -- Bloody Lance
    17242, -- Velocity Bow
    17222, -- Hexagun
    16560, -- Cutlass
    16652, -- Darksteel Pick
    18086, -- Heavy Lance
    17601, -- Demon's Knife
    16569, -- Gold Sword
    16477, -- Cermet Kukri
    16964, -- Zanbato
    17063, -- Darksteel Rod
    16401, -- Jamadhars
    16525, -- Hornet Fleuret
    16903, -- Kabutowari
    17249, -- Magoichi's Gun
    12295, -- Round Shield
    12740, -- Silk Mitts
    12852, -- Battle Hose
    12996, -- Silk Pumps
    13092, -- Coeurl Gorget
    13645, -- Amemet Mantle
    13589, -- Tiger Mantle
    15200, -- Orc Helm
    15203, -- Goblin Coif
    15653, -- Tabin Hose
    12303, -- Gold Buckler
    12324, -- Tower Shield
    12419, -- Darksteel Armet
    12446, -- Tiger Helm
    12468, -- Green Beret
    12563, -- Coral Scale Mail
    14941, -- Marid Mittens
    14993, -- Tabin Bracers
    16111, -- Tabin Beret
    16121, -- Mamool Ja Helm
    16122, -- Troll Coif
    16123, -- Lamia Garland
    16124, -- Qiqirn Hood
    16130, -- Wivre Mask
    16213, -- Lamia Mantle
    15055, -- Finesse Gloves
    12674, -- Tiger Jerkin
    12580, -- Darksteel Harness
    12596, -- Battle Jupon
    12691, -- Coral Finger Gauntlets
    12724, -- Battle Bracers
    12839, -- Darksteel Subligar
    13649, -- Tafetta Cape
    13655, -- Sand Mantle
    13187, -- Tiger Belt
    12435, -- Coral Visor
    12708, -- Darksteel Mittens
    12189, -- Coral Cuisses
    12947, -- Coral Greaves
    12612, -- Silk Cloak
    12830, -- Tiget Trousers
    12958, -- Tiget Ledelsens
    14023, -- Arhat's Tekko
    13881, -- Arhat's Jinpachi
    14136, -- Arhat's Sune-ate
    13795, -- Arhat's Gi
    14253, -- Arhat's Hakama
    13235, -- Prism Obi
    13312, -- Coral Earring
    15202, -- Yagudo Headgear
    15201, -- Quadav Barbut
    15699, -- Templar Sabatons
    15811, -- Wivre Ring
    16231, -- Smilodon Mantle
    16009, -- Pennon Earring
    13789, -- Carapace Breastplate
    13878, -- Carapace Helm
    14764, -- Minuet Earring
    14008, -- Carapace Gauntlets
}

 itemReward75 = {
    16596, -- Falmberge
    18082, -- Barchha
    16729, -- Berserkers Ask
    18405, -- Jadagna
    18420, -- Hayabusa
    18439, -- Shirogatana
    18848, -- Brass Jadagna
    16453, -- Orichalcum Dagger
    12305, -- Ice Shield
    17200, -- Rosenbogen
    17205, -- Gendawa
    17838, -- Harlequin's Horn
    18389, -- Crude Sword
    18115, -- Engetsuto
    17842, -- Sorrowful Harp
    17854, -- Cradle Horn
    18026, -- Magnet Knife
    17251, -- Hellfire
    17359, -- Mythic Harp
    17471, -- Horrent Mace
    16461, -- Adaman Kris
    16586, -- Adamaan Claymore
    17065, -- Platinum Rod
    17101, -- Mythic Pole
    18858, -- Flanged Mace
    11406, -- Stimulus Sabots
    17221, -- Repeating Crossbow
    16542, -- Wing Sword
    16506, -- Stun Kukri
    12383, -- General's Shield
    12703, -- Coeurl Gloves
    12359, -- Hickory Shield
    12469, -- War Beret
    12575, -- Coeurl Jerkin
    12597, -- War Aketon
    12617, -- War Shinobi Gi
    12725, -- War Gloves
    12831, -- Coeurl Trousers
    12880, -- Ogre Trousers
    13087, -- Jeweled Collar
    13212, -- Tarutaru Sash
    13455, -- Coral Ring
    13460, -- Behemoth Ring
    13574, -- Black Ribbon
    13595, -- Coeurl Mantle
    13587, -- Rainbow Cape
    13448, -- Emerald Ring
    13449, -- Ruby Ring
    13450, -- Diamond Ring
    13451, -- Spinel Ring
    13452, -- Saphhire Ring
    13453, -- Topaz Ring
    13462, -- Death Ring
    13463, -- Angel's Ring
    13628, -- Hexerei Cape [SPECIAL]
    13704, -- Ogre Mask
    13918, -- Tiger Mask
    16235, -- Lynx Mantle
    15302, -- Bloodbead Gorget [SPECIAL]
    16268, -- Kubira Beads
    15827, -- Insect Ring
    15828, -- Blood Ring
    15478, -- Melee Cape
    13985, -- Platinum Bangles
    14067, -- Tarasque Mitts
    14288, -- Clown's Subligar
    15152, -- Cactuar Ribbon
    13705, -- Ogre Jerkin
    13706, -- Ogre Gloves
    13757, -- Lord's Cuirass
    13767, -- Demon's Harness
    13772, -- Bloody Aketon
    13929, -- Errant Hat
    14078, -- Errant Cuffs
    14182, -- Errant Pigaches
    14301, -- Errant Slops
    14440, -- Chasuble [SPECIAL]
    14380, -- Errant Houpala
    14196, -- Dance Shoes
    13708, -- Ogre Ledelsens
    13648, -- Gigant Mantle
    12981, -- War Boots
    12853, -- War Brais
    12447, -- Coeurl Mask
    12812, -- Thick Breeches
    12959, -- Coeurl Ledelsens
    13775, -- Blue Cotehardie
    15466, -- Birdman Cape
 }



local notoGeneralRewards = {
    {13548, 1, 25, 0},                               -- Astral Ring
    {16144, 1, 25, 0},                               -- Sol Cap
    {14598, 1, 25, 0},                               -- Energy Ring +1
    {13326, 1, 25, 0},                               -- Beetle Earring +1
    {14599, 1, 25, 0},                               -- Hope Ring +1
    {14695, 1, 25, 0},                               -- Hope Earring +1
    {15947, 1, 25, 0},                               -- Griot Belt +1
    {14694, 1, 25, 0},                               -- Energy Earring +1
    {14790, 1, 25, 0},                               -- Reraise Earring
    {15147, 1, 25, 0},                               -- Garrison Sallet
    {14851, 1, 25, 0},                               -- Garrison Gloves
    {14314, 1, 25, 0},                               -- Garrison Hose
    {14206, 1, 25, 0},                               -- Garrison Boots
    {13818, 1, 25, 0},                               -- Garrison Tunic
    {16687, 1, 25, 0},                               -- Platoon Axe
    {16959, 1, 25, 0},                               -- Platoon Sword
    {17202, 1, 25, 0},                               -- Platoon Bow
    {17271, 1, 25, 0},                               -- Platoon Gun
    {17462, 1, 25, 0},                               -- Platoon Mace
    {17519, 1, 25, 0},                               -- Platoon Cesti
    {17571, 1, 25, 0},                               -- Platoon Pole
    {17692, 1, 25, 0},                               -- Platoon Spatha
    {17993, 1, 25, 0},                               -- Platoon Dagger
    {18045, 1, 25, 0},                               -- Platoon Zaghnal
    {18085, 1, 25, 0},                               -- Platoon Lance
    {18170, 1, 25, 0},                               -- Platoon Edge
    {18171, 1, 25, 0},                               -- Platoon Disc
    {18209, 1, 25, 0},                               -- Platoon Cutter
    {13514, 25, 45, 0},                               -- Archer's Ring
    {13643, 25, 45, 0},                               -- Sarcenet Cape
    {14721, 25, 45, 0},                               -- Morion Earring +1
    {11542, 45, 60, 0},                               -- Kinesis Mantle +1
}

local nearWindurst = {ZONE_HORUTOTO_INNER, ZONE_SARUTA_EAST, ZONE_SARUTA_WEST, ZONE_GIDDEUS, ZONE_TAHRONGI, ZONE_BUBURIMU};
local nearBastok = {ZONE_GUSTABERG_NORTH, ZONE_GUSTABERG_SOUTH, ZONE_PALBOROUGH, ZONE_ZERUHN, ZONE_DANGRUF, ZONE_KONSCHTAT, ZONE_VALKURM};
local nearSandoria = {ZONE_RONFAURE_EAST, ZONE_RONFAURE_WEST, ZONE_RANPERRE, ZONE_GHELSBA_FORT, ZONE_GHELSBA_OUTPOST, ZONE_LATHEINE, ZONE_YUGHOTT, ZONE_CARPENTERS};

local notoZoneRewards = {
    {17494, 1, 21, nearWindurst},                       -- Tropical Punches +1
    {12536, 1, 30, nearWindurst},                       -- Erudite's Headband
    {17159, 1, 21, nearWindurst},                       -- Freesword's Bow
    {17130, 1, 21, nearWindurst},                       -- Freesword's Staff
    {17028, 1, 21, nearWindurst},                       -- Freesword's Club
    {14274, 1, 21, nearWindurst},                       -- Federation Slops
    {17196, 22, 30, nearWindurst},                       -- Federation Bow
    {17445, 22, 30, nearWindurst},                       -- Federation Club
    {17538, 22, 30, nearWindurst},                       -- Federation Staff
    {17536, 22, 30, nearWindurst},                       -- Federation Pole
    {14044, 22, 30, nearWindurst},                       -- Federation Tekko
    {14351, 22, 30, nearWindurst},                       -- Federation Gi
    {16947, 22, 30, nearWindurst},                       -- Federation Sword
    {17977, 22, 30, nearWindurst},                       -- Federation Knife
    {14046, 28, 40, nearWindurst},                       -- Federation Gloves
    {14154, 28, 40, nearWindurst},                       -- Federation Gaiters
    {14272, 28, 40, nearWindurst},                       -- Federation Brais
    {17979, 28, 40, nearWindurst},                       -- Federation Kukri
    {18037, 28, 40, nearWindurst},                       -- Federation Scythe

    {13890, 1, 21, nearBastok},                         -- Republic Cap
    {14032, 1, 21, nearBastok},                         -- Republic Mittens
    {14140, 1, 21, nearBastok},                         -- Republic Leggings
    {14339, 1, 21, nearBastok},                         -- Republic Harness
    {17500, 1, 21, nearBastok},                         -- Republic Knuckles
    {17542, 1, 21, nearBastok},                         -- Republic Stuff
    {17930, 1, 21, nearBastok},                         -- Republic Axe
    {18039, 1, 21, nearBastok},                         -- Republic Scythe
    {17453, 22, 30, nearBastok},                        -- Republic Hammer
    {12373, 22, 30, nearBastok},                        -- Republic Targe
    {14260, 22, 30, nearBastok},                        -- Republic Subligar
    {17975, 22, 30, nearBastok},                        -- Republic Dagger
    {13898, 28, 40, nearBastok},                        -- Republic Visor
    {13900, 28, 40, nearBastok},                        -- Republic Circlet
    {14148, 28, 40, nearBastok},                        -- Republic Greaves
    {14268, 28, 40, nearBastok},                        -- Republic Cuisses
    {16733, 28, 40, nearBastok},                        -- Republic Greataxe
    {17673, 28, 40, nearBastok},                        -- Republic Sword
    {19223, 1, 30, nearBastok},                         -- Attar of Roses
    {13240, 1, 30, nearBastok},                         -- Warrior's Belt +1
    {4524, 1, 30, nearBastok},                          -- Exactitude Mantle +1

    {13632, 1, 30, nearSandoria},                       -- Nomad's Mantle +1
    {14349, 1, 21, nearSandoria},                       -- Kingdom Tunic
    {13896, 1, 21, nearSandoria},                       -- Kingdom Bandana
    {14038, 1, 21, nearSandoria},                       -- Kingdom Gloves
    {14146, 1, 21, nearSandoria},                       -- Kingdom Boots
    {14345, 1, 21, nearSandoria},                       -- Kingdom Vest
    {17198, 1, 21, nearSandoria},                       -- Kingdom Bow
    {17496, 1, 21, nearSandoria},                       -- Kingdom Cesti
    {17679, 1, 21, nearSandoria},                       -- Kingdom Sword
    {18069, 22, 30, nearSandoria},                       -- Kingdom Spear
    {14150, 22, 30, nearSandoria},                       -- Kingdom Clogs
    {14266, 22, 30, nearSandoria},                       -- Kingdom Trousers
    {17836, 22, 30, nearSandoria},                       -- Kingdom Horn
    {13892, 28, 40, nearSandoria},                       -- Kingdom Helm
    {14034, 28, 40, nearSandoria},                       -- Kingdom Mufflers
    {14142, 28, 40, nearSandoria},                       -- Kingdom Sollerets
    {17449, 28, 40, nearSandoria},                       -- Kingdom Mace
    {17973, 28, 40, nearSandoria},                       -- Kingdom Dagger
    {18071, 28, 40, nearSandoria},                       -- Kingdom Halberd
};

local zClassTorque = {ZONE_RANGUEMONT, ZONE_KORROLOKA, ZONE_BEADEAUX, ZONE_OZTROJA, ZONE_DAVOI, ZONE_DELKFUTT_HIGH, ZONE_LUFAISE, ZONE_MISAREAUX, ZONE_PHOMIUNA};
local zClassShield = {ZONE_KONSCHTAT, ZONE_YUGHOTT, ZONE_VALKURM, ZONE_SHAKHRAMI, ZONE_BATALLIA, ZONE_QUFIM, ZONE_BEAUCEDINE};
local zClassEarring = {ZONE_HORUTOTO_OUTER, ZONE_GIDDEUS, ZONE_JUGNER, ZONE_GUSGEN, ZONE_ROLANBERRY, ZONE_ZITAH};
local zClassBelt = {ZONE_TAHRONGI, ZONE_GHELSBA_OUTPOST, ZONE_GHELSBA_FORT, ZONE_CARPENTERS, ZONE_DELKFUTT_MID, ZONE_SAUROMUGUE, ZONE_ALTEPA_EAST};
local zClassBack = {ZONE_LATHEINE, ZONE_BUBURIMU, ZONE_MERIPHATAUD, ZONE_ORDELLE, ZONE_DELKFUTT_LOW, ZONE_YUHTUNGA, ZONE_BIBIKI};
local zEnyos = {};
local zNjords = {};
local zHoshikazu = {};
local zAnus = {};
local zNemains = {};

local notoClassRewards = {
    {11988, 15, 55, zClassTorque},                     -- Fighter's Torque
    {11989, 10, 55, zClassTorque},                     -- Temple Torque
    {11990, 10, 55, zClassTorque},                     -- Healer Torque
    {11991, 10, 55, zClassTorque},                     -- Wizard Torque
    {11992, 10, 55, zClassTorque},                     -- Warlock Torque
    {11993, 10, 55, zClassTorque},                     -- Rogue Torque
    {11994, 10, 55, zClassTorque},                     -- Gallant Torque
    {11995, 10, 55, zClassTorque},                     -- Chaos Torque
    {11996, 10, 55, zClassTorque},                     -- Beast Torque
    {11997, 10, 55, zClassTorque},                     -- Choral Torque
    {11998, 10, 55, zClassTorque},                     -- Hunter Torque
    {11999, 10, 55, zClassTorque},                     -- Myochin Shusa
    {12000, 10, 55, zClassTorque},                     -- Ninja Shusa
    {12001, 10, 55, zClassTorque},                     -- Drachen Torque
    {12002, 10, 55, zClassTorque},                     -- Evoker Torque
    {12003, 10, 55, zClassTorque},                     -- Magus Torque
    {12004, 10, 55, zClassTorque},                     -- Corsair Torque
    {12005, 10, 55, zClassTorque},                     -- Puppetry Torque
    {12006, 10, 55, zClassTorque},                     -- Dancer Torque
    {12007, 10, 55, zClassTorque},                     -- Scholar Torque

    {12389, 10, 55, zClassShield},                     -- Mercenary Targe
    {12390, 10, 55, zClassShield},                     -- Wrestler Aspis
    {12391, 10, 55, zClassShield},                     -- Healer Shield
    {12392, 10, 55, zClassShield},                     -- Wizard Shield
    {12393, 10, 55, zClassShield},                     -- Warlock Shield
    {12394, 10, 55, zClassShield},                     -- Pilferer Shield
    {12395, 10, 55, zClassShield},                     -- Varlet Targe
    {12396, 10, 55, zClassShield},                     -- Killer Targe
    {12397, 10, 55, zClassShield},                     -- Trimmer Aspis
    {12398, 10, 55, zClassShield},                     -- Singer Shield
    {12399, 10, 55, zClassShield},                     -- Beater Shield
    {12400, 10, 55, zClassShield},                     -- Ashigaru Targe
    {12401, 10, 55, zClassShield},                     -- Genin Aspis
    {12402, 10, 55, zClassShield},                     -- Wyvern Targe
    {12403, 10, 55, zClassShield},                     -- Magician Shield

    {13435, 10, 55, zClassEarring},                     -- Mercenary Earring
    {13436, 10, 55, zClassEarring},                     -- Class Earring
    {13437, 10, 55, zClassEarring},                     -- Class Earring
    {13438, 10, 55, zClassEarring},                     -- Class Earring
    {13439, 10, 55, zClassEarring},                     -- Class Earring
    {14729, 10, 55, zClassEarring},                     -- Class Earring
    {14730, 10, 55, zClassEarring},                     -- Class Earring
    {14731, 10, 55, zClassEarring},                     -- Class Earring
    {14732, 10, 55, zClassEarring},                     -- Class Earring
    {14733, 10, 55, zClassEarring},                     -- Class Earring
    {14734, 10, 55, zClassEarring},                     -- Class Earring
    {14735, 10, 55, zClassEarring},                     -- Class Earring
    {14736, 10, 55, zClassEarring},                     -- Class Earring
    {14737, 10, 55, zClassEarring},                     -- Class Earring
    {14738, 10, 55, zClassEarring},                     -- Class Earring

    {13659, 10, 55, zClassBack},                     -- Class Back
    {13660, 10, 55, zClassBack},                     -- Class Back
    {13661, 10, 55, zClassBack},                     -- Class Back
    {13662, 10, 55, zClassBack},                     -- Class Back
    {13663, 10, 55, zClassBack},                     -- Class Back
    {13664, 10, 55, zClassBack},                     -- Class Back
    {13665, 10, 55, zClassBack},                     -- Class Back
    {13666, 10, 55, zClassBack},                     -- Class Back
    {13667, 10, 55, zClassBack},                     -- Class Back
    {13668, 10, 55, zClassBack},                     -- Class Back
    {13669, 10, 55, zClassBack},                     -- Class Back
    {13670, 10, 55, zClassBack},                     -- Class Back
    {13671, 10, 55, zClassBack},                     -- Class Back
    {13672, 10, 55, zClassBack},                     -- Class Back
    {13673, 10, 55, zClassBack},                     -- Class Back

    {15271, 10, 55, zClassBelt},                     -- Class Belt
    {15272, 10, 55, zClassBelt},                     -- Class Belt
    {15273, 10, 55, zClassBelt},                     -- Class Belt
    {15274, 10, 55, zClassBelt},                     -- Class Belt
    {15275, 10, 55, zClassBelt},                     -- Class Belt
    {15276, 10, 55, zClassBelt},                     -- Class Belt
    {15277, 10, 55, zClassBelt},                     -- Class Belt
    {15278, 10, 55, zClassBelt},                     -- Class Belt
    {15279, 10, 55, zClassBelt},                     -- Class Belt
    {15280, 10, 55, zClassBelt},                     -- Class Belt
    {15281, 10, 55, zClassBelt},                     -- Class Belt
    {15282, 10, 55, zClassBelt},                     -- Class Belt
    {15283, 10, 55, zClassBelt},                     -- Class Belt
    {15284, 10, 55, zClassBelt},                     -- Class Belt
    {15285, 10, 55, zClassBelt},                     -- Class Belt

};



local endGameRewards = {
    15840,              -- Kupofried's Ring (1)
    15543,              -- Rajas Ring (30)
    15544,              -- Sattva Ring (30)
    15545,              -- Tamas Ring (30)
};


function levelRewards(player)
    local totalReward = 0;
    local totalLevels = 0;
    for job=0,22 do
        totalLevels = totalLevels + player:getJobLevel(job);
    end

    local curReward = player:getVar("totalLevelReward");
    while (curReward + 5 <= totalLevels) do
        totalReward = totalReward + 1000;
        curReward = curReward + 5;
    end

    if (totalReward > 0) then
        player:setVar("totalLevelReward", curReward);
        player:SayToPlayer("For your efforts in leveling, you receive " .. tostring(totalReward) .. " gil!");
        player:addCurrency("spark_of_eminence", curReward / 100);
        player:SayToPlayer("For your efforts in leveling, you receive " .. tostring(totalReward / 100) .. " sparks!");
        player:addGil(totalReward);
    end



end

local function getAugmentPool(mob)
    local level = mob:getMainLvl();

    if (level >= 80) then return itemReward75;
    elseif (level >= 70) then return itemReward65;
    elseif (level >= 60) then return itemReward55;
    elseif (level >= 50) then return itemReward45;
    elseif (level >= 40) then return itemReward35;
    elseif (level >= 30) then return itemReward25;
    elseif (level >= 20) then return itemReward15;
    else return itemReward10;
    end

end


function rewardNotorious(mob, player, isKiller)
    player:resetMusic();
--    if (true) then return true end;

    if (player:getLocalVar("notoSpawner") == 1) then
        player:setLocalVar("notoSpawner", 0);

        -- reward basic item
        local size = 0;
        local augmentPool = getAugmentPool(mob);
        for i,v in pairs(augmentPool) do
            size = size + 1;
        end

        local id = augmentPool[math.random(1, size)];
        local item = getItem(id);
        local augments = pickAugments(item);
        local reward = {
            ["augment"] = {id, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]},
        };
        jsrReward(player, reward);
    end

    -- And drops exclusive to that particular NM and also drops that are normal for all of that level
    if (isKiller == true) then
        local rewards = {};
        addRewards(mob, player, rewards, notoGeneralRewards);
        addRewards(mob, player, rewards, notoZoneRewards);
        addRewards(mob, player, rewards, notoClassRewards);

        local size = 0;
        for i,v in pairs(rewards) do
            size = size + 1;
        end

        local first = rewards[math.random(1, size)];
        player:addTreasure(first, mob);

        if (mob:getMainLvl() >= player:getMainLvl() + 2) then
            local second = rewards[math.random(1, size)];
            if (second == first) then
                second = rewards[math.random(1, size)];
            end
            player:addTreasure(second, mob);
        end
    end

    -- Rewards XP and scylds
    local xpBonus = mob:getMainLvl() * 50;
    local xpReward = {
        ["xp"] = xpBonus,
        ["scyld"] = 10
    };
    jsrReward(player, xpReward);

end

local notoBonus1 = {
    ZONE_SARUTA_WEST, ZONE_SARUTA_EAST, ZONE_RONFAURE_WEST, ZONE_RONFAURE_EAST,
    ZONE_GUSTABERG_NORTH, ZONE_GUSTABERG_SOUTH, ZONE_RANPERRE, ZONE_DANGRUF,
    ZONE_GHELSBA_FORT, ZONE_GHELSBA_OUTPOST, ZONE_GIDDEUS, ZONE_YUGHOTT,
    ZONE_RANPERRE, ZONE_TAHRONGI, ZONE_VALKURM, ZONE_LATHEINE,
    ZONE_BUBURIMU, ZONE_KONSCHTAT, ZONE_HORUTOTO_INNER,
    ZONE_SHAKHRAMI, ZONE_DANGRUF, ZONE_MERIPHATAUD, ZONE_PASHHOW,
    ZONE_JUGNER, ZONE_CARPENTERS
};

local notoBonus2 = {
    ZONE_QUFIM, ZONE_HORUTOTO_OUTER, ZONE_RANGUEMONT, ZONE_KORROLOKA,
    ZONE_GUSGEN, ZONE_ORDELLE, ZONE_SAUROMUGUE, ZONE_BATALLIA,
    ZONE_ROLANBERRY, ZONE_DELKFUTT_LOW
};

local notoBonus4 = {
    ZONE_DELKFUTT_MID, ZONE_DELKFUTT_HIGH, ZONE_YUHTUNGA,
    ZONE_DAVOI, ZONE_BEADEAUX, ZONE_OZTROJA, ZONE_ZITAH,
    ZONE_LUFAISE, ZONE_BEAUCEDINE
};

local notoBonus5 = {
    ZONE_ALTEPA_EAST, ZONE_MISAREAUX, ZONE_PHOMIUNA,
    ZONE_RIVERNE_A1, ZONE_OLDTON, ZONE_GARLAIGE, ZONE_XARCABARD,
}

local notoBonus6 = {
    ZONE_BIBIKI, ZONE_SEASERPENT, ZONE_YHOATOR, ZONE_ATTOHWA,
    ZONE_ELDIEME, ZONE_CRAWLERS, ZONE_BEHEMOTHS, ZONE_MON_CAVERN,
    ZONE_GUSTAV, ZONE_ALTEPA_WEST, ZONE_SACRARIUM, ZONE_ZVAHL_KEEP
};

local notoBonus7 = {
    ZONE_QUICKSAND, ZONE_BOSTAUNIEUX, ZONE_TORAIMARAI, ZONE_RIVERNE_B1,
    ZONE_FEIYIN, ZONE_ONZOZO, ZONE_UGGALEPIH, ZONE_ZVAHL_BAILEYS,
};

local notoBonus8 = {
    ZONE_PSOXJA, ZONE_KUFTAL, ZONE_CAULDRON, ZONE_TERRIGAN,
    ZONE_NEWTON, ZONE_RANCOR, ZONE_BOYAHDA, ZONE_ULEGUERAND, ZONE_SORROWS
};

local localBonus9 = {
    ZONE_ALTAIEU, ZONE_HUXZOI, ZONE_RUAVITAU, ZONE_VELUGANNON,
    ZONE_RUAUN, ZONE_ROMAEVE, ZONE_AERY, ZONE_RUHMET
};

local notoBonusMap = {
    {{ZONE_SARUTA_EAST, ZONE_SARUTA_WEST}},
}
