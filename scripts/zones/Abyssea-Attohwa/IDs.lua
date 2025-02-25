-----------------------------------
-- Area: Abyssea-Attohwa
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.ABYSSEA_ATTOHWA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6383, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        CRUOR_TOTAL             = 6987, -- Obtained <number> cruor. (Total: <number>)
        CARRIED_OVER_POINTS     = 7000, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7001, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7002, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CRUOR_OBTAINED          = 7396, -- <name> obtained <number> cruor.
    },
    mob =
    {
    },
    npc =
    {
        QM_POPS =
        {
            -- TODO: the first item, e.g. 'qm1', is unused and will be meaningless once I (Wren) finish entity-QC on all Abyssea zones.
            -- When that is done, I will rewrite Abyssea global and adjust and neaten this table
            --  [17658351] = { 'qm1', {3072},                                                                                                                       {}, 17658261}, -- Granite Borer
            --  [17658352] = { 'qm2', {3073},                                                                                                                       {}, 17658262}, -- Blazing Eruca
            --  [17658353] = { 'qm3', {3074},                                                                                                                       {}, 17658263}, -- Pallid Percy
            --  [17658354] = { 'qm4', {3075},                                                                                                                       {}, 17658264}, -- Gaizkin
            --  [17658355] = { 'qm5', {3076},                                                                                                                       {}, 17658265}, -- Kharon
            --  [17658356] = { 'qm6', {3077},                                                                                                                       {}, 17658266}, -- Drekavac
            --  [17658357] = { 'qm7', {3078},                                                                                                                       {}, 17658267}, -- Svarbhanu
            --  [17658358] = { 'qm8', {3079},                                                                                                                       {}, 17658268}, -- Kampe
            --  [17658359] = { 'qm9', {3080},                                                                                                                       {}, 17658269}, -- Berstuk
            --  [17658360] = {'qm10', {3081},                                                                                                                       {}, 17658270}, -- Maahes
            --  [17658361] = {'qm11', {3082},                                                                                                                       {}, 17658271}, -- Nightshade
            --  [17658362] = {'qm12', {3083},                                                                                                                       {}, 17658272}, -- Wherwetrice
            --  [17658363] = {'qm13', {3084},                                                                                                                       {}, 17658273}, -- Mielikki
            --  [17658364] = {'qm14',     {},                                                                                               { xi.ki.HOLLOW_DRAGON_EYE}, 17658274}, -- Smok
            --  [17658365] = {'qm15',     {}, { xi.ki.BLOTCHED_DOOMED_TONGUE, xi.ki.CRACKED_SKELETON_CLAVICLE, xi.ki.WRITHING_GHOST_FINGER, xi.ki.RUSTED_HOUND_COLLAR}, 17658275}, -- Titlacauan
            --  [17658366] = {'qm16',     {},                                                              { xi.ki.MUCID_WORM_SEGMENT, xi.ki.SHRIVELED_HECTEYES_STALK}, 17658276}, -- Ulhuadshi
            --  [17658367] = {'qm17',     {},                           { xi.ki.VENOMOUS_WAMOURA_FEELER, xi.ki.BULBOUS_CRAWLER_COCOON, xi.ki.DISTENDED_CHIGOE_ABDOMEN}, 17658277}, -- Itzpapalotl
            --  [17658368] = {'qm18',     {},                                                                                               { xi.ki.HOLLOW_DRAGON_EYE}, 17658278}, -- Smok
            --  [17658369] = {'qm19',     {}, { xi.ki.BLOTCHED_DOOMED_TONGUE, xi.ki.CRACKED_SKELETON_CLAVICLE, xi.ki.WRITHING_GHOST_FINGER, xi.ki.RUSTED_HOUND_COLLAR}, 17658279}, -- Titlacauan
            --  [17658370] = {'qm20',     {},                                                              { xi.ki.MUCID_WORM_SEGMENT, xi.ki.SHRIVELED_HECTEYES_STALK}, 17658280}, -- Ulhuadshi
            --  [17658371] = {'qm21',     {},                           { xi.ki.VENOMOUS_WAMOURA_FEELER, xi.ki.BULBOUS_CRAWLER_COCOON, xi.ki.DISTENDED_CHIGOE_ABDOMEN}, 17658281}, -- Itzpapalotl
            --  [17658372] = {'qm22',     {},                                                                                               { xi.ki.HOLLOW_DRAGON_EYE}, 17658282}, -- Smok
            --  [17658373] = {'qm23',     {}, { xi.ki.BLOTCHED_DOOMED_TONGUE, xi.ki.CRACKED_SKELETON_CLAVICLE, xi.ki.WRITHING_GHOST_FINGER, xi.ki.RUSTED_HOUND_COLLAR}, 17658283}, -- Titlacauan
            --  [17658374] = {'qm24',     {},                                                              { xi.ki.MUCID_WORM_SEGMENT, xi.ki.SHRIVELED_HECTEYES_STALK}, 17658284}, -- Ulhuadshi
            --  [17658375] = {'qm25',     {},                           { xi.ki.VENOMOUS_WAMOURA_FEELER, xi.ki.BULBOUS_CRAWLER_COCOON, xi.ki.DISTENDED_CHIGOE_ABDOMEN}, 17658285}, -- Itzpapalotl
        },
    },
}

return zones[xi.zone.ABYSSEA_ATTOHWA]
