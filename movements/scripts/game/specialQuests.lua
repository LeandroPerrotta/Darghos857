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
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Isto � uma miss�o especial enviada pelos Deuses aonde s� � permitido no maximo " .. questInfo.maxPlayers .. " jogadores passarem pela entrada por vez. Aten��o, pois ao atravessar esta porta, uma vez do outro lado � IMPOSSIVEL voltar, e voc� ter� dois destinos: Ou conclui a miss�o designada, ou sofre uma morte terrivel. Voc� e seus amigos devem cumprir esta miss�o em " .. questInfo.maxTimeInQuest .. " minutos e se este prazo n�o for cumprido voc�s ser�o julgados no INFERNO!")
	end
	
	return TRUE
end

function onStepOut(cid, item, pos)
	doTransformTile(item)
	return TRUE
end 