-----------------------------------
-- Expiacion
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Tizona: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Blue Mage) quest.
-- Aligned with the Aqua Gorget, Snow Gorget & Soil Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Soil Belt.
-- Element: None
-- Modifiers: STR:30% INT:30%
-- 100%TP    200%TP    300%TP
-- 1.50      2.00      2.50
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskill_object = {}

weaponskill_object.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 1.5 params.ftp200 = 2 params.ftp300 = 2.5
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.3
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 3.75 params.ftp200 = 10.25 params.ftp300 = 12.5
        params.dex_wsc = 0.2
    end

    -- Apply Aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskill_object
