function onSay(cid, words, param)
	
	local playerPos = getPlayerPosition(cid)

	if(param == "" or (param ~= "sim" and param ~= "nao")) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voto invalido. Você precisa dizer !vote sim ou !vote nao.")
		doSendMagicEffect(playerPos, CONST_ME_POFF)
		return FALSE
	end
	
	if(param == "sim") then
		Polls.VoteYes(cid)
	elseif(param == "nao") then
		Polls.VoteNo(cid)
	end

	return TRUE
end
