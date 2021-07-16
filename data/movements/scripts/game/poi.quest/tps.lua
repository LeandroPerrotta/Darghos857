function onStepIn(cid, item, position, fromPosition)


	if item.actionid == aid.POI_MOVE_TP1 then
		doTeleportThing(cid, mcord.POI_MOVE_TP1GO)
	end
	
	if item.actionid == aid.POI_MOVE_TP2 then
		doTeleportThing(cid, mcord.POI_MOVE_TP2GO)
	end	

	if item.actionid == aid.POI_MOVE_TP3 then
		doTeleportThing(cid, mcord.POI_MOVE_TP3GO)
	end

	if item.actionid == aid.POI_MOVE_TP4 then
		doTeleportThing(cid, mcord.POI_MOVE_TP4GO)
	end

	if item.actionid == aid.POI_MOVE_TP5 then
		doTeleportThing(cid, mcord.POI_MOVE_TP5GO)
	end
	
	if item.actionid == aid.POI_MOVE_TP6 then
		doTeleportThing(cid, mcord.POI_MOVE_TP6GO)
	end	
	
	if item.actionid == aid.POI_MOVE_TP7 then
		doTeleportThing(cid, mcord.POI_MOVE_TP7GO)
	end	
	
	if item.actionid == aid.POI_MOVE_TP8 then
		doTeleportThing(cid, mcord.POI_MOVE_TP8GO)
	end	
	
	if item.actionid == aid.POI_MOVE_TP_ERRO then
		doTeleportThing(cid, mcord.POI_TP_ERROR)
	end	
	
	if item.actionid == aid.POI_DOWN_TO_CENTRAL then
		doTeleportThing(cid, mcord.POI_DOWN_TO_CENTRAL)
	end	
	
	
	if item.actionid == aid.POI_MWALL_GO then
		if(isPlayer(cid) == TRUE) then
			if getPlayerItemCount(cid, 1970) >= 1 then
				doTeleportThing(cid, getThingPos(uid.POI_MWALL_BACK))
				doSendMagicEffect(getPlayerPosition(cid), 5)
			else
				doTeleportThing(cid, getThingPos(uid.POI_MWALL_GO))
				doSendMagicEffect(getPlayerPosition(cid), 14)
			end
		end
	end
	
	if item.actionid == aid.POI_MWALL_BACK then
		if(isPlayer(cid) == TRUE) then
			doTeleportThing(cid, getThingPos(uid.POI_MWALL_GO))
			doSendMagicEffect(getPlayerPosition(cid), 14)
		end
	end
end
