function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local stone = {x=3016 ,y=1438 ,z=14 ,stackpos=1}
	local getStone = getThingfromPos(stone)
	
	if item.actionid == aid.DH_ALAVANCA and item.itemid == 1945 and getStone.itemid == 1304 then
		doRemoveItem(getStone.uid,1)
	elseif item.actionid == aid.DH_ALAVANCA and item.itemid == 1946 then
		doCreateItem(1304,1,stone)
	end	
	
	return TRUE
end
