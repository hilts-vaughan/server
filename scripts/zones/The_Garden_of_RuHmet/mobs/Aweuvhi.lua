-----------------------------------
-- Area: The Garden of Ru'Hmet
--  Mob: Aw'euvhi
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- Set a random animation when it spawns
    mob:setAnimationSub(math.random(1, 4))
end

entity.onMobFight = function(mob)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed
    -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi
    -- ..when attacked will change states every minute or so..
    local randomTime = math.random(50, 75)
    local changeTime = mob:getLocalVar("changeTime")

    if (mob:getBattleTime() - changeTime > randomTime) then
        if (mob:getAnimationSub() == 2) then
            mob:setAnimationSub(1)
        else
            mob:setAnimationSub(2)
        end
        mob:setLocalVar("changeTime", mob:getBattleTime())

        -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi
        -- When in an open state, damage taken by the Euvhi is doubled. Inflicting a large amount of damage to an Euvhi in an open state will cause it to close.
        -- Make everything do double
        if (mob:getAnimationSub() == 2) then
            mob:setMod(xi.mod.HTHRES, 2000)
            mob:setMod(xi.mod.SLASHRES, 2000)
            mob:setMod(xi.mod.PIERCERES, 2000)
            mob:setMod(xi.mod.IMPACTRES, 2000)
            for n =1, #xi.magic.resistMod, 1 do
                mob:setMod(xi.magic.resistMod[n], 2000)
            end
            for n =1, #xi.magic.defenseMod, 1 do
                mob:setMod(xi.magic.defenseMod[n], -1000)
            end
        else -- Reset all damage types
            mob:setMod(xi.mod.HTHRES, 1000)
            mob:setMod(xi.mod.SLASHRES, 1000)
            mob:setMod(xi.mod.PIERCERES, 1000)
            mob:setMod(xi.mod.IMPACTRES, 1000)
            for n =1, #xi.magic.resistMod, 1 do
                mob:setMod(xi.magic.resistMod[n], 1000)
            end
            for n =1, #xi.magic.defenseMod, 1 do
                mob:setMod(xi.magic.defenseMod[n], 1000)
            end
        end
    end
end

entity.onCriticalHit = function(target)
    -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi
    -- When in an open state, damage taken by the Euvhi is doubled. Inflicting a large amount of damage to an Euvhi in an open state will cause it to close.
    -- Crit is really the only thing we can do.
    if (target:getAnimationSub() == 2) then
        target:setAnimationSub(0)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
