-----------------------------------
-- Trust: Aldo
-----------------------------------
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, 1007)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end


return spell_object
