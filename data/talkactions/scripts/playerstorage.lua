function onSay(cid, words, param)
	local playerPos = getPlayerPosition(cid)

	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need to type the parameter.")
		doSendMagicEffect(playerPos, CONST_ME_POFF)
		return FALSE
	else
		param = string.explode(param, ";")
	end

	local type = string.lower(param[1])
	local storage = tonumber(param[2])
	local player = getCreatureByName(param[3])
	
	if(player == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player not found. Ex: '/storagevalue set;Slash;1' where Slash is the player name")
		doSendMagicEffect(playerPos, CONST_ME_POFF)
		return FALSE			
	end
	
	local value = nil
	
	if(# param == 4) then
		value = param[4]
	end
	
	if(type == "set") then
		if(value == nil) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknonw value for set. Ex: '/storagevalue set;Slash;1' where 1 is the value")
			doSendMagicEffect(playerPos, CONST_ME_POFF)
			return FALSE				
		end
	
		setPlayerStorageValue(player, storage, value)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The player " .. player .. " has received the value " .. value .. " to storage " .. storage .. " successfuly.")
	elseif(type == "get") then
		value = getPlayerStorageValue(player, storage)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The player " .. player .. " has the value for storage " .. storage .. ":" .. value)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknonw type, use get or set. Ex: '/storagevalue get;Slash' or '/storagevalue set;Slash;1'")
		doSendMagicEffect(playerPos, CONST_ME_POFF)
		return FALSE		
	end


	return FALSE
end
