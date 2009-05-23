function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {
	p_exp = 1800000,
	h_exp = 1000000,
	m_exp = 4000000
}


	if(item.actionid == aid.XP_PIRATE) then
		if(getPlayerStorageValue(cid, sid.XP_PIRATE)) == 1 then
			doPlayerAddExp(cid, config.p_exp)
			setPlayerStorageValue(cid, sid.XP_PIRATE,1)
			doSendAnimatedText(getCreaturePosition(cid), config.p_exp, TEXTCOLOR_YELLOW)
			local position = getCreaturePosition(cid)
			local i = 0
			while i <= 100 do
				doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, 33)
				i = i + 1
			end	
		else
			doSendAnimatedText(getCreaturePosition(cid),"Fail!", TEXTCOLOR_LIGHTBLUE)
		end
	elseif(item.actionid == aid.XP_HELHEIM) then
		if(getPlayerStorageValue(cid, sid.XP_HELHEIM)) ~= 1 then
			doPlayerAddExp(cid, config.h_exp)
			setPlayerStorageValue(cid, sid.XP_HELHEIM,1)
			doSendAnimatedText(getCreaturePosition(cid), config.h_exp, TEXTCOLOR_YELLOW)
			local position = getCreaturePosition(cid)
			local i = 0
			while i <= 100 do
				doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, 33)
				i = i + 1
			end	
		else
			doSendAnimatedText(getCreaturePosition(cid),"Fail!", TEXTCOLOR_LIGHTBLUE)
		end
	elseif(item.actionid == aid.XP_MINES) then
		if(getPlayerStorageValue(cid, sid.XP_MINES)) ~= 1 then
			doPlayerAddExp(cid, config.m_exp)
			setPlayerStorageValue(cid, sid.XP_MINES,1)
			doSendAnimatedText(getCreaturePosition(cid), config.m_exp, TEXTCOLOR_YELLOW)
			local position = getCreaturePosition(cid)
			local i = 0
			while i <= 100 do
				doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, 33)
				i = i + 1
			end	
		else
			doSendAnimatedText(getCreaturePosition(cid),"Fail!", TEXTCOLOR_LIGHTBLUE)
		end
	end
end