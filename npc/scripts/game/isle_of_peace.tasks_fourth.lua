local dialog = NpcDialog:new()

local npcTask = NpcTasks:new()
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SIXTH)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SEVENTH)
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
		dialog:say("Até mais!")
		removeFocus(cid)
	end
end

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	
	local kingTask = Task:new()
	kingTask:loadById(CAP_ONE.ISLAND_OF_PEACE.EIGHTH)
	kingTask:setPlayer(cid)	
	kingTask:setNpcName(getNpcName())		
	
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < TALK_RADIUS) or (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (isFocused(cid))) then
		
			dialog:say("Ola ".. getCreatureName(cid) .."! Diga-me como posso lhe ajudar. Só não demore, não posso me destrair!", cid)
			addFocus(cid)
		elseif(isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)	
		elseif(isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
		
			if(kingTask:getState() ~= taskStats.COMPLETED and kingTask:checkPlayerRequirements()) then	
				dialog:say("Eu não tenho mais nenhuma tarefa para você, mas sei de algo que talvez lhe interesse, e envolve ajudar o Rei, quer saber mais?", cid)
				setTopic(cid, 5)
			else
				npcTask:responseTask(cid)
			end	
		elseif(isFocused(cid) and (msg == "não" or msg == "nao")) then
			dialog:say("Oh... Que pena, mas sem problemas! Então o que deseja?", cid)
			setTopic(cid, 0)
		elseif(isFocused(cid) and msg == "sim") then
		
			if(getTopic() == 2) then
				npcTask:sendTaskObjectives()
				setTopic(cid, 3)
			elseif(getTopic() == 3) then
				npcTask:sendTaskStart()
				setTopic(cid, 0)
			elseif(getTopic() == 4) then
				npcTask:onCompleteConfirm()
				setTopic(cid, 0)	
			elseif(getTopic() == 5) then	
				dialog:say("O Rei ficará contente ".. getCreatureName(cid) .."! Ao sul desta portão você encontrará uma pequena ponte, atravessando-a entrará num territorio desertico habitado por minotauros. Nele há uma piramide destruida. A sua  tarefa é a seguinte: [...]", cid)
				dialog:say("Você deve entrar no sub-solo da piramide e decer até o andar mais baixo. Note que está é uma missão muito perigosa pois o sub-solo da piramide é recheada de minotaurs dos mais variados tipos, como minotaur archer, guard e mage [...]", cid, 6)
				dialog:say("Para lhe auxiliar nesta missão foi dado na recompensa da tarefa dos anões um stealth ring. Ao usar-lo, você ficará invisivel e isso permitirá você andar entre os minotaurs, mas preste atenção: [...]", cid, 6)
				dialog:say("Minotaurs Mage conseguem enchergar mesmo guerreiros que estão invisiveis, portanto será necessario confrontar-los, portanto, tome muito cuidado. Outra coisa, não perca muito tempo pois o stealth ring tem duração de apénas 15 minutos! [...]", cid, 6)
				dialog:say("Quando você chegar no andar mais baixo você precisa encontrar uma reliquia real que foi roubada, ela provavelmente está em algum baú. Você deve pegar-la, sair da piramide e levar a reliquia ao Rei. Ele provavelmente lhe dará uma valiosa recompensa!", cid, 6)
				dialog:say("Desejo boa sorte a você nesta tarefa!", cid, 6)
				kingTask:setStarted()
			end
		elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Até! E lembre-se: Tenha sempre cuidado fora da cidade!", cid)
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
				dialog:say("Até mais!")
				removeFocus(focus)
			end
		end
	end
	dialog:run()
	lookAtFocus()
end