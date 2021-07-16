function onSay(cid, words, param)

	local player = cid

	if(param ~= "") then
		player = getPlayerByName(param)
		if player == cid or player == LUA_NULL then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This player does not exist.")
			return FALSE
		end			
	end
	
	local town_pos = getPlayerMasterPos(player)
	local old_pos = getPlayerPosition(player)	
	
	if(doTeleportThing(player, town_pos) ~= LUA_ERROR) then
		if(getPlayerFlagValue(player, PLAYERFLAG_CANNOTBESEEN) == FALSE) then
			doSendMagicEffect(old_pos, CONST_ME_POFF)
			doSendMagicEffect(town_pos, CONST_ME_TELEPORT)
			
			if(player ~= cid) then
				doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "O membro " .. getPlayerName(cid) .. " enviou você ao templo.")
			end
		end
	else
		doPlayerSendCancel(cid, "Can not teleport to that position. Check your master position.")
	end

	return FALSE
end
