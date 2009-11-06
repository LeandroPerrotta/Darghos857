local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        
        local travelNode1 = keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 50 gold. Agreed?'})
        	travelNode1:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=635, y=765, z=7}, msg = 'Okay. Enjoy!' })
        	travelNode1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
		local travelNode2 = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 50 gold. Agreed?'})
        	travelNode2:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=635, y=765, z=7}, msg = 'Okay. Enjoy!' })
        	travelNode2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
			local travelNode3 = keywordHandler:addKeyword({'trade quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 50 gold. Agreed?'})
        	travelNode3:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=635, y=765, z=7}, msg = 'Okay. Enjoy!' })
        	travelNode3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
			local travelNode3 = keywordHandler:addKeyword({'back'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 50 gold. Agreed?'})
        	travelNode3:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=635, y=765, z=7}, msg = 'Okay. Enjoy!' })
        	travelNode3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
npcHandler:addModule(FocusModule:new())