HELL_POS = {x=2777, y=1367, z=13, stackpos=253}

dungeonList =
{
	[gid.DUNGEONS_DEMON_HELMET] =
	{
		maxPlayers = 6,
		maxTimeIn = 25,
	},
	
	[gid.DUNGEONS_ARIADNE_GHAZRAN] =
	{
		maxPlayers = 15,
		maxTimeIn = 300
	}	
}

dungeonStatus = 
{
	NONE = -1,
	IN_DUNGEON = 0,
	OUT_DUNGEON = 1
}

dungeonEntranceUids =
{
	7400, 7401
}

Dungeons = {
	--_singleton = nil
}	

-- Construtor nao necessario?! Talvez nao...
--function Dungeons:New(o)

--	local o = o or {}
--	setmetatable(o, self)
--	self.__index = self
--	return o
--end
	
function Dungeons.onPlayerEnter(cid, item, position)

	local dungeonId = item.actionid
	
	local canEnter = (getPlayerStorageValue(cid, dungeonId) == -1)
	
	-- Verificamos se o Player j� fez a Dungeon
	if not(canEnter) then
		doPlayerSendCancel(cid, "Voc� j� concluiu est� dungeon. N�o pode passar novamente por aqui.")
		
		Dungeons.doTeleportPlayerBack(cid, position)
		return FALSE
	end

	local dungeonInfo = dungeonList[dungeonId]
	
	-- Verificamos se h� espa�o na quest
	if(Dungeons.getPlayersIn(dungeonId) == dungeonInfo.maxPlayers) then
		doPlayerSendCancel(cid, "Est� dungeon j� est� com o numero maximo de jogadores a tentar realiza-la. Tente novamente mais tarde.")
		
		Dungeons.doTeleportPlayerBack(cid, position)
		return FALSE		
	end
	
	-- Daqui em diante dispararemos eventos que ir�o configurar o jogador dentro da dungeon
	
	-- Incrementamos o numero de jogadores na dungeon
	Dungeons.increasePlayers(dungeonId)
	
	-- Informamos em storage values que o jogador est� em uma dungeon e em qual dungeon ele est�
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, dungeonStatus.IN_DUNGEON)
	setPlayerStorageValue(cid, sid.ON_DUNGEON, dungeonId)
	
	-- Transportamos o jogador para dentro da dungeon
	Dungeons.doTeleportPlayer(cid, position)
	
	-- Atualizamos a descri��o da entrada (o teleport)
	Dungeons.updateEntranceDescription(dungeonId)
	
	-- Resetamos qualquer cronometro possivel existente e disparamos o cronometro
	Dungeons.TimeReset(cid)
	Dungeons.onTimeStart(cid)
	
	return TRUE	
end 

function Dungeons.increasePlayers(dungeonId)

	setGlobalStorageValue(dungeonId, Dungeons.getPlayersIn(dungeonId) + 1)
end

function Dungeons.decreasePlayers(dungeonId)

	setGlobalStorageValue(dungeonId, Dungeons.getPlayersIn(dungeonId) - 1)
end

function Dungeons.getPlayersIn(dungeonId)
	
	local playersOnDungeon = getGlobalStorageValue(dungeonId) == -1 and 0 or getGlobalStorageValue(dungeonId)
	return playersOnDungeon
end

function Dungeons.resetPlayersIn(dungeonId)
	
	setGlobalStorageValue(dungeonId, 0)
end

function Dungeons.doTeleportPlayer(cid, position)
	
	local playerLookTo = getPlayerLookDir(cid)
	local destPos = {}
	
	if(playerLookTo == NORTH) then
		destPos = {x = position.x, y = position.y - 2, z = position.z, stackpos = 0}
	elseif(playerLookTo == SOUTH) then
		destPos = {x = position.x, y = position.y + 2, z = position.z, stackpos = 0}
	elseif(playerLookTo == EAST) then
		destPos = {x = position.x + 2, y = position.y, z = position.z, stackpos = 0}
	elseif(playerLookTo == WEST) then
		destPos = {x = position.x - 2, y = position.y, z = position.z, stackpos = 0}
	end
	
	doTeleportThing(cid, destPos)
	doSendMagicEffect(destPos, CONST_ME_MAGIC_BLUE)
end

function Dungeons.doTeleportPlayerBack(cid, position)

	local playerLookTo = getPlayerLookDir(cid)
	local destPos = {}
	
	if(playerLookTo == NORTH) then
		destPos = {x = position.x, y = position.y + 1, z = position.z, stackpos = 0}
		doSetCreatureDirection(cid, SOUTH)
	elseif(playerLookTo == SOUTH) then
		destPos = {x = position.x, y = position.y - 1, z = position.z, stackpos = 0}
		doSetCreatureDirection(cid, NORTH)
	elseif(playerLookTo == EAST) then
		destPos = {x = position.x - 1, y = position.y, z = position.z, stackpos = 0}
		doSetCreatureDirection(cid, WEST)
	elseif(playerLookTo == WEST) then
		destPos = {x = position.x + 1, y = position.y, z = position.z, stackpos = 0}
		doSetCreatureDirection(cid, EAST)
	end
	
	doTeleportThing(cid, destPos)
	doSendMagicEffect(destPos, CONST_ME_MAGIC_BLUE)
end

function Dungeons.TimeReset(cid)
	setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
end

function Dungeons.onTimeStart(cid)
	
	local playerDungeonTime = getPlayerStorageValue(cid, sid.DUNGEON_TIME) == -1 and 0 or getPlayerStorageValue(cid, sid.DUNGEON_TIME)
	local playerDungeon = getPlayerStorageValue(cid, sid.ON_DUNGEON)
	
	local dungeonInfo = dungeonList[playerDungeon]
	
	if(playerDungeon ~= -1) then
		if(playerDungeonTime < dungeonInfo.maxTimeIn) then
		
			local leftTime = dungeonInfo.maxTimeIn - playerDungeonTime
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� possui " .. leftTime .. " minutos para concluir a dungeon...")
			
			setPlayerStorageValue(cid, sid.DUNGEON_TIME, playerDungeonTime + 5)
			addEvent(Dungeons.onTimeStart, 1000 * 60 * 5, cid)		
		elseif(playerDungeonTime == dungeonInfo.maxTimeIn) then
			Dungeons.onTimeEnd(cid)
		end
	end
end

function Dungeons.onTimeEnd(cid)

	local dungeonStorage = getPlayerStorageValue(cid, sid.DUNGEON_STATUS)
	
	if(dungeonStorage == dungeonStatus.IN_DUNGEON) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O tempo para voc� cumprir esta dungeon acabou. Voc� agora ser� jugado no INFERNO!")
		doTeleportThing(cid, HELL_POS)
		
		setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
	end

end

function Dungeons.onPlayerDeath(cid)

	local playerDungeon = getPlayerStorageValue(cid, sid.ON_DUNGEON)
	
	if(playerDungeon == -1) then
		return TRUE
	end
	
	Dungeons.decreasePlayers(playerDungeon)
	
	setPlayerStorageValue(cid, sid.ON_DUNGEON, -1)
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, dungeonStatus.OUT_DUNGEON)
	setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
	
	Dungeons.updateEntranceDescription(playerDungeon)
end

-- Fun��o chamada 
function Dungeons.onLogin(cid)

	local isInDungeon = (getPlayerStorageValue(cid, sid.DUNGEON_STATUS) == dungeonStatus.IN_DUNGEON)

	if (isInDungeon) then
		setPlayerStorageValue(cid, sid.ON_DUNGEON, -1)
		setPlayerStorageValue(cid, sid.DUNGEON_STATUS, dungeonStatus.OUT_DUNGEON)
		setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
		
		doTeleportThing(cid, HELL_POS)
		
		print("[Dungeons.onLogin] " .. getPlayerName(cid) .. " dungeon info cleaned.")
	end
end

function Dungeons.onServerStart()
	
	--configuraremos as descri��es iniciais das portas das dungeons
	for key,dungeonValue in ipairs(dungeonEntranceUids) do
		
		if(getThing(dungeonValue) ~= nil) then
			Dungeons.resetPlayersIn(dungeonValue)
			Dungeons.updateEntranceDescription(dungeonValue)		
		end
	end
end

function Dungeons.updateEntranceDescription(dungeonId)
	
	-- Atualizamos a descri��o da porta
	local dungeonInfo = dungeonList[dungeonId]
	print("jogadores na quest: " .. Dungeons.getPlayersIn(dungeonId) .. "/" .. dungeonInfo.maxPlayers .. ", uid: " .. dungeonId)
	doSetItemSpecialDescription(dungeonId, "[Esta dungeon possui " .. Dungeons.getPlayersIn(dungeonId) .. " jogadores de um maximo de " .. dungeonInfo.maxPlayers .. ".]")
end

function Dungeons.onPlayerLeave(cid)

	local playerDungeon = getPlayerStorageValue(cid, sid.ON_DUNGEON)
	
	Dungeons.decreasePlayers(playerDungeon)
	
	setPlayerStorageValue(cid, sid.ON_DUNGEON, -1)
	setPlayerStorageValue(cid, playerDungeon, 1)
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, dungeonStatus.OUT_DUNGEON)
	setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
	
	Dungeons.updateEntranceDescription(playerDungeon)
end 
