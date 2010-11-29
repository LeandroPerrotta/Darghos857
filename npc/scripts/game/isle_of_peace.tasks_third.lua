local dialog = NpcDialog:new()

local npcTask = NpcTasks:new()
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.FOURTH)
npcTask:setDialog(dialog)

local TALK_RADIUS = 4
local _state = {}
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
		dialog:say("Ghrrr! Minha vontade é lhe dar uma surra!")
		removeFocus(cid)
	end
end

function addRewardDelay(task)
	task:doPlayerAddReward()
end

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < TALK_RADIUS) or (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (isFocused(cid))) then
		
			dialog:say(getCreatureName(cid) .."! Veja! Todos aqui estão em ardua {tarefa} de treinamento!", cid)
			addFocus(cid)
		elseif(isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)				
		elseif(isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
		
			local task = Task:new()
			task:loadById(CAP_ONE.ISLAND_OF_PEACE.FOURTH)
			task:setPlayer(cid)
			
			if(task:checkPlayerRequirements()) then
				if(task:getState() == taskStats.COMPLETED) then
					dialog:say("Converse com os habitantes! Eles as vezes tem algum trabalho para você!", cid);
				else
					dialog:say("Oh! Claro! Hector havia me enviado uma carta falando sobre você! Vou aplicar um treinamento especial em você e assim estara preparado para confrontar monstros mais fortes...", cid)
					addEvent(addRewardDelay, 1000 * 2, task)
					task:setCompleted()
					dialog:say("Agora sim! Está apto a enfrentar itens mais fortes que habitam a parte de fora da cidade! Volte para o centro da cidade agora e fale com Mereus! Ele certamente tera algo para você!", cid)				
				end
			else
				dialog:say("Há coisas para serem feitas na cidade, converse com Mereus ou com Hector que sei que eles precisam de alguma ajuda.", cid)
			end
		elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Otimo! Eu já precisava voltar ao treino mesmo!", cid)
			removeFocus(cid)		
		end
	end
end

function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		dialog:say("Ghrr!")
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
				dialog:say("Ghrrr! Minha vontade é lhe dar uma surra!")
				removeFocus(focus)
			end
		end
	end
	dialog:run()
	lookAtFocus()
end