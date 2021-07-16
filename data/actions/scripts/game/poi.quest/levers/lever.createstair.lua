function onUse(cid, item, fromPosition, itemEx, toPosition)

	local stair = mcord.POI_STAIR_CREATE
	local getStair = getThingfromPos(stair)
	
	if item.actionid == aid.POI_CREATE_STAIR and item.itemid == 1945 then
		doCreateItem(1386,1,stair)
	end



end
