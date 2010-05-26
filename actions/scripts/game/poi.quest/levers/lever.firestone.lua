function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local stone = mcord.POI_FIRESTONE
	local getStone = getThingfromPos(stone)
	
	if item.actionid == aid.POI_FIRESTONE and item.itemid == 1945 and getStone.itemid == 1304 then
		doRemoveItem(getStone.uid,1)
	elseif item.actionid == aid.POI_FIRESTONE and item.itemid == 1946 then
		doCreateItem(1304,1,stone)
	end	
	
end
