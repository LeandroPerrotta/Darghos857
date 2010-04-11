function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--Fun��es que ser�o chamadas quando um jogador morrer...
		
		Dungeons.onPlayerDeath(cid)
	else
		
		local cName = getCreatureName(cid)
		
		if(cName == "Ghazran") then
		
			onGhazranDie(corpse)
			
		elseif(cName == "Lord Vankyner") then
		
			onLordVankynerDie()
		end
	end
end 