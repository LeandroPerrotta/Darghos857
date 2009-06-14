function onAdvance(cid, LEVEL_EXPERIENCE, oldlevel, newlevel)
	
	stages = {
	
	first 	= 50,
	second	= 20,
	third	= 10,
	fourth 	= 4,
	fifth	= 2,
	six		= 1
	}
	
	
	if(LEVEL_EXPERIENCE+1 <= 40) then
		setExperienceRate(cid, stages.first)
	elseif(LEVEL_EXPERIENCE+1 > 40) and (LEVEL_EXPERIENCE+1 <= 80) then
		setExperienceRate(cid, stages.second)
	elseif(LEVEL_EXPERIENCE+1 > 80) and (LEVEL_EXPERIENCE+1 <= 120) then
		setExperienceRate(cid, stages.third)
	elseif(LEVEL_EXPERIENCE+1 > 120) and (LEVEL_EXPERIENCE+1 <= 160) then
		setExperienceRate(cid, stages.fourth)
	elseif(LEVEL_EXPERIENCE+1 > 160) and (LEVEL_EXPERIENCE+1 <= 220) then
		setExperienceRate(cid, stages.fifth)
	elseif(LEVEL_EXPERIENCE+1 > 220) then
		setExperienceRate(cid, stages.six)
	else
		print("Player "..name.." falhou durante o processo de setRateStage 2.")
	end
	

end