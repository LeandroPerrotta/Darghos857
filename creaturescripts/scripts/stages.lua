function onAdvance(cid, type, oldlevel, newlevel)
		
	if(type ~= LEVEL_EXPERIENCE) then
	
		if(getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) == -1 and newlevel >= 85) then
		
			if(type == LEVEL_SKILL_FIST) then
				setSkillRate(cid, LEVEL_SKILL_FIST, 1)
			end	
				
			if(type == LEVEL_SKILL_CLUB) then	
				setSkillRate(cid, LEVEL_SKILL_CLUB, 1)
			end	
				
			if(type == LEVEL_SKILL_SWORD) then		
				setSkillRate(cid, LEVEL_SKILL_SWORD, 1)
			end	
				
			if(type == LEVEL_SKILL_AXE) then		
				setSkillRate(cid, LEVEL_SKILL_AXE, 1)
			end	
				
			if(type == LEVEL_SKILL_DISTANCE) then	
				setSkillRate(cid, LEVEL_SKILL_DISTANCE, 1)
			end	
				
			if(type == LEVEL_SKILL_SHIELDING) then		
				setSkillRate(cid, LEVEL_SKILL_SHIELDING, 1)
			end	
				
			if(type == LEVEL_SKILL_FISHING) then		
				setSkillRate(cid, LEVEL_SKILL_FISHING, 1)	
			end		
		end
	else	
		setRateStage(cid, newlevel)
	end		
	
	return LUA_TRUE
end