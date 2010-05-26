a = 0

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local stone = mcord.POI_STONE_ENTER
	local getStone = getThingfromPos(stone)
	
	if item.actionid == aid.POI_LEVER_ENTER and item.itemid == 1945 and getStone.itemid == 1304 then
		doRemoveItem(getStone.uid,1)
		a=0
		addEvent(timer, 60*1000)
		local position = getCreaturePosition(cid)
		local i = 0
		while i <= 60 do
			doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, 10)
			i = i + 1
		end		

		doTransformItem(item.uid, 1946)
		
	elseif item.actionid == aid.POI_LEVER_ENTER and item.itemid == 1946 and getStone.itemid == 0 then
		if a == 1 then
			doCreateItem(1304,1,stone)
			doTransformItem(item.uid, 1945)	
		else
			doPlayerSendCancel(cid, "You need wait 60 seconds for create the stone again.")
		end
	end	
	
	return TRUE
end

function timer()
	a = 1
end

