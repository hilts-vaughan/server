-----------------------------------
-- Chains of Cowardice
--
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/monstertpmoves")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    local targets = mob:getEnmityList()
    for i, v in pairs(targets) do
        if (v.entity:isPC()) then
            local race = v.entity:getRace()
            if (race == xi.race.TARU_M or race == xi.race.TARU_F) and not v.entity:hasKeyItem(xi.ki.LIGHT_OF_HOLLA) then
                mob:showText(mob, ID.text.PROMATHIA_TEXT + 2)
                return 0
            end
        end
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.TERROR
    local power = 30
    local duration = 30

    if target:isPC() and ((target:getRace() == xi.race.TARU_M or target:getRace() == xi.race.TARU_F) and not target:hasKeyItem(xi.ki.LIGHT_OF_HOLLA)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration))
    else
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
    end

    return typeEffect
end

return mobskill_object
