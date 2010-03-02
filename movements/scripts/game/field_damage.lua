function onStepIn(cid, item, position, fromPosition)

	if(item.actionid > ACTION_ID_RANGES.MIN_FIELD_DAMAGE and item.actionid < ACTION_ID_RANGES.MAX_FIELD_DAMAGE) then
	
		local needDamagePlayer = getPlayerStorageValue(cid, item.actionid)
		
		if(needDamagePlayer <= 0) then
			
			local damage = item.actionid - ACTION_ID_RANGES.MIN_FIELD_DAMAGE
			
			if(damage == 0) then
				doPlayerAddHealth(cid, -250)
			elseif(damage == 1) then
				doPlayerAddHealth(cid, -600)	
			elseif(damage == 2) then
				doPlayerAddHealth(cid, -1400)	
			elseif(damage == 3) then
				doPlayerAddHealth(cid, -2800)	
			elseif(damage == 4) then
				doPlayerAddHealth(cid, -5500)	
			elseif(damage >= 5) then
				doPlayerAddHealth(cid, -12500)	
			end			
		end
	end
	
	return TRUE
end
