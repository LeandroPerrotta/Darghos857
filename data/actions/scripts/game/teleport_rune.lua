local STATE_NONE = -1
local STATE_TELEPORTING_FIRST = 0
local STATE_TELEPORTING_SECOND = 1
local STATE_TELEPORTING_THIRD = 2

local TELEPORT_USAGE_NEVER = -1
local TELEPORT_USAGE_INTERVAL = 60 * 30 -- 30 minutos

function onUse(cid, item, frompos, item2, topos)

	if(hasCondition(cid, CONDITION_INFIGHT) == TRUE) then
		doPlayerSendCancel(cid, "Você não pode usar este item enquanto estiver em batalha!")
		return
	end
	
	if(getPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE) ~= STATE_NONE) then
		doPlayerSendCancel(cid, "A carga já sendo carregada, tenha paciencia!")
		return	
	end
	
	local lastTeleportRuneUsage = getPlayerStorageValue(cid, sid.TELEPORT_RUNE_LAST_USAGE)
	if(lastTeleportRuneUsage ~= TELEPORT_USAGE_NEVER and os.time() <= lastTeleportRuneUsage + TELEPORT_USAGE_INTERVAL) then
		local secondsLeft = (lastTeleportRuneUsage + TELEPORT_USAGE_INTERVAL) - os.time()
		
		if(secondsLeft >= 60) then
			doPlayerSendCancel(cid, "Você deve aguardar " .. math.floor(secondsLeft / 60) .. " minutos para que sua teleport rune descançe e possa usar-la novamente.")
		else
			doPlayerSendCancel(cid, "Você deve aguardar menos de um minuto para que sua teleport rune termine de descançar e possa usar-la novamente.")
		end
		
		doPlayerSendCancel(cid, "Você deve aguardar " .. math.ceil(((lastTeleportRuneUsage + TELEPORT_USAGE_INTERVAL) - os.time()) / 60) .. " minutos para que sua teleport rune descançe e possa usar-la novamente.")
		return	
	end
	
	doCreatureSay(cid, "Faltam 30 segundos para minha teleport rune ser carregada...", TALKTYPE_ORANGE_1)
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_TELEPORTING_FIRST)
	addEvent(teleportRuneStep_First, 1000 * 10, cid)
end

function teleportRuneStep_First(cid)
	if(isCreature(cid) == FALSE) then
		return
	end
	
	if(hasCondition(cid, CONDITION_INFIGHT) == TRUE) then
		setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_NONE)
		doCreatureSay(cid, "Arggh! Entrei em batalha! O transporte foi abortado!", TALKTYPE_ORANGE_1)
		return
	end	
	
	doCreatureSay(cid, "Faltam 20 segundos para minha teleport rune ser carregada...", TALKTYPE_ORANGE_1)
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_TELEPORTING_SECOND)
	addEvent(teleportRuneStep_Second, 1000 * 10, cid)
end

function teleportRuneStep_Second(cid)
	if(isCreature(cid) == FALSE) then
		return
	end
	
	if(hasCondition(cid, CONDITION_INFIGHT) == TRUE) then
		setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_NONE)
		doCreatureSay(cid, "Arggh! Entrei em batalha! O transporte foi abortado!", TALKTYPE_ORANGE_1)
		return
	end	
	
	doCreatureSay(cid, "Faltam 10 segundos para minha teleport rune ser carregada...", TALKTYPE_ORANGE_1)
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_TELEPORTING_THIRD)
	addEvent(teleportRuneStep_Third, 1000 * 10, cid)
end

function teleportRuneStep_Third(cid)
	if(isCreature(cid) == FALSE) then
		return
	end
	
	if(hasCondition(cid, CONDITION_INFIGHT) == TRUE) then
		setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_NONE)
		doCreatureSay(cid, "Arggh! Entrei em batalha! O transporte foi abortado!", TALKTYPE_ORANGE_1)
		return
	end	
	
	doCreatureSay(cid, "Finalmente minha teleport rune foi carregada!", TALKTYPE_ORANGE_1)
	
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)	
	doTeleportThing(cid, getPlayerMasterPos(cid))
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)	
	
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_STATE, STATE_NONE)
	setPlayerStorageValue(cid, sid.TELEPORT_RUNE_LAST_USAGE, os.time())
end
