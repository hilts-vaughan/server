-----------------------------------
-- Trust: Trion
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------
local spell_object = {}

local message_page_offset = 9

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, message_page_offset, {
        [xi.magic.spell.CURILLA] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.RAHAL] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.HALVER] = xi.trust.message_offset.TEAMWORK_3,
    })

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75,
                        ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DEATH)
end

return spell_object
