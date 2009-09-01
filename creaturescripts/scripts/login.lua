	function onLogin(cid)
	--Register the kill/die event
	registerCreatureEvent(cid, "RemoveBlesses")
	registerCreatureEvent(cid, "Advance")	
	registerCreatureEvent(cid, "Stages")
	registerCreatureEvent(cid, "Inquisition")
	registerCreatureEvent(cid, "WarSystem")
	
	playerRecord()
	runPremiumSystem(cid)
	setRateStage(cid, getPlayerLevel(cid))
	setLoginSkillRateStages(cid)
	--checkItemShop(cid)

	if(isOfWar(cid) == TRUE)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Warning! Your guild is in war mode, and its very dangerous for you! Have a nice War MAN!")	
	end
	
	if(getPlayerVocation(cid) <= 4) then
		defineFirstItems(cid)	
	end
	
	--Remove blesses if necessary
	if getPlayerStorageValue(cid, STORAGE_REMOVE_BLESSES) == 1 then
		local i = 0
		while i < 5 do
			doPlayerRemoveBless(cid, i)
			i = i + 1
		end
		setPlayerStorageValue(cid, STORAGE_REMOVE_BLESSES, -1)
	end

	--Promotes player if necessary
	if(isPremium(cid) == TRUE) then
		if(getPlayerStorageValue(cid, STORAGE_PROMOTION) == 1) then
			if(getPlayerVocation(cid) <= 4) then
				doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
			end
			doPlayerRemoveSkillLossPercent(cid, 30)
			setPlayerStorageValue(cid, STORAGE_PROMOTION, -1)
		end
		return TRUE
	end

	--Player is not premium - remove premium privileges
	--Change outfit
	local lookType = 128
	if(getPlayerSex(cid) == 0) then
		lookType = 136
	end
	doCreatureChangeOutfit(cid, {lookType = lookType, lookHead = 78, lookBody = 69, lookLegs = 97, lookFeet = 95, lookAddons = 0})

	--Remove house
	local house = House.getHouseByOwner(cid)
	if(house) then
		house:setOwner(0) --Remove the house from the player, the server takes care of the rest
	end

	--Teleport to free town, change here
	--[[
	doPlayerSetTown(cid, Z)
	local masterFreePos = {x=100, y=100, z=7}
	doTeleportThing(cid, masterFreePos)
	]]-- Hoster's premium towns changes according to the map

	--Remove promotion
	local isPromo = (getPlayerVocation(cid) > 4)
	if(isPromo) then
		doPlayerSetVocation(cid, getPlayerVocation(cid)-4)
		doPlayerRemoveSkillLossPercent(cid, -30)
		setPlayerStorageValue(cid, STORAGE_PROMOTION, 1)
	end	
	return TRUE
end
