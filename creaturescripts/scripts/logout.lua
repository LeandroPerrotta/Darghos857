function onLogout(cid)
	
	local player_questStatus = getPlayerStorageValue(cid, sid.QUESTS_STATUS)
	
	if(player_questStatus == questStatus.IN_QUEST) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "N�o pode abandonar sua miss�o no meio do caminho!")
		return FALSE
	end	
	
	return TRUE
end 