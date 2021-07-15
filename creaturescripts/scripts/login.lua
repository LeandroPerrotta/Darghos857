	function onLogin(cid)
	--Register the kill/die event
	registerCreatureEvent(cid, "RemoveBlesses")
	registerCreatureEvent(cid, "CreatureDie")
	registerCreatureEvent(cid, "Advance")	
	registerCreatureEvent(cid, "Stages")
	registerCreatureEvent(cid, "Inquisition")
	registerCreatureEvent(cid, "Combat")
	
	--if(tasks.hasStartedTask(cid)) then
		registerCreatureEvent(cid, "Tasks")
	--end
	
	playerRecord()
	runPremiumSystem(cid)
	setRateStage(cid, getPlayerLevel(cid))
	setLoginSkillRateStages(cid)
	checkItemShop(cid)
	OnKillCreatureMission(cid)
	Dungeons.onLogin(cid)
	--defineFirstItems(cid)

	if(getPlayerAccess(cid) == groups.GOD) then
		addAllOufits(cid)
	end
	
	setPlayerStorageValue(cid, sid.TRAINING_SHIELD, 0)
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, -1)
	
	--Give basic itens after death
	if getPlayerStorageValue(cid, sid.GIVE_ITEMS_AFTER_DEATH) == 1 then
		if getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid == 0 then
			local item_backpack = doCreateItemEx(1988, 1) -- backpack
			
			doAddContainerItem(item_backpack, 2120, 1) -- rope
			doAddContainerItem(item_backpack, 2554, 1) -- shovel
			doAddContainerItem(item_backpack, 2666, 4) -- meat
			doAddContainerItem(item_backpack, 11754, 1) -- teleport rune
			
			doPlayerAddItemEx(cid, item_backpack, FALSE, CONST_SLOT_BACKPACK)
		end
		setPlayerStorageValue(cid, sid.GIVE_ITEMS_AFTER_DEATH, -1)
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
	--if(isPremium(cid) == TRUE) then
		if(getPlayerStorageValue(cid, STORAGE_PROMOTION) == 1 and getPlayerVocation(cid) <= 4) then
			doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
			doPlayerRemoveSkillLossPercent(cid, 30)
			setPlayerStorageValue(cid, STORAGE_PROMOTION, -1)
		end
		
		if(getPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT) == 1) then
			setPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT, -1)
		end
		--return TRUE
	--end

	--Player is not premium - remove premium privileges
	--Change outfit
	--[[ if(getPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT) == -1) then
		local lookType = 128
		if(getPlayerSex(cid) == 0) then
			lookType = 136
		end
		doCreatureChangeOutfit(cid, {lookType = lookType, lookHead = 78, lookBody = 69, lookLegs = 97, lookFeet = 95, lookAddons = 0})
		setPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT, 1)
	end ]]--

	--Remove house
	--[[ local house = House.getHouseByOwner(cid)
	if(house) then
		house:setOwner(0) --Remove the house from the player, the server takes care of the rest
	end ]]--

	--Teleport to free town, change here
	--[[
	doPlayerSetTown(cid, Z)
	local masterFreePos = {x=100, y=100, z=7}
	doTeleportThing(cid, masterFreePos)
	]]-- Hoster's premium towns changes according to the map

	--Remove promotion
	--[[ local isPromo = (getPlayerVocation(cid) > 4)
	if(isPromo) then
		doPlayerSetVocation(cid, getPlayerVocation(cid)-4)
		if(getPlayerStorageValue(cid, sid.REBORN_FIRST) == 1) then
			doPlayerSetVocation(cid, getPlayerVocation(cid)-4)
		end
		doPlayerRemoveSkillLossPercent(cid, -30)
		setPlayerStorageValue(cid, STORAGE_PROMOTION, 1)
	end	]]--
	return TRUE
end
