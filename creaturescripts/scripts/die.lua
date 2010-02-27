function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--FunçÕes que serão chamadas quando um jogador morrer...
		
		Dungeons.onPlayerDeath(cid)
	end
end 