function onDeath(cid, lastHitKiller, mostDamageKiller)

	if(isPlayer(cid) == TRUE) then
	
		local killerName = "field item"
		local damageKillerName = ""
	
		if(lastHitKiller ~= FALSE) then
		
			if(isPlayer(lastHitKiller) == TRUE) then
				killerName = getPlayerGUID(lastHitKiller)
			else
				killerName = getCreatureName(lastHitKiller)
			end	
			
			if(mostDamageKiller ~= FALSE and getCreatureName(mostDamageKiller) ~= getCreatureName(lastHitKiller)) then
			
				if(isPlayer(mostDamageKiller) == TRUE) then
					damageKillerName = getPlayerGUID(mostDamageKiller)
				else
					damageKillerName = getCreatureName(mostDamageKiller)
				end					
			end
		end	
		
		writeDeath(getPlayerGUID(cid), getPlayerLevel(cid), os.time(), killerName, damageKillerName)
	end	

	return TRUE
end 