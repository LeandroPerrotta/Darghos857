function onDie(cid, corpse)
	if isPlayer(cid) == TRUE then
		--Fun��es que ser�o chamadas quando um jogador morrer...
		
		DarghosQuest.onPlayerDeath(cid)
	end
end 