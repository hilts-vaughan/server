-----------------------------------
-- Area: King Ranperre's Tomb
-- DOOR: _5a0 (Heavy Stone Door)
-- !pos -39.000 4.823 20.000 190
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local currentMission = player:getCurrentMission(SANDORIA)
    local missionStatus = player:getMissionStatus(player:getNation())

    if
        currentMission == xi.mission.id.sandoria.RANPERRE_S_FINAL_REST and
        missionStatus == 1 and
        not GetMobByID(ID.mob.CORRUPTED_YORGOS):isSpawned() and
        not GetMobByID(ID.mob.CORRUPTED_SOFFEIL):isSpawned() and
        not GetMobByID(ID.mob.CORRUPTED_ULBRIG):isSpawned()
    then
        SpawnMob(ID.mob.CORRUPTED_YORGOS)
        SpawnMob(ID.mob.CORRUPTED_SOFFEIL)
        SpawnMob(ID.mob.CORRUPTED_ULBRIG)
    end
    if currentMission == xi.mission.id.sandoria.RANPERRE_S_FINAL_REST and missionStatus == 2 then -- NMs killed
        player:setMissionStatus(player:getNation(), 3)
    elseif currentMission == xi.mission.id.sandoria.RANPERRE_S_FINAL_REST and missionStatus == 3 and player:getXPos() > -39.019 then -- standing outside
        player:startEvent(6) -- enter cutscene
    elseif currentMission == xi.mission.id.sandoria.RANPERRE_S_FINAL_REST and missionStatus == 3 then -- inside
        player:startEvent(7) -- exit cutscene
    elseif currentMission == xi.mission.id.sandoria.RANPERRE_S_FINAL_REST and missionStatus == 6 then
        player:startEvent(5)
    elseif currentMission == xi.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT and missionStatus == 6 then
        player:startEvent(14)
    else
        player:messageSpecial(ID.text.HEAVY_DOOR)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 5 then
        player:setMissionStatus(player:getNation(), 7)
    elseif csid == 14 then
        player:setMissionStatus(player:getNation(), 7)
        -- at this point 3 optional cs are available and open until watched (add 3 var to char?)
    end
end

return entity
