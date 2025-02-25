-----------------------------------
-- ID: 18581
-- Item: Carbuncle's Pole
-- Item Effect: Restores 160-220 HP
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 15

    if (chance > math.random(0, 99)) then
        local dmg = math.random(50, 90)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, xi.magic.ele.LIGHT, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, xi.magic.ele.LIGHT, 0)
        dmg = adjustForTarget(target, dmg, xi.magic.ele.LIGHT)
        dmg = finalMagicNonSpellAdjustments(player, target, xi.magic.ele.LIGHT, dmg)

        local message = xi.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = xi.msg.basic.ADD_EFFECT_HEAL
        end

        return xi.subEffect.LIGHT_DAMAGE, message, dmg
    else
        return 0, 0, 0
    end
end

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    local hpHeal = math.random(160, 220)
    local dif = target:getMaxHP() - target:getHP()
    if (hpHeal > dif) then
        hpHeal = dif
    end
    target:addHP(hpHeal)
    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, hpHeal)
end

return item_object
