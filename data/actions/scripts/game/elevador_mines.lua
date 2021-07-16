function onUse(cid, item, frompos, item2, topos)

	-- theID da alavanca
	theID = 7000

	firstFloor = aid.MINES_TP_1
	thirdFloor = aid.MINES_TP_2
	
	elevadorPos = aid.MINES_TP_CREATE

	if item.actionid == theID and item.itemid == 1945 then
		doRemoveItem(getThingfromPos(elevadorPos).uid)
		doCreateTeleport(1387,firstFloor,elevadorPos)
		doTransformItem(item.uid,item.itemid+1)
		doPlayerSendTextMessage(cid,22,'Agora o elevador irá subir.')
	elseif item.actionid == theID and item.itemid == 1946 then
		doRemoveItem(getThingfromPos(elevadorPos).uid)
		doCreateTeleport(1387,thirdFloor,elevadorPos)
		doTransformItem(item.uid,item.itemid-1)
		doPlayerSendTextMessage(cid,22,'Agora o elevador irá descer.')
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
	
	return TRUE
end 