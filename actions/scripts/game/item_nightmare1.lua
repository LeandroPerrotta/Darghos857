function onUse(cid, item, fromPosition, itemEx, toPosition)
	

	if getPlayerStorageValue(cid, sid.FIRST_NIGHTMARE) ~= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations, now you have the first nightmare addon!")
		setPlayerStorageValue(cid, sid.FIRST_NIGHTMARE,1)
		doPlayerAddOutfit(cid, 269,1)
		doPlayerAddOutfit(cid, 268,1)
		sendEnvolveEffect(cid, 11)
		doRemoveItem(item.uid, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have the first nightmare addon!")		
	end
	
	
end
