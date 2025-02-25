-----------------------------------
--  Malevolent Blessing
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local typeEffect = xi.effect.CURSE_I

    MobStatusEffectMove(mob, target, typeEffect, 35, 0, 45)

    local dmgmod = 1.25
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, xi.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end

return mobskill_object
