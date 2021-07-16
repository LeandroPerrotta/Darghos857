function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--Fun��es que ser�o chamadas quando um jogador morrer...
		
		Dungeons.onPlayerDeath(cid)
		setPlayerStorageValue(cid, sid.GIVE_ITEMS_AFTER_DEATH, 1)
	else
		
		local cName = getCreatureName(cid)
		
		if(cName == "Ghazran") then
		
			onGhazranDie(corpse)
			
		elseif(cName == "Lord Vankyner") then
		
			onLordVankynerDie()
		end
	end
end 