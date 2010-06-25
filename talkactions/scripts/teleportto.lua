function onSay(cid, words, param)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need to type the parameter.")
		return FALSE
	end

	local destPos = getWaypointPositionByName(param)
	local creature = getCreatureByName(param)
	if(destPos == LUA_ERROR) then
		if creature == cid or creature == 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Creature, player or waypoint not found.")
			return FALSE
		else
			destPos = getCreaturePosition(creature)
		end
	end

	local creatureAccess = 0
	if(isPlayer(creature) == LUA_TRUE) then
		creatureAccess = getPlayerAccess(creature)
	end
	
	if(isPlayer(creature) == FALSE and getPlayerAccess(cid) < ACCESS_ADMIN) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can only teleport to players.")
		return FALSE		
	end

	if creatureAccess < getPlayerAccess(cid) then
	
		if(getPlayerAccess(cid) < ACCESS_ADMIN) then
		
			print("Access:" .. getPlayerAccess(cid))
		
			if(GetTpRequest(getPlayerName(creature)) ~= FALSE) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player " .. getPlayerName(creature) .. ", já possui um pedido de teleport.")
				return FALSE
			end
		
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Foi enviado um pedido de teleport ao jogador " .. getPlayerName(creature) .. ", você sera transportado para a posição do jogador se ele aceitar isto.")
			doPlayerSendTextMessage(creature, MESSAGE_STATUS_CONSOLE_BLUE, "Caro jogador, o membro " .. getPlayerName(cid) .. " deseja se transportar para a sua posição atual, provavelmente para analisar algum bug, se você concorda com isto digite !aceitotp e este membro será transportado para sua tela, senão apenas ignore este aviso.")
		
			AddTpRequest(getPlayerName(cid), getPlayerName(creature))
			addEvent(RemoveTpRequest, 1000 * 60 * 5, getPlayerName(creature))
		
			return FALSE
		end
	
		local oldPlayerPos = getPlayerPosition(cid)
		if(doTeleportThing(cid, destPos) ~= LUA_ERROR) then
			if(getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN) == FALSE) then
				doSendMagicEffect(oldPlayerPos, CONST_ME_POFF)
				doSendMagicEffect(destPos, CONST_ME_TELEPORT)
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Can not teleport to that position.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have access to do that.")
	end

	return FALSE
end
