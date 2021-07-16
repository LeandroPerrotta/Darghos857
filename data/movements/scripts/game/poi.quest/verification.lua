function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) == TRUE) then
		if item.actionid == aid.POI_VERIFY_1 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_1) == 1 then
				return TRUE
			else
				local pos = getPlayerPosition(cid)
				local newpos = {x= pos.x, y=pos.y+1, z= pos.z}
				
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Ashfalors throne, for stay on energy!')
			end
		end
		
		if item.actionid == aid.POI_VERIFY_2 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_2) == 1 then
				return TRUE
			else
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Pumin throne, for stay on energy!')
			end
		end	
		
		if item.actionid == aid.POI_VERIFY_3 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_3) == 1 then
				return TRUE
			else
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Apocalypses throne, for stay on energy!')
			end
		end

		if item.actionid == aid.POI_VERIFY_4 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_4) == 1 then
				return TRUE
			else
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Tafariels throne, for stay on energy!')
			end
		end
		
		if item.actionid == aid.POI_VERIFY_5 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_5) == 1 then
				return TRUE
			else
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Infernatils throne, for stay on energy!')
			end
		end

		if item.actionid == aid.POI_VERIFY_6 then
			if getPlayerStorageValue(cid, sid.POI_TRONE_6) == 1 then
				return TRUE
			else
				doTeleportThing(cid, mcord.POI_AFTER_ENERGYS)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You need pass in Verminors throne, for stay on energy!')
			end
		end
	end
end
