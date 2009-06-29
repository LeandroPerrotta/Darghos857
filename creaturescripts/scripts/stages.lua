function onAdvance(cid, type, oldlevel, newlevel)
	
	
	if(type ~= LEVEL_EXPERIENCE) then
		return LUA_TRUE
	end
		
	setRateStage(cid, newlevel)
	return LUA_TRUE
end