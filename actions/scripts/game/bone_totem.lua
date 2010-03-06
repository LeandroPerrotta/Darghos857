function onUse(cid, item, frompos, item2, topos)

	if(isInArray(aid.ARIADNE_TOTEMS, item.actionid) == TRUE) then
	
		local totemId = table.find(aid.ARIADNE_TOTEMS, item.actionid)
	
		local hasBlessed = getPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[totemId])
		
		if(hasBlessed ~= -1) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já recebeu esta benção de Ghazran.")
			return TRUE
		end
		
		setPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[totemId], 1)
		
		local playerTotems = 0
		
		for key, value in ipairs(sid.ARIADNE_TOTEMS) do
		
			local totemStatus = getPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[key])
			
			if(totemStatus == 1) then
			
				playerTotems = playerTotems + 1
			end		
		end
			
		if(playerTotems < 12) then
				
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou uma das doze benções de Ghazran!")
		elseif(playerTotems == 12) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você conseguiu todas benções de Ghazran! Seu questlog foi atualizado!")
			setPlayerStorageValue(cid, QUESTLOG.ARIADNE.GHAZRAN_WING, 2)
		end

	end
end