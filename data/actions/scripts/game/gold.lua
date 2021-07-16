function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	
	if(item.itemid == ITEM_GOLD_COIN) and (item.type == 100) then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 1)
		doSendAnimatedText(fromPosition, "$$$", TEXTCOLOR_LIGHTBLUE)
	end		

	if(item.itemid == ITEM_PLATINUM_COIN) and (item.type == 100) then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, 1)
		doSendAnimatedText(fromPosition, "$$$", TEXTCOLOR_LIGHTBLUE)
	end	

	if(item.itemid == ITEM_PLATINUM_COIN) and (item.type < 100) then
		doChangeTypeItem(item.uid, item.type -1)
		doPlayerAddItem(cid, ITEM_GOLD_COIN, 100)
		doSendAnimatedText(fromPosition, "$$$", TEXTCOLOR_LIGHTBLUE)
	end		
	
	if(item.itemid == ITEM_CRYSTAL_COIN) then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 100)
		doSendAnimatedText(fromPosition, "$$$", TEXTCOLOR_LIGHTBLUE)
	end	
end
