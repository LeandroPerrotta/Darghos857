local dialog = NpcDialog:new()
local npcSys = _NpcSystem:new()
npcSys:setDialog(dialog)

local npcTask = NpcTasks:new(npcSys)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.FIRST)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SECOND)
--npcTask:setNpcSystem(npcSys)
npcTask:setDialog(dialog)

function onCreatureAppear(cid)
	firstLoginEvent(cid)
end

function firstLoginEvent(cid)

	if(isPlayer(cid) == FALSE) then
		return
	end

	local distance = getDistanceTo(cid)
	if(distance == -1) then
		return
	end
	
	if(getPlayerStorageValue(cid, sid.FIRSTLOGIN_ITEMS) == 1) then
		return
	end	
	
	if(getPlayerStorageValue(cid, CAP_ONE.ISLAND_OF_PEACE.FIRST) == taskStats.NONE) then
	
		npcSys:addFocus(cid)	
		
		if(distance ~= -1 and distance > 1) then
			moveToCreature(cid)
			dialog:delay(1)
		end
		
		dialog:say("Seja bem vindo " .. getCreatureName(cid) .. "! Meu nome é " .. getNpcName() .. ", meu trabalho é auxiliar novos jogadores, como você! [...]", cid)
		dialog:say("Para ajudar no inicio de sua jornada irei lhe dar alguns equipamentos, tome isto! [...]", cid, 6)
		addEvent(defineFirstItems, 1000 * 8, cid)
		dialog:say("Estamos tendo algum trabalho com uma criatura, os trolls, eles vivem no sub-solo da cidade e estÃ£o se multiplicando rápidamente [...]", cid, 6)
		dialog:say("Precisamos eliminar alguns deles para manter o controle... Mas preciso de alguem para efetuar esta {tarefa}!", cid, 6)
	end	
end

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < npcSys:getTalkRadius()) and (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (npcSys:isFocused(cid))) then
		
			local task = Task:new()
			task:setNpcName(getNpcName())
			task:loadById(CAP_ONE.ISLAND_OF_PEACE.FOURTH)
			task:setPlayer(cid)		
		
			if(task:getState() == taskStats.COMPLETED) then
				dialog:say("Mas veja só! É o ".. getCreatureName(cid) .."! Está bem mais forte do que a ultima vez que o vi! Andou fazendo tarefas?", cid)
				npcSys:setTopic(cid, 5)
			else
				dialog:say("Ola ".. getCreatureName(cid) ..". Gostaria de fazer uma {tarefa}?", cid)
			end
			
			npcSys:addFocus(cid)		
		elseif(npcSys:isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)				
		elseif(npcSys:isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
		
			npcTask:responseTask(cid)
		elseif(npcSys:isFocused(cid) and (msg == "não" or msg == "nao")) then
			dialog:say("Oh... Que pena, mas sem problemas! Então o que deseja?", cid)
			npcSys:setTopic(cid, 0)			
		elseif(npcSys:isFocused(cid) and msg == "sim") then
		
			if(npcSys:getTopic(cid) == 2) then
				npcTask:sendTaskObjectives()
				npcSys:setTopic(cid, 3)
			elseif(npcSys:getTopic(cid) == 3) then
				npcTask:sendTaskStart()
				npcSys:setTopic(cid, 0)
			elseif(npcSys:getTopic(cid) == 4) then
				npcTask:onCompleteConfirm()
				npcSys:setTopic(cid, 0)
			elseif(npcSys:getTopic(cid) == 5) then
				dialog:say("Isto é bom! Até imagino que você veio aqui saber sobre mais certo? Haha, não é preciso responder... Bom... Eu não tenho mais nenhuma tarefa mas se você seguir ao leste do templo você chegará na saida leste da cidade e lá você encontrará o guarda Winston [...]", cid)
				dialog:say("Converse com ele, eu sei estava precisando de alguem para fazer algumas tarefas fora da cidade, agora que você já está mais forte creio que tem capacidade de o ajudar... Boa sorte!", cid, 6)
			end
		elseif((npcSys:isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Se cuide!", cid)
			npcSys:removeFocus(cid)	
		end
	end
end

function onCreatureDisappear(cid) npcSys:onCreatureDisappear(cid) end
function onPlayerCloseChannel(cid) npcSys:onPlayerCloseChannel(cid) end
function onThink() npcSys:onThink() end