-----------------------------------
-- Area: Inner Horutoto Ruins (192)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.INNER_HORUTOTO_RUINS] =
{
    text =
    {
        PORTAL_SEALED_BY_3_MAGIC  = 8,     -- The Sealed Portal is sealed by three kinds of magic.
        PORTAL_NOT_OPEN_THAT_SIDE = 9,     -- The Sealed Portal cannot be opened from this side.
        CONQUEST_BASE             = 10,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED   = 6552,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6558,  -- Obtained: <item>.
        GIL_OBTAINED              = 6559,  -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6561,  -- Obtained key item: <keyitem>.
        FELLOW_MESSAGE_OFFSET     = 6587,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS       = 7169, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7170, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7171, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        GEOMAGNETRON_ATTUNED      = 7180,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        NOT_BROKEN_ORB            = 7235,  -- The Mana Orb in this receptacle is not broken.
        EXAMINED_RECEPTACLE       = 7236,  -- You have already examined this receptacle.
        DOOR_FIRMLY_CLOSED        = 7263,  -- The door is firmly closed.
        CAT_BURGLARS_HIDEOUT      = 7264,  -- It looks like that Cat Burglar's hideout lies behind this door! You were able to confirm <keyitem>!
        CHEST_UNLOCKED            = 7339,  -- You unlock the chest!
        PLAYER_OBTAINS_ITEM       = 7402,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM     = 7403,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM  = 7404,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP      = 7405,  -- You already possess that temporary item.
        NO_COMBINATION            = 7410,  -- You were unable to enter a combination.
        REGIME_REGISTERED         = 9488,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL     = 10536, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SLENDLIX_SPINDLETHUMB_PH =
        {
            [17563758] = 17563785, -- -238.315 -0.002 -179.249
        },
        NOCUOUS_WEAPON_PH =
        {
            [17563798] = 17563801, -- -236.855 0.476 -51.263
            [17563799] = 17563801, -- -237.426 0.5 -23.412
            [17563800] = 17563801, -- -230.732 -0.025 -52.324
        },
    },
    npc =
    {
        CASKET_BASE        = 17563838,
        PORTAL_CIRCLE_BASE = 17563861,
        TREASURE_CHEST     = 17563914,
    },
}

return zones[xi.zone.INNER_HORUTOTO_RUINS]
