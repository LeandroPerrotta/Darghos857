local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- MARINA START --
function marinayarn(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
        if getPlayerItemCount(cid,5879) >= 10  then
        if doPlayerRemoveItem(cid,5879,10) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5886,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
        end
end
-- MARINA END --

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can trade 10 Giant Spider Silk's in Spool of Yarn"})

local node1 = keywordHandler:addKeyword({'yarn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want Spool of Yarn. Yes or no??'})
    node1:addChildKeyword({'yes'}, marinayarn, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the Giant Spider Silks.', reset = true})
npcHandler:addModule(FocusModule:new())
