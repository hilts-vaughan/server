-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Kipopo
-- Type: Leathercraft Synthesis Image Support
-- !pos -191.050 -2.15 12.285 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/crafting")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:hasKeyItem(xi.ki.TORN_PATCHES_OF_LEATHER)
        and player:getCharVar("sayItWithAHandbagCS") == 2
        and npcUtil.tradeHasExactly(trade, {2012, 850, 816})
    then
        player:startEvent(910)
    end
end

entity.onTrigger = function(player, npc)
    local sayItWithAHandbagCS = player:getCharVar("sayItWithAHandbagCS")
    local SkillCap = getCraftSkillCap(player, xi.skill.LEATHERCRAFT)
    local SkillLevel = player:getSkillLevel(xi.skill.LEATHERCRAFT)

    if
        player:getQuestStatus(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG) == QUEST_COMPLETED
        and player:getCharVar("sayItWithAHandbagBonusCS") == 1
    then
        player:startEvent(914)
    elseif player:hasKeyItem(xi.ki.REPAIRED_HANDBAG) and sayItWithAHandbagCS == 4 then
        player:startEvent(913)
    elseif sayItWithAHandbagCS == 3 then
        if player:needToZone() then
            player:startEvent(911)
        else
            player:startEvent(912)
        end
    elseif sayItWithAHandbagCS == 2 then
        player:startEvent(909)
    elseif player:hasKeyItem(xi.ki.TORN_PATCHES_OF_LEATHER) and sayItWithAHandbagCS == 1 then
        player:startEvent(908)
    elseif isGuildMember(player, 7) == 1 then
        if not player:hasStatusEffect(xi.effect.LEATHERCRAFT_IMAGERY) then
            player:startEvent(651, SkillCap, SkillLevel, 1, 239, player:getGil(), 0, 0, 0)
        else
            player:startEvent(651, SkillCap, SkillLevel, 1, 239, player:getGil(), 7128, 0, 0)
        end
    else
        player:startEvent(651) -- Standard Dialogue
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 914 then
        player:setCharVar("sayItWithAHandbagBonusCS", 0)
    elseif csid == 912 then
        npcUtil.giveKeyItem(player, xi.ki.REPAIRED_HANDBAG)
        player:setCharVar("sayItWithAHandbagCS", 4)
    elseif csid == 910 then
        player:delKeyItem(xi.ki.TORN_PATCHES_OF_LEATHER)
        player:setCharVar("sayItWithAHandbagCS", 3)
        player:needToZone(true)
        player:confirmTrade()
    elseif csid == 908 and option == 1 then
        player:setCharVar("sayItWithAHandbagCS", 2)
    elseif csid == 651 and option == 1 then
        player:messageSpecial(ID.text.LEATHER_SUPPORT, 0, 5, 1)
        player:addStatusEffect(xi.effect.LEATHERCRAFT_IMAGERY, 1, 0, 120)
    end
end

return entity
