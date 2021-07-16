function onSay(cid, words, param)

	 local stonePOS 	= {x= 2052 ,y= 2025 ,z= 7, stackpos= STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE}
	 local stoneID  	= 1304
	 local message 	= "Its true, gooooo enter in mols!"
	 local passTime	= 120
	 local maxdist = 3
	 local playerpos = getCreaturePosition(cid)
	
	if  math.max(math.abs(playerpos.x-stonePOS.x), math.abs(playerpos.y-stonePOS.y)) < maxdist then
		stone = getThingfromPos(stonePOS)
		doRemoveItem(stone.uid,1)
		doPlayerSendTextMessage(cid, 25, message)
		addEvent(createStone, (1000*passTime))
	else
		doSendMagicEffect(playerpos,11)
	end

	return TRUE
end

function createStone()
	local stonePOS 	= {x=2052 ,y=2025 ,z=7, stackpos=1}
	local stone = getThingfromPos(stonePOS)
	if stone.id == 1304 then
		doCreateItem(1304,1,stonePOS)
	end
end