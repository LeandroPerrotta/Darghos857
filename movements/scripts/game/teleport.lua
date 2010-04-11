function onStepIn(cid, item, position, fromPosition)

	if(item.actionid >= 30020 and item.actionid < 30100) then
	
		local city = getTownNameById(item.actionid - 30020)
		doPlayerSetTown(cid, item.actionid - 30020)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT,"Now you are a citizen of "..city..".")
		
		return TRUE
	end
	
	if(item.actionid == aid.CHURCH_PORTAL) then
	
		local chamberTemptation = getPlayerStorageValue(cid, QUESTLOG.DIVINE_ANKH.CHAMBER_TEMPTATION)
	
		if(chamberTemptation ~= 3) then
		
			doPlayerSendCancel(cid, "Você não pode passar por aqui.")
			
			local destPos = position
			
			destPos.y = destPos.y + 5
			
			doTeleportThing(cid, destPos)
			doSendMagicEffect(destPos, CONST_ME_MAGIC_BLUE)			
		end
	end
	
	return TRUE
end
