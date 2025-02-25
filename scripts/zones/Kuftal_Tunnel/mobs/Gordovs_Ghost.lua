-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Gordov's Ghost
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, isKiller)
    if player:getCurrentMission(BASTOK) == xi.mission.id.bastok.ENTER_THE_TALEKEEPER and player:getMissionStatus(player:getNation()) == 2 then
        player:setMissionStatus(player:getNation(), 3)
    end
end

return entity
