-----------------------------------
-- Area: Norg
--  NPC: Heiji
-- Starts and Ends Quest: Like a Shining Subligar
-- !pos -1 -5 25 252
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/shop")
require("scripts/globals/quests")
local ID = require("scripts/zones/Norg/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    local ShiningSubligar = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.LIKE_A_SHINING_SUBLIGAR)
    local Subligar = trade:getItemQty(14242)

    if (Subligar > 0 and Subligar == trade:getItemCount()) then
        local TurnedInVar = player:getCharVar("shiningSubligar_nb")
        if (ShiningSubligar == QUEST_ACCEPTED and TurnedInVar + Subligar >= 10) then -- complete quest
            player:startEvent(125)
        elseif (ShiningSubligar == QUEST_ACCEPTED and TurnedInVar <= 9) then -- turning in less than the amount needed to finish the quest
            local TotalSubligar = Subligar + TurnedInVar
            player:tradeComplete()
            player:setCharVar("shiningSubligar_nb", TotalSubligar)
            player:startEvent(124, TotalSubligar) -- Update player on number of subligar turned in
        end
    else
        if (ShiningSubligar == QUEST_ACCEPTED) then
            player:startEvent(124, TotalSubligar) -- Update player on number of subligar turned in, but doesn't accept anything other than subligar
        else
            player:startEvent(122) -- Give standard conversation if items are traded but no quest is accepted
        end
    end

end

entity.onTrigger = function(player, npc)

    local ShiningSubligar = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.LIKE_A_SHINING_SUBLIGAR)

    if (ShiningSubligar == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 3) then
        player:startEvent(123) -- Start Like a Shining Subligar
    elseif (ShiningSubligar == QUEST_ACCEPTED) then
        player:startEvent(124, player:getCharVar("shiningSubligar_nb")) -- Update player on number of subligar turned in
    else
        player:startEvent(122) -- Standard Conversation
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 123) then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.LIKE_A_SHINING_SUBLIGAR)
    elseif (csid == 125) then
        player:tradeComplete()
        player:addTitle(xi.title.LOOKS_SUBLIME_IN_A_SUBLIGAR)
        player:addItem(4955) -- Scroll of Kurayami: Ichi
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4955) -- Scroll of Kurayami: Ichi
        player:setCharVar("shiningSubligar_nb", 0)
        player:addFame(NORG, 100)
        player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.LIKE_A_SHINING_SUBLIGAR)
    end

end

return entity
