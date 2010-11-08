function onAdvance(cid, type, oldlevel, newlevel)
		
	if(type == LEVEL_EXPERIENCE) then
	
		setRateStage(cid, newlevel)
	elseif(type == LEVEL_MAGIC) then
	
		if(getPlayerTown(cid) == towns.ISLAND_OF_PEACE and newlevel >= 50) then
			
			setSkillRate(cid, type, 1)
		end
	else	
		if(getPlayerTown(cid) == towns.ISLAND_OF_PEACE and newlevel >= 85) then
		
			setSkillRate(cid, type, 1)
		end
	end		
	
	return LUA_TRUE
end