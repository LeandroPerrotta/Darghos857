function onSay(cid, words, param)
	doSetGameState(GAME_STATE_CLOSED)

	local casterRemoved = false
	for i, uid in ipairs(getPlayersOnlineList()) do
		if getPlayerFlagValue(uid, PLAYERFLAG_CANALWAYSLOGIN) == FALSE and getPlayerName(uid) ~= "Leandro" then
			if uid == cid then
				casterRemoved = true
			end
			doRemoveCreature(uid)
		end
	end

	if(param == "serversave") then
		doSaveServer(TRUE)
	else
		doSaveServer(FALSE)
	end

	if not casterRemoved then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Server is now closed.")
	end

	return FALSE
end
