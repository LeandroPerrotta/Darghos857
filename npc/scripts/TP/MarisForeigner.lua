local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        
        local travelNode = keywordHandler:addKeyword({'mistrock'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do I look like a ferryman?! Well... if I think about it, I could use some sailing practice. I can bring you to Mistrock for 100 gold. Agreed?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=446, y=847, z=7}, msg = 'Set the sails!' })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
        
		local travelNode2 = keywordHandler:addKeyword({'fenrock'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do I look like a ferryman?! Well... if I think about it, I could use some sailing practice. I can bring you to Fenrock for 100 gold. Agreed?'})
        	travelNode2:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=327, y=747, z=7}, msg = 'Set the sails!' })
        	travelNode2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
        keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are two small islands west of Yalahar. I\'m not sure if they have an official name but the people call the bigger one \'Mistrock\' and the other one \'Fenrock\'.'})
		keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are two small islands west of Yalahar. I\'m not sure if they have an official name but the people call the bigger one \'Mistrock\' and the other one \'Fenrock\'.'})
		keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are two small islands west of Yalahar. I\'m not sure if they have an official name but the people call the bigger one \'Mistrock\' and the other one \'Fenrock\'.'})
		keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are two small islands west of Yalahar. I\'m not sure if they have an official name but the people call the bigger one \'Mistrock\' and the other one \'Fenrock\'.'})

npcHandler:addModule(FocusModule:new())