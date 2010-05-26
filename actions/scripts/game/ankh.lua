function onUse(cid, item, frompos, item2, topos)

	-- Divine Ankh Configurations
	local _vampireCorpses = {6006, 2956}
	local _ghoulCorpses = {5976, 3113}

	local courseChurch = getPlayerStorageValue(cid, QUESTLOG.DIVINE_ANKH.COURSE_CHURCH)

	if(courseChurch == 2) then
	
		local creatureToSummon = ""
	
		if(isInArray(_vampireCorpses, item2.itemid) == TRUE) then
		
			creatureToSummon = "Reborn Vampire"				
		elseif(isInArray(_ghoulCorpses, item2.itemid) == TRUE) then
		
			creatureToSummon = "Reborn Ghoul"
		else
		
			return TRUE
		end
		
		if (math.random(1, 10) <= 4) then
		
			doPlayerAddItem(cid, CUSTOM_ITEMS.DARK_DUST, 1)
			doSendMagicEffect(getThingPos(item2.uid), CONST_ME_HOLYAREA)
			doPlayerSay(cid, "Esta pobre alma agora encontrou a luz!", TALKTYPE_ORANGE_1)
			doRemoveItem(item2.uid)
			
		else
		
			doSummonCreature(creatureToSummon, getThingPos(item2.uid))
			doSendMagicEffect(getThingPos(item2.uid), CONST_ME_MORTAREA)		
			doRemoveItem(item2.uid)
		end		
	end
end