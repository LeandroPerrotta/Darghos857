function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) == TRUE) then	
		if(item.uid == uid.INQ_TP_USHURIEL_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_USHURIEL) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_USHURIEL,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Ushuriel successfully. Now you have access to teleport here.")
			end
		elseif(item.uid == uid.INQ_TP_ZUGUROSH_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_ZUGUROSH) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_ZUGUROSH,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Zugorosh successfully. Now you have access to teleport here.")
			end	
		elseif(item.uid == uid.INQ_TP_MADARETH_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_MADARETH) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_MADARETH,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Madareth successfully. Now you have access to teleport here.")
			end	
		elseif(item.uid == uid.INQ_TP_LATRIVAN_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_LATRIVAN) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_LATRIVAN,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Latrivan successfully. Now you have access to teleport here.")
			end	
		elseif(item.uid == uid.INQ_TP_ANIHILION_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_ANIHILION) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_ANIHILION,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Annihilon successfully. Now you have access to teleport here.")
			end	
		elseif(item.uid == uid.INQ_TP_HELLGORAK_TO) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_HELLGORAK) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_HELLGORAK,1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You completed the room of Hellgorak successfully. Now you have access to teleport here.")
			end
		end
		
		
		if(item.actionid == aid.INQ_HALL_USHURIEL) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_USHURIEL) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_USHURIEL_TO))
			end
		elseif(item.actionid == aid.INQ_HALL_ZUGUROSH) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_ZUGUROSH) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_ZUGUROSH_TO))
			end
		elseif(item.actionid == aid.INQ_HALL_MADARETH) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_MADARETH) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_MADARETH_TO))
			end
		elseif(item.actionid == aid.INQ_HALL_LATRIVAN) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_LATRIVAN) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_LATRIVAN_TO))
			end
		elseif(item.actionid == aid.INQ_HALL_ANIHILION) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_ANIHILION) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_ANIHILION_TO))
			end
		elseif(item.actionid == aid.INQ_HALL_HELLGORAK) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_HELLGORAK) == 1) then
				doTeleportThing(cid, getThingPos(uid.INQ_TP_HELLGORAK_TO))
			end
		end	
			
		if(item.uid == uid.INQ_TO_REWARDS) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_OUTFIT) ~= 1) then
				setPlayerStorageValue(cid, sid.INQ_DONE_OUTFIT,1)
				canPlayerWearOutfit(cid, 288, 3)
				canPlayerWearOutfit(cid, 289, 3)
				doPlayerAddOutfit(cid, 288,1)
				doPlayerAddOutfit(cid, 289,1)
				doPlayerAddOutfit(cid, 288,2)
				doPlayerAddOutfit(cid, 289,2)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Now you can wear the Demonhunter outfit with all addons! Congratulations!")
				doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			end
		end
	end
end
