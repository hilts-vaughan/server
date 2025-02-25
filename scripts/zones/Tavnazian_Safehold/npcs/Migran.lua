-----------------------------------
-- Area: Tavnasian Safehold
--  NPC: Migran
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/missions")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        12577, 2485,      -- Brass Harness
        12985, 1625,      -- Holly Clogs
    }

    if player:getCurrentMission(COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        table.insert(stock, 14317)    -- Barone Cosciales
        table.insert(stock, 4042200)
        table.insert(stock, 15305)    -- Barone Gambieras
        table.insert(stock, 25210200)
        table.insert(stock, 14848)    -- Barone Manopolas
        table.insert(stock, 7276200)
        table.insert(stock, 15389)    -- Vir Subligar
        table.insert(stock, 8000000)
        table.insert(stock, 15390)    -- Femina Subligar
        table.insert(stock, 8000000)
    end

    player:showText(npc, ID.text.MIGRAN_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
