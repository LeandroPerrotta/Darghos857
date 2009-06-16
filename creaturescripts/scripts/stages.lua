function onAdvance(cid, oldlevel, newlevel, type)
	
	
	if(type ~= LEVEL_EXPERIENCE) then
		return LUA_TRUE
	end
		
	setRateStage(cid, newlevel)
	return LUA_TRUE
end