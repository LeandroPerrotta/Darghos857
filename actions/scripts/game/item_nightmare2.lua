function onUse(cid, item, fromPosition, itemEx, toPosition)
	

	if getPlayerStorageValue(cid, sid.SECOND_NIGHTMARE) ~= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations, now you have the second nightmare addon!")
		setPlayerStorageValue(cid, sid.SECOND_NIGHTMARE,1)
		doPlayerAddOutfit(cid, 269,2)
		doPlayerAddOutfit(cid, 268,2)
		sendEnvolveEffect(cid, 11)
		doRemoveItem(item.uid, 1)		
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have the second nightmare addon!")		
	end
	
	
end
