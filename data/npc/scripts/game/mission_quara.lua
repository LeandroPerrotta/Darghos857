local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end



function Access(cid, message, keywords, parameters, node)

	local msg1 = "Ok, in this mission, you need go to the Life Stone, its far south-east from here, and use the helmet in the stone. Than, you need return here!"
	local msg2 = "Woww! Very thanks man. Now you have the access for goroma island. Have a good hunts!"
	local itemid = 3970
	
    if(not npcHandler:isFocused(cid)) then
        return false
    end


		if getPlayerStorageValue(cid, sid.GOROMA_STONE1) ~= 1 then
			npcHandler:say(msg1,cid)
			doPlayerAddItem(cid, itemid,1)
		else
			npcHandler:say(msg2,cid)
			setPlayerStorageValue(cid, sid.GOROMA_ENTER,1)
		end

end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask with me about mission, and I take the mission for you."})


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want, to make the mission for me?'})
    node1:addChildKeyword({'yes'}, Access, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oaaa, I hate you.', reset = true})


npcHandler:addModule(FocusModule:new())
