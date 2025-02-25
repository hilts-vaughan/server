-----------------------------------
-- Area: Castle Oztroja
--  NPC: _m70 (Torch Stand)
-- Involved in Mission: Magicite
-- !pos -97.134 24.250 -105.979 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.YAGUDO_TORCH) then
        player:startEvent(11)
    else
        player:messageSpecial(ID.text.PROBABLY_WORKS_WITH_SOMETHING_ELSE)
    end

    return 1
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
