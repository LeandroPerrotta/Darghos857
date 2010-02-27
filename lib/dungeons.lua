HELL_POS = {x=2777, y=1367, z=13, stackpos=253}

dungeonList =
{
	[gid.DUNGEONS_DEMON_HELMET] =
	{
		maxPlayers = 6,
		maxTimeIn = 25
	},
	
	[gid.DUNGEONS_ARIDANE] =
	{
		maxPlayers = 6,
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
	7400 7401
}

-- Construtor nao necessario?! Talvez nao...
--function Dungeons.New()
--end
	
Dungeons = { }	
	
function Dungeons.onPlayerEnter(cid, item, position)

	local dungeonId = item.actionid
	
	local canEnter = (getPlayerStorageValue(cid, dungeonId) == -1)
	
	-- Verificamos se o Player já fez a quest
	if not(canEnter) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já concluiu está dungeon. Não pode passar novamente por aqui.")
		
		Dungeons.doTeleportPlayerBack(cid, position)
		return FALSE
	end

	local dungeonInfo = dungeonList[dungeonId]
	
	-- Verificamos se há espaço na quest
	if(Dungeons.getPlayersIn(dungeonId) == dungeonInfo.maxPlayers) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Está dungeon já está com o numero maximo de jogadores a tentar realiza-la. Tente novamente mais tarde.")
		
		Dungeons.doTeleportPlayerBack(cid, position)
		return FALSE		
	end
	
	-- Incrementamos o numero de jogadores na quest
	Dungeons.increasePlayers(dungeonId)
	
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, dungeonStatus.IN_DUNGEON)
	setPlayerStorageValue(cid, sid.ON_DUNGEON, dungeonId)
	
	Dungeons.doTeleportPlayer(cid, position)
	Dungeons.updateEntranceDescription(dungeonId)
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

function Dungeons.onTimeStart(cid)
	
	local playerDungeonTime = getPlayerStorageValue(cid, sid.DUNGEON_TIME) == -1 and 0 or getPlayerStorageValue(cid, sid.DUNGEON_TIME)
	local playerDungeon = getPlayerStorageValue(cid, sid.ON_DUNGEON)
	
	local dungeonInfo = dungeonList[playerDungeon]
	
	if(playerDungeonTime < dungeonInfo.maxTimeIn) then
	
		local leftTime = dungeonInfo.maxTimeIn - playerDungeonTime
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você possui " .. dungeonInfo.maxTimeIn .. " minutos para concluir a dungeon...")
		
		setPlayerStorageValue(cid, sid.DUNGEON_TIME, playerDungeonTime + 5)
		addEvent(Dungeons.onTimeStart, 1000 * 60 * 5, cid)		
	elseif(playerDungeonTime == dungeonInfo.maxTimeIn) then
		Dungeons.onTimeEnd(cid)
	end
end

function Dungeons.onTimeEnd(cid)

	local dungeonStatus = getPlayerStorageValue(cid, sid.DUNGEON_STATUS)
	
	if(dungeonStatus == questStatus.IN_DUNGEON) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O tempo para você cumprir esta dungeon acabou. Você agora será jugado no INFERNO!")
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
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, questStatus.OUT_DUNGEON)
	setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
	
	Dungeons.updateEntranceDescription(playerDungeon)
end

function Dungeons.onServerStart()
	
	--configuraremos as descrições iniciais das portas das dungeons
	for key,dungeonValue in ipairs(dungeonEntranceUids) do
		
		if(getThing(dungeonValue) ~= nil) then
			Dungeons.updateEntranceDescription(dungeonValue)
		end
	end
end

function Dungeons.updateEntranceDescription(uid)
	
	-- Atualizamos a descrição da porta
	local dungeonInfo = dungeonList[uid]	
	print("jogadores na quest: " .. Dungeons.getPlayersIn(uid) .. "/" .. dungeonInfo.maxPlayers .. ", uid: " .. uid)
	doSetItemSpecialDescription(uid, "[Esta dungeon possui " .. Dungeons.getPlayersIn(uid) .. " jogadores de um maximo de " .. dungeonInfo.maxPlayers .. ".]")
end

function Dungeons.onPlayerLeave(cid)

	local playerDungeon = tonumber(getPlayerStorageValue(cid, sid.ON_DUNGEON))
	
	Dungeons.decreasePlayers(playerDungeon)
	
	setPlayerStorageValue(cid, sid.ON_DUNGEON, -1)
	setPlayerStorageValue(cid, playerDungeon, 1)
	setPlayerStorageValue(cid, sid.DUNGEON_STATUS, questStatus.OUT_DUNGEON)
	setPlayerStorageValue(cid, sid.DUNGEON_TIME, -1)
	
	Dungeons.updateEntranceDescription(playerDungeon)
end 