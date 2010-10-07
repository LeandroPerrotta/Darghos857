function onCombat(cid, target)

	if(isPlayer(cid) == TRUE and (getCreatureName(target) == "Marksman Target" or getCreatureName(target) == "Hitdoll")) then
		addShieldTriesInTrain(cid, target)
	end

	--checks attacker
	local player_attacker = nil
	if(isPlayer(cid) == TRUE) then
		player_attacker = cid
	elseif(isPlayer(getCreatureMaster(cid)) == TRUE) then
		player_attacker = getCreatureMaster(cid)
	end

	--checks target
	local player_target = nil
	if(isPlayer(target) == TRUE) then
		player_target = target
	elseif(isPlayer(getCreatureMaster(target)) == TRUE) then
		player_target = getCreatureMaster(cid)
	end

	if(player_attacker ~= nil and player_target ~= nil) then
		if(getPlayerTown(player_attacker) == towns.ISLAND_OF_PEACE or
		   getPlayerTown(player_target) == towns.ISLAND_OF_PEACE) then
			return FALSE
		end
	end

	return TRUE
end
