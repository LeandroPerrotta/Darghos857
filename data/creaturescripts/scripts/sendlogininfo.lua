function onLogin(cid)
	
	-- Poe Outfit GM/CM/GOD
	access = getPlayerAccess(cid)
	
	if access == 3 then
		doCreatureChangeOutfit(cid, {lookType=75 ,lookHead= 10,lookBody= 10,lookLegs= 10,lookFeet= 10,lookAddons=3})
	elseif access == 4 then
		doCreatureChangeOutfit(cid, {lookType=266 ,lookHead= 10,lookBody= 10,lookLegs= 10,lookFeet= 10,lookAddons=3})
	elseif access == 5 then
		doCreatureChangeOutfit(cid, {lookType=302 ,lookHead= 10,lookBody= 10,lookLegs= 10,lookFeet= 10,lookAddons=3})
	end	
	
	--Sends the login messages and also the teleport effect
	local loginMsg = getConfigValue('loginmsg')
	local lastLogin = getPlayerLastLogin(cid)
	local playerPos = getPlayerPosition(cid)
	local serverName = getConfigValue('servername')
	local str = ""

	if (string.len(loginMsg) ~= 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, loginMsg)
	end

	if (lastLogin ~= 0) then
		str = "Your last visit in "
		str = str .. serverName
		str = str .. ": "
		str = str .. os.date("%d %b %Y %X", lastLogin)
		str = str .. "."
	else
		str = "This is your first visit in "
		str = str .. serverName
		str = str .. ". Please choose an outfit."
		doPlayerSendOutfitWindow(cid)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)

	if(getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN) == FALSE) then
		doSendMagicEffect(playerPos, CONST_ME_TELEPORT)
	end

	return TRUE
end