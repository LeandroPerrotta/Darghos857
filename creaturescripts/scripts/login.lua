	function onLogin(cid)
	--Register the kill/die event
	registerCreatureEvent(cid, "AutoBan")
	registerCreatureEvent(cid, "RemoveBlesses")
	registerCreatureEvent(cid, "Advance")	
	registerCreatureEvent(cid, "Stages")
	
	runPremiumSystem(cid)
	setRateStage(cid, getPlayerLevel(cid))
	checkItemShop(cid)
	
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