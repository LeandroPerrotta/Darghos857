function onStepIn(cid, item, position, fromPosition)

	if item.actionid == aid.BANSHEE_FIRST then
		if getPlayerStorageValue(cid, sid.BANSHEE_FIRST) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_FIRST, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Queenary Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Queenary Mission.')
		end
	-- Banshee Quest | 2 --
	elseif item.actionid == aid.BANSHEE_SECOND then
		if getPlayerStorageValue(cid, sid.BANSHEE_SECOND) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_SECOND, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Rysion Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Rysion Mission.')
		end
	-- Banshee Quest | 3 --
	elseif item.actionid == aid.BANSHEE_THIRD then
		if getPlayerStorageValue(cid, sid.BANSHEE_THIRD) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_THIRD, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Stalazan Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Stalazan Mission.')
		end
	-- Banshee Quest | 4 --
	elseif item.actionid == aid.BANSHEE_FOUR then
		if getPlayerStorageValue(cid, sid.BANSHEE_FOUR) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_FOUR, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Saintly Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Saintly Mission.')
		end
	-- Banshee Quest | 5 --
	elseif item.actionid == aid.BANSHEE_FIVE then
		if getPlayerStorageValue(cid, sid.BANSHEE_FIVE) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_FIVE, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Khazus Banshee Quest.')
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Khazus Mission.')
		end
	-- Banshee Quest | 6 --
	elseif item.actionid == aid.BANSHEE_SIX then
		if getPlayerStorageValue(cid, sid.BANSHEE_SIX) == -1 then
			setPlayerStorageValue(cid, sid.BANSHEE_SIX, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Rhamoa Banshee Quest.')
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)
		else	
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Rhamoa Mission.')
		end	
	elseif item.actionid == aid.BANSHEE_SEALFORPASS then
		local seal = {x=2599 ,y=1682 ,z=11 ,stackpos=1}
		local getSeal = getThingfromPos(seal)
		local newpos = {x=2597 ,y=1680 ,z=11}
		
		if getSeal.itemid == 2144 then
			doTeleportThing(cid,newpos)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_ENERGYHIT)
			doSendMagicEffect(newpos, CONST_ME_TELEPORT)
		else
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_PUFF)
		end
		
	end

	return TRUE
end
