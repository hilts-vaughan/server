-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hadayah
-- Type: Alchemy Image Support
-- !pos -10.470 -6.25 -141.700 241
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/status")
require("scripts/globals/crafting")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local guildMember = isGuildMember(player, 1)
    local SkillLevel = player:getSkillLevel(xi.skill.ALCHEMY)

    if guildMember == 1 then
        if player:hasStatusEffect(xi.effect.ALCHEMY_IMAGERY) == false then
            player:startEvent(638, 4, SkillLevel, 1, 511, 187, 0, 7, 2184)
        else
            player:startEvent(638, 4, SkillLevel, 1, 511, 5662, 6955, 7, 2184)
        end
    else
        player:startEvent(638, 0, 0, 0, 0, 0, 0, 7, 0) -- Standard Dialogue
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid == 638 and option == 1 then
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, 7, 1)
        player:addStatusEffect(xi.effect.ALCHEMY_IMAGERY, 1, 0, 120)
    end
end

return entity
