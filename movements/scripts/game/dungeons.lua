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
			Dungeons.onPlayerEnter(cid, item, position)
		else
			Dungeons.onPlayerLeave(cid, item)
		end	
	else	
		doTransformTile(item)
		local dungeonInfo = dungeonList[item.actionid]
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "ATEN��O: Isto � uma Dungeon e s� � permitido no maximo " .. dungeonInfo.maxPlayers .. " jogadores passarem pela entrada por vez. Aten��o, pois ao atravessar esta porta, uma vez do outro lado � IMPOSSIVEL voltar, e voc� ter� dois destinos: Ou conclui a dungeon, ou sofrer uma morte dolorosa. Voc� e seus amigos devem cumprir esta dungeon em " .. dungeonInfo.maxTimeIn .. " minutos e se este prazo n�o for cumprido voc�s ser�o julgados no INFERNO!")
	end
	
	return TRUE
end

function onStepOut(cid, item, pos)
	doTransformTile(item)
	return TRUE
end 