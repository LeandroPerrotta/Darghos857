local dialog = NpcDialog:new()
local npcSys = _NpcSystem:new()
npcSys:setDialog(dialog)

local npcTask = NpcTasks:new(npcSys)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.FOURTH)
--npcTask:setNpcSystem(npcSys)
npcTask:setDialog(dialog)

function addRewardDelay(task)
	task:doPlayerAddReward()
end

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < npcSys:getTalkRadius()) and (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (npcSys:isFocused(cid))) then
		
			dialog:say(getCreatureName(cid) .."! Veja! Todos aqui estão em ardua {tarefa} de treinamento!", cid)
			npcSys:addFocus(cid)
		elseif(npcSys:isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)				
		elseif(npcSys:isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
		
			local task = Task:new()
			task:setNpcName(getNpcName())	
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
		elseif((npcSys:isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Otimo! Eu já precisava voltar ao treino mesmo!", cid)
			npcSys:removeFocus(cid)		
		end
	end
end

function onCreatureDisappear(cid) npcSys:onCreatureDisappear(cid) end
function onPlayerCloseChannel(cid) npcSys:onPlayerCloseChannel(cid) end
function onThink() npcSys:onThink() end