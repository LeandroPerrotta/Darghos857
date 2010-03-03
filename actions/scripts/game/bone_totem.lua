function onUse(cid, item, frompos, item2, topos)

	if(isInArray(aid.ARIADNE_TOTEMS, item.actionid) == TRUE) then
	
		local totemId = table.find(aid.ARIADNE_TOTEMS, item.actionid)
	
		local hasBlessed = getPlayerStorageValue(cid, sid.ARIADNE_TOTEMS[totemId])
		
		if(hasBlessed ~= -1) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já mecheu aqui.")
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
				
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você conseguiu um pouco de coragem!")
		elseif(playerTotems == 12) then
		
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você conseguiu toda coragem necessária!")
		end

	end
end