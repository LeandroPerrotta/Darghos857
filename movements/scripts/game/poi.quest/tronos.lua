function onStepIn(cid, item, position, fromPosition)

	--@ Ashfalors Throne
	if item.actionid == aid.POI_TRONE1 then
		if getPlayerStorageValue(cid,cid,sid.POI_TRONE_1) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_1,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Ashfalors throne and absorbed sobe of his sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end
	
	--@ Pumin Throne
	if item.actionid == aid.POI_TRONE2 then
		if getPlayerStorageValue(cid,sid.POI_TRONE_2) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_2,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Pumins throne and absorbed sobe of his sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end	
	
	--@ Apocalypses Throne
	if item.actionid == aid.POI_TRONE3 then
		if getPlayerStorageValue(cid,sid.POI_TRONE_3) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_3,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Apocalypses throne and absorbed sobe of his sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end		
	
	--@ Tafariels Throne
	if item.actionid == aid.POI_TRONE4 then
		if getPlayerStorageValue(cid,sid.POI_TRONE_4) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_4,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Tafariels throne and absorbed sobe of her sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end	
	
	--@ Infernatils Throne
	if item.actionid == aid.POI_TRONE5 then
		if getPlayerStorageValue(cid,sid.POI_TRONE_5) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_5,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Infernatils throne and absorbed sobe of his sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end		
	
	--@ Verminor Throne
	if item.actionid == aid.POI_TRONE6 then
		if getPlayerStorageValue(cid,sid.POI_TRONE_6) ~= 1 then
			setPlayerStorageValue(cid, sid.POI_TRONE_6,1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have touched Verminors throne and absorbed sobe of his sprit')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already have touched this throne.')			
		end
	end		
	
	
	
end


