function onKill(cid, target)
	
	-- Bonartes Mission's	
	local _demonMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_DEMONS)
	local _heroMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_HEROS)
	local _behemothMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_BEHEMOTHS)	
	
	local _targetName = getCreatureName(target)
	
	if(_targetName == "hero" and _heroMission == 2) then
		local kills = getPlayerStorageValue(cid, sid.BONARTES_HERO_KILLS)
		
		if(kills == -1) then
			kills = 0
		end
		
		kills = kills + 1
		
		setPlayerStorageValue(cid, sid.BONARTES_HERO_KILLS, kills)
		
		if(kills == KILL_MISSIONS.BONARTES_HERO) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você já derrotou heros sulficientes, vá falar com o Bonartes e o diga que terminou a missão.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você derrotou " .. kills .. " heroes.")
		end
	elseif(_targetName == "behemoth" and _behemothMission == 1) then
		local kills = getPlayerStorageValue(cid, sid.BONARTES_BEHEMOTH_KILLS)
		
		if(kills == -1) then
			kills = 0
		end
		
		kills = kills + 1
		
		setPlayerStorageValue(cid, sid.BONARTES_BEHEMOTH_KILLS, kills)	
		
		if(kills == KILL_MISSIONS.BONARTES_BEHEMOTH) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você já derrotou behemoths sulficientes, vá falar com o Bonartes e o diga que terminou a missão.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você derrotou " .. kills .. " behemoths.")
		end
	elseif(_targetName == "demon" and _demonMission == 1) then
		local kills = getPlayerStorageValue(cid, sid.BONARTES_DEMON_KILLS)
		
		if(kills == -1) then
			kills = 0
		end
		
		kills = kills + 1
		
		setPlayerStorageValue(cid, sid.BONARTES_DEMON_KILLS, kills)		
		
		if(kills == KILL_MISSIONS.BONARTES_DEMON) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você já derrotou demons sulficientes, vá falar com o Bonartes e o diga que terminou a missão.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você derrotou " .. kills .. " demons.")
		end		
	end		
	
	return TRUE

end