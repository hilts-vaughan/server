-----------------------------------
-- Area: Mhaura
--  NPC: Hagain
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    local hittingTheMarquisate = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.HITTING_THE_MARQUISATE)

    if (hittingTheMarquisate == QUEST_ACCEPTED and trade:hasItemQty(1091, 1) and trade:getItemCount() == 1) then -- Trade Chandelier coal
        player:startEvent(10005)
    end

end

entity.onTrigger = function(player, npc)

    local hittingTheMarquisateHagainCS = player:getCharVar("hittingTheMarquisateHagainCS")

    if (hittingTheMarquisateHagainCS == 1) then -- start first part of miniquest thf af3
        player:startEvent(10003, 0, xi.ki.BOMB_INCENSE, 1091)
    elseif (hittingTheMarquisateHagainCS >= 2 and hittingTheMarquisateHagainCS < 9) then -- dialog during mini quest thf af3
        player:startEvent(10004, 0, xi.ki.BOMB_INCENSE, 1091)
    elseif (hittingTheMarquisateHagainCS == 9) then
        player:startEvent(10006)    -- after the mini quest
    else
        player:startEvent(10002)    -- standard dialog
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 10003) then
        player:setCharVar("hittingTheMarquisateHagainCS", 2)
        player:addKeyItem(xi.ki.BOMB_INCENSE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BOMB_INCENSE)
    elseif (csid == 10005) then
        player:setCharVar("hittingTheMarquisateHagainCS", 9)
        player:delKeyItem(xi.ki.BOMB_INCENSE)
        player:tradeComplete()
    end

end

return entity
