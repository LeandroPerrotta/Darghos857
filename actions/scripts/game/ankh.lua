function onUse(cid, item, frompos, item2, topos)

	-- Divine Ankh Configurations
	local _divineAnkhCorpses = {6006, 5976}
	local DARK_ESSENCE_ID = 10563

	if(item.actionid == aid.DIVINE_ANKH) then
	
		if(isInArray(_divineAnkhCorpses, item2.itemid)) then
		
			if (math.random(1, 10) <= 4) then
			
				doPlayerAddItem(cid, DARK_ESSENCE_ID, 1)
				doSendMagicEffect(getThingPos(item2.uid), CONST_ME_HOLYAREA)
				
			else
			
				doSummonCreature("vampirequest", getThingPos(item2.uid))
				doSendMagicEffect(getThingPos(item2.uid), CONST_ME_BLOCKHIT)		
			end
			
			doTransformItem(item2.uid, item2.itemid + 1)
			doDecayItem(item2.uid)			
		end
	end
end