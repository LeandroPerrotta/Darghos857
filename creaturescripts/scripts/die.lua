function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--Fun��es que ser�o chamadas quando um jogador morrer...
		
		Dungeons.onPlayerDeath(cid)
	else
		
		if(getCreatureName(cid) == "Ghazran") then
		
			onGhazranDie(corpse)
		end
	end
end 