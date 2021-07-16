function onSay(cid, words, param)

	local gmName = GetTpRequest(getPlayerName(cid))
	
	if(gmName == FALSE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nenhum membro deseja se transportar a você.")
		return FALSE	
	end
	
	local gm = getCreatureByName(gmName)
	
	if(gm == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O membro que requisitou se transportar a você está offline.")
		RemoveTpRequest(getPlayerName(cid))
		return FALSE		
	end
	
	local destPos = getCreaturePosition(cid)
	local gmPos = getPlayerPosition(gm)
	
	if(doTeleportThing(gm, destPos) ~= LUA_ERROR) then
		if(getPlayerFlagValue(gm, PLAYERFLAG_CANNOTBESEEN) == FALSE) then
			doSendMagicEffect(gmPos, CONST_ME_POFF)
			doSendMagicEffect(destPos, CONST_ME_TELEPORT)
			RemoveTpRequest(getPlayerName(cid))
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não foi possivel fazer o transporte.")
	end

	return FALSE
end
