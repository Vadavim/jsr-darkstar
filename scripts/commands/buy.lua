---------------------------------------------------------------------------------------------------
-- func: buy
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop");
cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, shop)
    local id = player:getZoneID();
    local stock = false;
    if (id < 230 or id > 250) then
        return
    end
    
    if (shop == "drinks") then
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
            
      
         };       
    end
    
    if ( stock == false ) then
        return;
    end
    
    showShop(player, 7, stock);

    
end;

