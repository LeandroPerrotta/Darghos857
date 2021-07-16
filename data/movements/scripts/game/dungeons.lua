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

	if(isPlayer(cid) == TRUE) then
		if(item.itemid == 1387) then
			if(item.uid == item.actionid) then
				Dungeons.onPlayerEnter(cid, item, position)
			else
				Dungeons.onPlayerLeave(cid, item)
			end	
		else	
			doTransformTile(item)
			local dungeonInfo = dungeonList[item.actionid]
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "ATENÇÃO: Isto é uma Dungeon e só é permitido no maximo " .. dungeonInfo.maxPlayers .. " jogadores passarem pela entrada por vez. Atenção, pois ao atravessar esta porta, uma vez do outro lado é IMPOSSIVEL voltar, e você terá dois destinos: Ou conclui a dungeon, ou sofrer uma morte dolorosa. Você e seus amigos devem cumprir esta dungeon em " .. dungeonInfo.maxTimeIn .. " minutos e se este prazo não for cumprido vocês serão julgados no INFERNO!")
		end
	end
	
	return TRUE
end

function onStepOut(cid, item, pos)
	doTransformTile(item)
	return TRUE
end 