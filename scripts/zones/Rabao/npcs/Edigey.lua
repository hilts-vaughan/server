-----------------------------------
-- Area: Rabao
--  NPC: Edigey
-- Starts and Ends Quest: Don't Forget the Antidote
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Rabao/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ForgetTheAntidote = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DONT_FORGET_THE_ANTIDOTE)

    if ((ForgetTheAntidote == QUEST_ACCEPTED or ForgetTheAntidote == QUEST_COMPLETED) and trade:hasItemQty(1209, 1) and trade:getItemCount() == 1) then
        player:startEvent(4, 0, 1209)
    end
end

entity.onTrigger = function(player, npc)
    local ForgetTheAntidote = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DONT_FORGET_THE_ANTIDOTE)

    if (ForgetTheAntidote == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 4) then
        player:startEvent(2, 0, 1209)
    elseif (ForgetTheAntidote == QUEST_ACCEPTED) then
        player:startEvent(3, 0, 1209)
    elseif (ForgetTheAntidote == QUEST_COMPLETED) then
        player:startEvent(5, 0, 1209)
    else
        player:startEvent(50)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2 and option == 1) then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DONT_FORGET_THE_ANTIDOTE)
        player:setCharVar("DontForgetAntidoteVar", 1)
    elseif (csid == 4 and player:getCharVar("DontForgetAntidoteVar") == 1) then --If completing for the first time
        player:setCharVar("DontForgetAntidoteVar", 0)
        player:tradeComplete()
        player:addTitle(xi.title.DESERT_HUNTER)
        player:addItem(16974) -- Dotanuki
        player:messageSpecial(ID.text.ITEM_OBTAINED, 16974)
        player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DONT_FORGET_THE_ANTIDOTE)
        player:addFame(RABAO, 60)
    elseif (csid == 4) then --Subsequent completions
        player:tradeComplete()
        player:addGil(GIL_RATE*1800)
        player:messageSpecial(ID.text.GIL_OBTAINED, 1800)
        player:addFame(RABAO, 30)
    end

end

return entity
