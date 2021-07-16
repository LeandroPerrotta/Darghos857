function onUse(cid, item, frompos, item2, topos)		
		
		if item.actionid == aid.BS_QUEST_MINT then
			queststatus = getPlayerStorageValue(cid,sid.BS_QUEST_MINT)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1987,1)
				doAddContainerItem(box,2407,1)
				doAddContainerItem(box,2156,1)
				setPlayerStorageValue(cid,sid.BS_QUEST_MINT,1)
				if os.time() > timer_actions.time1 or timer_actions.time1 == 0 then		
					timer_actions.time1 = os.time() + 60*5
					monster = {name = "Minotaur Guard", countMin = 12, countMax = 20}
					monster2 = {name = "Minotaur Archer", countMin = 8, countMax = 14}
					monster3 = {name = "Minotaur Mage", countMin = 4, countMax = 8}
					radius = 7	
					centerPos = {x=1900, y=1876, z=12}

					doMakeRespawn(monster, centerPos, radius)
					doMakeRespawn(monster2, centerPos, radius)	
					doMakeRespawn(monster3, centerPos, radius)		
					
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The proteced cell has been open! Guards remove the intruders!")
				end
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end					
		end	
end