function onLogout(cid)
	
	local player_questStatus = getPlayerStorageValue(cid, sid.QUESTS_STATUS)
	
	if(player_questStatus == questStatus.IN_QUEST) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não pode abandonar sua missão no meio do caminho!")
		return FALSE
	end	
	
	return TRUE
end 