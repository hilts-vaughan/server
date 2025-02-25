-----------------------------------
-- Area: Abyssea-Uleguerand
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.ABYSSEA_ULEGUERAND] =
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
            --  [17813949] = { 'qm1',      {3245, 3251},                                                           {}, 17813925}, -- Ironclad Triturator
            --  [17813950] = { 'qm2', {3246, 3247, 3253},                                                           {}, 17813927}, -- Dhorme Khimaira
            --  [17813951] = { 'qm3',      {3248, 3257},                                                           {}, 17813930}, -- Blanga
            --  [17813952] = { 'qm4',      {3249, 3259},                                                           {}, 17813931}, -- Yaguarogui
            --  [17813953] = { 'qm5',           {3250},                                                           {}, 17813933}, -- Koghatu
            --  [17813954] = { 'qm6',           {3252},                                                           {}, 17813935}, -- Upas-Kamuy
            --  [17813955] = { 'qm7',           {3254},                                                           {}, 17813937}, -- Veri Selen
            --  [17813956] = { 'qm8',           {3255},                                                           {}, 17813938}, -- Anemic Aloysius
            --  [17813957] = { 'qm9',           {3256},                                                           {}, 17813939}, -- Chillwing Hwitti
            --  [17813958] = {'qm10',           {3258},                                                           {}, 17813940}, -- Audumbla
            --  [17813959] = {'qm11',               {}, {xi.ki.WARPED_IRON_GIANT_NAIL, xi.ki.DENTED_CHARIOT_SHIELD}, 17813910}, -- Pantokrator
            --  [17813960] = {'qm12',               {},                                  {xi.ki.TORN_KHIMAIRA_WING}, 17813911}, -- Apademak
            --  [17813961] = {'qm13',               {},                                {xi.ki.BEGRIMED_DRAGON_HIDE}, 17813912}, -- Isgebind
            --  [17813962] = {'qm14',               {},                              {xi.ki.DECAYING_DIREMITE_FANG}, 17813913}, -- Resheph
            --  [17813963] = {'qm15',               {}, {xi.ki.WARPED_IRON_GIANT_NAIL, xi.ki.DENTED_CHARIOT_SHIELD}, 17813914}, -- Pantokrator
            --  [17813964] = {'qm16',               {},                                  {xi.ki.TORN_KHIMAIRA_WING}, 17813915}, -- Apademak
            --  [17813965] = {'qm17',               {},                                {xi.ki.BEGRIMED_DRAGON_HIDE}, 17813916}, -- Isgebind
            --  [17813966] = {'qm18',               {},                              {xi.ki.DECAYING_DIREMITE_FANG}, 17813917}, -- Resheph
            --  [17813967] = {'qm19',               {}, {xi.ki.WARPED_IRON_GIANT_NAIL, xi.ki.DENTED_CHARIOT_SHIELD}, 17813918}, -- Pantokrator
            --  [17813968] = {'qm20',               {},                                  {xi.ki.TORN_KHIMAIRA_WING}, 17813919}, -- Apademak
            --  [17813969] = {'qm21',               {},                                {xi.ki.BEGRIMED_DRAGON_HIDE}, 17813920}, -- Isgebind
            --  [17813970] = {'qm22',               {},                              {xi.ki.DECAYING_DIREMITE_FANG}, 17813921}, -- Resheph
        },
    },
}

return zones[xi.zone.ABYSSEA_ULEGUERAND]
