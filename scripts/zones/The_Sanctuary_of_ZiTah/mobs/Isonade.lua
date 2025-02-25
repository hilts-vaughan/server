-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Isonade
-- Involved in Quest: The Sacred Katana
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.THE_SACRED_KATANA) == QUEST_ACCEPTED then
        player:setCharVar("IsonadeKilled", 1)
    end
end

return entity
