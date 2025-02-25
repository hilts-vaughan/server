-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.FAFNIR_QM):setStatus(xi.status.DISAPPEAR)
    end

    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

entity.onMobFight = function(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")

    if twohourTime == 0 then
        mob:setLocalVar("twohourTime", math.random(30, 90))
    end

    if battletime >= twohourTime then
        mob:useMobAbility(1053) -- Legitimately captured super_buff ID
        mob:setLocalVar("twohourTime", battletime + math.random(60, 120))
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(xi.title.NIDHOGG_SLAYER)
end

entity.onMobDespawn = function(mob)
    -- Set Nidhogg's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Nidhogg", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Nidhogg", 0)
        DisallowRespawn(ID.mob.FAFNIR, false)
        UpdateNMSpawnPoint(ID.mob.FAFNIR)
        GetMobByID(ID.mob.FAFNIR):setRespawnTime(75600 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end

return entity
