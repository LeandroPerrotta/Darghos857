function onUse(cid, item, frompos, item2, topos)

	if(isInArray(aid.ARIADNE_TOTEMS, item.actionid) == TRUE) then
	
		local totemId = table.find(aid.ARIADNE_TOTEMS, item.actionid)
	
		local hasBlessed = getPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[totemId])
		
		if(hasBlessed ~= -1) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� j� recebeu esta ben��o de Ghazran.")
			return TRUE
		end
		
		local playerTotems = 0
		
		for key, value in ipairs(sid.ARIADNE_TOTEMS) do
		
			local totemStatus = getPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[key])
			
			if(totemStatus == 1) then
			
				playerTotems = playerTotems + 1
			end		
		end
		
		setPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[totemId], 1)
		
		if(playerTotems < 12) then
				
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� ganhou uma das doze ben��es de Ghazran!")
		elseif(playerTotems == 12) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� conseguiu todas ben��es de Ghazran!")
		end

	end
end