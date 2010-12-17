local dialog = NpcDialog:new()

local npcTask = NpcTasks:new()
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.NINTH)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.TENTH)
npcTask:setDialog(dialog)

local TALK_RADIUS = 4
local focuses = {}
local function isFocused(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			return true
		end
	end
	return false
end

local function addFocus(cid)
	if(not isFocused(cid)) then
		table.insert(focuses, cid)
	end
end
local function removeFocus(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			table.remove(focuses, i)
			break
		end
	end
end
local function lookAtFocus()
	for i, v in pairs(focuses) do
		if(isPlayer(v)) then
			doNpcSetCreatureFocus(v)
			return
		end
	end
	doNpcSetCreatureFocus(0)
end

function onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	if(isFocused(cid)) then
		dialog:say("Cya!")
		removeFocus(cid)
	end
end

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < TALK_RADIUS) or (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (isFocused(cid))) then
			dialog:say("Ola ".. getCreatureName(cid) .."! Como posso lhe ajudar?", cid)
			addFocus(cid)
		elseif(isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)			
		elseif(isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
			npcTask:responseTask(cid)
		elseif(isFocused(cid) and (msg == "não" or msg == "nao")) then
			dialog:say("Oh... Que pena, mas sem problemas! Então o que deseja?", cid)
			setTopic(cid, 0)		
		elseif(isFocused(cid) and msg == "sim") then
		
			if(getTopic(cid) == 2) then
				npcTask:sendTaskObjectives()
				_setTopic(cid, 3)
			elseif(getTopic(cid) == 3) then
				npcTask:sendTaskStart()
				_setTopic(cid, 0)
			elseif(getTopic(cid) == 4) then
				npcTask:onCompleteConfirm()
				setTopic(cid, 0)
			end
		elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Boa sorte humano!", cid)
			removeFocus(cid)		
		end
	end
end

function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		dialog:say("Hmph!")
		removeFocus(cid)
	end
end

function onThink()
	for i, focus in pairs(focuses) do
		if(not isCreature(focus)) then
			removeFocus(focus)
		else
			local distance = getDistanceTo(focus) or -1
			if((distance > TALK_RADIUS) or (distance == -1)) then
				dialog:say("Cya!")
				removeFocus(focus)
			end
		end
	end
	dialog:run()
	lookAtFocus()
end