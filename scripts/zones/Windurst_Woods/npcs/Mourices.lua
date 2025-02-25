-----------------------------------
-- Area: Windurst Woods
--  NPC: Mourices
-- Involved In Mission: Journey Abroad
-- !pos -50.646 -0.501 -27.642 241
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local missionStatus = player:getMissionStatus(player:getNation())

    if player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.JOURNEY_TO_WINDURST and npcUtil.tradeHas(trade, {{12298, 2}}) then -- Parana Shield x2
        if missionStatus == 5 then
            player:startEvent(455) -- before deliver shield to the yagudo
        elseif missionStatus == 6 then
            player:startEvent(457) -- after deliver...Finish part of this quest
        end
    end
end

entity.onTrigger = function(player, npc)
    local missionStatus = player:getMissionStatus(player:getNation())

    if player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.JOURNEY_ABROAD then
        -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
        if missionStatus == 2 then
            player:startEvent(448)
        elseif missionStatus == 7 then
            player:startEvent(458)
        -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
        elseif missionStatus == 6 then
            player:startEvent(462)
        elseif missionStatus == 11 then
            player:startEvent(468)
        end
    -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
    elseif player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.JOURNEY_TO_WINDURST then
        if missionStatus >= 3 and missionStatus <= 5 then
            player:startEvent(449)
        elseif missionStatus == 6 then
            player:startEvent(456)
        end
    -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
    elseif player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.JOURNEY_TO_WINDURST2 then
        if missionStatus == 7 or missionStatus == 8 then
            player:startEvent(463)
        elseif missionStatus == 9 or missionStatus == 10 then
            player:startEvent(467)
        end
    else
        player:startEvent(441)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 448 then
        player:addMission(xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.JOURNEY_TO_WINDURST)
        player:setMissionStatus(player:getNation(), 3)
        player:delKeyItem(xi.ki.LETTER_TO_THE_CONSULS_SANDORIA)
    elseif csid == 457 then
        player:setMissionStatus(player:getNation(), 7)
        player:confirmTrade()
        player:addMission(xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.JOURNEY_ABROAD)
    elseif csid == 462 then
        player:addMission(xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.JOURNEY_TO_WINDURST2)
        player:setMissionStatus(player:getNation(), 7)
    elseif csid == 467 then
        player:addMission(xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.JOURNEY_ABROAD)
        player:delKeyItem(xi.ki.KINDRED_CREST)
        player:setMissionStatus(player:getNation(), 11)
        npcUtil.giveKeyItem(player, xi.ki.KINDRED_REPORT)
    end
end

return entity
