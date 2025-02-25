-----------------------------------
-- ID: 19160
-- Item: Estramacon
-- Additional Effect: TP Drain
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 5

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local TpDrain = math.random(10, 30)

        if (TpDrain > target:getTP()) then
            TpDrain = target:getTP()
        end

        target:addTP(-TpDrain)
        player:addTP(TpDrain)

        return xi.subEffect.TP_DRAIN, xi.msg.basic.ADD_EFFECT_TP_DRAIN, TpDrain
    end
end

return item_object
