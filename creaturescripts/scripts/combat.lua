function onCombat(cid, target)

	if(getPlayerTown(cid) == towns.ISLAND_OF_PEACE and isPlayer(target) == TRUE) then
		return FALSE
	end

	return TRUE
end