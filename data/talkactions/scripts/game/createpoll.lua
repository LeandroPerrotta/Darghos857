function onSay(cid, words, param)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need to type the parameter.")
		doSendMagicEffect(playerPos, CONST_ME_POFF)
		return FALSE
	else
		if(param == "result") then
			Polls.GMResult(cid)
			return TRUE
		end
	
		param = string.explode(param, ";")
	end
	
	local message = param[1]
	local enddate = 10
	
	if(param[2] ~= nil) then
		enddate = param[2]
	end	
	
	local minlevel = 20
	
	if(param[3] ~= nil) then
		minlevel = param[3]
	end
	
	Polls.Create(cid, message, enddate, minlevel)

	return TRUE
end
