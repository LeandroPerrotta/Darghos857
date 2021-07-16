function onUse(cid, item, fromPosition, itemEx, toPosition)
	

	if item.actionid == aid.GOROMA_STONE1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Now you need talk with the missioner again!")
		setPlayerStorageValue(cid, sid.GOROMA_STONE1,1)
	end
	
	
end
