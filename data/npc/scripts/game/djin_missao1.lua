local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end



function Access(cid, message, keywords, parameters, node)
	
	local msg1 = "Ok, now you need to enter in the djinns place and complete the mission, talking with my brother!"
	local msg2 = "Wow! You have completed all missions! Now you can enter and talk with djinns of shop."
	
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	

		if getPlayerStorageValue(cid, sid.DJIN_QUEST_1) ~= 1 then
			npcHandler:say(msg1,cid)
			setPlayerStorageValue(cid, sid.DJIN_QUEST_2, 1)
		else
			npcHandler:say(msg2,cid)
		end
	
end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask with me about mission, and I take the mission for you."})


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want, to make the mission for me?'})
    node1:addChildKeyword({'yes'}, Access, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oaaa, I hate you.', reset = true})


npcHandler:addModule(FocusModule:new())
