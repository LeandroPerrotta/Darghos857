HELL_POS = {x=2777, y=1367, z=13, stackpos=253}

questList =
{
	[gid.DEMON_HELMET_QUEST] =
	{
		maxPlayers = 8,
		maxTimeInQuest = 5
	}
}

questStatus = 
{
	NONE = -1,
	IN_QUEST = 0,
	OUT_QUEST = 1
}

doorsUids =
{
	7400
}

-- Construtor nao necessario?! Talvez nao...
--function specialQuests.New()
--end
	
DarghosQuest = { }	
	
function DarghosQuest.onPlayerEnterQuest(cid, item, position)

	local canEnter = (getPlayerStorageValue(cid, item.actionid) == -1)
	
	-- Verificamos se o Player já fez a quest
	if not(canEnter) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já concluiu está quest. Não pode passar novamente por aqui.")
		
		DarghosQuest.doTeleportPlayerBack(cid, position)
		return FALSE
	end
	
	local playersOnQuest = getGlobalStorageValue(item.actionid) == -1 and 0 or getGlobalStorageValue(item.actionid)
	local questInfo = questList[item.actionid]
	
	-- Verificamos se há espaço na quest
	if(playersOnQuest == questInfo.maxPlayers) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Está quest já está com o numero maximo de jogadores a tentar realiza-la. Tente novamente mais tarde.")
		
		DarghosQuest.doTeleportPlayerBack(cid, position)
		return FALSE		
	end
	
	-- Incrementamos o numero de jogadores na quest
	setGlobalStorageValue(item.actionid, playersOnQuest + 1)
	
	setPlayerStorageValue(cid, sid.QUESTS_STATUS, questStatus.IN_QUEST)
	setPlayerStorageValue(cid, sid.ON_QUEST, item.actionid)
	
	DarghosQuest.doTeleportPlayer(cid, position)
	DarghosQuest.setDoorDescription(item.uid)
	DarghosQuest.timerStart(cid)

	return TRUE	
end 

function DarghosQuest.doTeleportPlayer(cid, position)
	
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

function DarghosQuest.doTeleportPlayerBack(cid, position)

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

function DarghosQuest.timerStart(cid)
	
	local playerQuestTime = getPlayerStorageValue(cid, sid.QUEST_TIME) == -1 and 0 or getPlayerStorageValue(cid, sid.QUEST_TIME)
	local playerQuest = getPlayerStorageValue(cid, sid.ON_QUEST)
	
	local questInfo = questList[playerQuest]
	
	if(playerQuestTime < questInfo.maxTimeInQuest) then
	
		local leftTime = questInfo.maxTimeInQuest - playerQuestTime
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você possui " .. questInfo.maxTimeInQuest .. " minutos para concluir a quest...")
		
		setPlayerStorageValue(cid, sid.QUEST_TIME, playerQuestTime + 5)
		addEvent(DarghosQuest.timerStart, 1000 * 60 * 5, cid)		
	elseif(playerQuestTime == questInfo.maxTimeInQuest) then
		DarghosQuest.onQuestTimerEnd(cid)
	end
end

function DarghosQuest.onQuestTimerEnd(cid)

	local player_questStatus = getPlayerStorageValue(cid, sid.QUESTS_STATUS)
	
	if(player_questStatus == questStatus.IN_QUEST) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O tempo para você cumprir sua missão acabou. Você agora será jugado no INFERNO!")
		doTeleportThing(cid, HELL_POS)
		
		setPlayerStorageValue(cid, sid.QUEST_TIME, -1)
	end

end

function DarghosQuest.onPlayerDeath(cid)

	local playerQuest = getPlayerStorageValue(cid, sid.ON_QUEST)
	
	if(playerQuest == -1) then
		return TRUE
	end

	local playersOnQuest = getGlobalStorageValue(playerQuest)	
	setGlobalStorageValue(playerQuest, playersOnQuest - 1)
	
	setPlayerStorageValue(cid, sid.ON_QUEST, -1)
	setPlayerStorageValue(cid, sid.QUESTS_STATUS, questStatus.OUT_QUEST)
	setPlayerStorageValue(cid, sid.QUEST_TIME, -1)
	
	DarghosQuest.setDoorDescription(playerQuest)
end

function DarghosQuest.onServerStart()
	
	--configuraremos as descrições iniciais das portas das quests
	for key,questValue in ipairs(doorsUids) do
		
		if(getThing(questValue) ~= nil) then
			DarghosQuest.setDoorDescription(questValue)
		end
	end
end

function DarghosQuest.setDoorDescription(uid)
	
	-- Atualizamos a descrição da porta
	local questInfo = questList[uid]
	local playersOnQuest = getGlobalStorageValue(uid) == -1 and 0 or getGlobalStorageValue(uid)
	
	print("jogadores na quest: " .. playersOnQuest .. "/" .. questInfo.maxPlayers .. ", uid: " .. uid)
	
	doSetItemSpecialDescription(uid, "(Esta quest possui " .. playersOnQuest .. " jogadores de um maximo de " .. questInfo.maxPlayers .. ".)")
end

function DarghosQuest.onPlayerLeaveQuest(cid)

	local playerQuest = tonumber(getPlayerStorageValue(cid, sid.ON_QUEST))

	local playersOnQuest = getGlobalStorageValue(playerQuest) == -1 and 0 or getGlobalStorageValue(playerQuest)
	setGlobalStorageValue(playerQuest, playersOnQuest - 1)
	
	setPlayerStorageValue(cid, sid.ON_QUEST, -1)
	setPlayerStorageValue(cid, playerQuest, 1)
	setPlayerStorageValue(cid, sid.QUESTS_STATUS, questStatus.OUT_QUEST)
	setPlayerStorageValue(cid, sid.QUEST_TIME, -1)
	
	DarghosQuest.setDoorDescription(playerQuest)
end 