local SWITCHES = { {416, 417}, {426, 425}, {446, 447}, {3216, 3217} }

local function doTransformTile(item)
	for i, v in pairs(SWITCHES) do
		if(item.itemid == v[1]) then
			return doTransformItem(item.uid, v[2])
		elseif(item.itemid == v[2]) then
			return doTransformItem(item.uid, v[1])
		end
	end
end

function onStepIn(cid, item, position, fromPosition)

	if(item.itemid == 1387) then
		if(item.uid == item.actionid) then
			DarghosQuest.onPlayerEnterQuest(cid, item, position)
		else
			DarghosQuest.onPlayerLeaveQuest(cid, item)
		end	
	else	
		doTransformTile(item)
		local questInfo = questList[item.actionid]
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Isto é uma missão especial enviada pelos Deuses aonde só é permitido no maximo " .. questInfo.maxPlayers .. " jogadores passarem pela entrada por vez. Atenção, pois ao atravessar esta porta, uma vez do outro lado é IMPOSSIVEL voltar, e você terá dois destinos: Ou conclui a missão designada, ou sofre uma morte terrivel. Você e seus amigos devem cumprir esta missão em " .. questInfo.maxTimeInQuest .. " minutos e se este prazo não for cumprido vocês serão julgados no INFERNO!")
	end
	
	return TRUE
end

function onStepOut(cid, item, pos)
	doTransformTile(item)
	return TRUE
end 