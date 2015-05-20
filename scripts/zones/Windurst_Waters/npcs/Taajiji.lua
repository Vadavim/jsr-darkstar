-----------------------------------
-- Area: Windurst Waters
-- NPC:  Taajiji
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,TAAJIJI_SHOP_DIALOG);

    -- stock = {
        -- 0x113B,   756,1,     --Dhalmel Pie
        -- 0x1152,  5050,1,     --Mushroom Risotto
        -- 0x11CA, 12762,1,     --Shallops Tropicale
        -- 0x1129,   984,1,     --Orange Kuchen

        -- 0x119A,  5216,2,     --Mutton Tortilla
        -- 0x1158,  6064,2,     --Whitefish Stew
        -- 0x11DC,  1669,2,     --Beaugreen Sautee
        -- 0x1146,   184,2,     --Orange Juice
        -- 0x1156,  1324,2,     --Dhalmel Steak

        -- 0x1138,   128,3,     --Tortilla
        -- 0x118C,   552,3,     --Puls
        -- 0x1151,  2387,3,     --Dhalmel Stew
        -- 0x119D,    10,3,     --Distilled Water
        -- 0x118D,   184,3,     --Windurstian Tea
        -- 0x11CB,  1711,3      --Windurst Salad
    -- }
    
     stock = {
         0x1146,    40,     --Orange Juice
         0x1147,    60,     --Apple Juice
         0x115A,    100,     --Pineapple Juice
         0x1148,    180,     --Melon Juice
         0x1149,    300,     --Tomato Juice
         0x1159,    500,     --Grape Juice
         0x11CE,    900,     --Yagudo Drink
         0x11A0,    1400,     --Vampire Juice
         0x172C,    2000,     --Kitron Juice
         0x15C8,    100,     --Ayran
         0x10CB,    250,     --Orange Au Lait
         0x10CC,    400,     --Apple Au Lait
         0x10CD,    600,     --Pear Au Lait
         0x10CE,    900,     --Pamama Au Lait
         0x10CF,    1500,     --Persikos Au Lait
         0x172D,    2100     --Dragon Au Lait
        
  
     }
    
    showShop(player, WINDURST, stock);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
