-----------------------------------
-- Area: Norg
--  NPC: Quntsu-Nointsu
-- Title Change NPC
-- !pos -67 -1 34 252
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

local eventId = 1011
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            xi.title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES,
            xi.title.BUSHIDO_BLADE,
            xi.title.BLACK_MARKETEER,
            xi.title.CRACKER_OF_THE_SECRET_CODE,
            xi.title.LOOKS_SUBLIME_IN_A_SUBLIGAR,
            xi.title.LOOKS_GOOD_IN_LEGGINGS,
        },
    },
    {
        cost = 300,
        title =
        {
            xi.title.APPRENTICE_SOMMELIER,
            xi.title.TREASUREHOUSE_RANSACKER,
            xi.title.HEIR_OF_THE_GREAT_WATER,
            xi.title.PARAGON_OF_SAMURAI_EXCELLENCE,
            xi.title.PARAGON_OF_NINJA_EXCELLENCE,
            xi.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY,
            xi.title.BEARER_OF_BONDS_BEYOND_TIME,
            xi.title.FRIEND_OF_THE_OPOOPOS,
            xi.title.PENTACIDE_PERPETRATOR,
        },
    },
    {
        cost = 400,
        title =
        {
            xi.title.BEARER_OF_THE_WISEWOMANS_HOPE,
            xi.title.BEARER_OF_THE_EIGHT_PRAYERS,
            xi.title.LIGHTWEAVER,
            xi.title.DESTROYER_OF_ANTIQUITY,
            xi.title.SEALER_OF_THE_PORTAL_OF_THE_GODS,
            xi.title.BURIER_OF_THE_ILLUSION,
        },
    },
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.title.changerOnTrigger(player, eventId, titleInfo)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.title.changerOnEventFinish(player, csid, option, eventId, titleInfo)
end

return entity
