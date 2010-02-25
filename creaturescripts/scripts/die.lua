function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--FunçÕes que serão chamadas quando um jogador morrer...
		
		DarghosQuest.onPlayerDeath(cid)
	end
end 