local dialog = NpcDialog:new()
local npcSys = _NpcSystem:new()
npcSys:setDialog(dialog)

local npcTask = NpcTasks:new(npcSys)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SIXTH)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SEVENTH)
--npcTask:setNpcSystem(npcSys)
npcTask:setDialog(dialog)

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	
	--local kingTask = Task:new()
	--kingTask:loadById(CAP_ONE.ISLAND_OF_PEACE.EIGHTH)
	--kingTask:setPlayer(cid)	
	--kingTask:setNpcName(getNpcName())		
	
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < npcSys:getTalkRadius()) and (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (npcSys:isFocused(cid))) then
		
			dialog:say("Ola ".. getCreatureName(cid) .."! Diga-me como posso lhe ajudar. Só não demore, não posso me destrair!", cid)
			npcSys:addFocus(cid)
		elseif(npcSys:isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)	
		elseif(npcSys:isFocused(cid) and (msg == "tarefa" or msg == "missão" or msg == "missao")) then
		
			--if(kingTask:getState() ~= taskStats.COMPLETED and kingTask:checkPlayerRequirements()) then	
				--dialog:say("Eu não tenho mais nenhuma tarefa para você, mas sei de algo que talvez lhe interesse, e envolve ajudar o Rei, quer saber mais?", cid)
				--npcSys:setTopic(cid, 5)
			--else
				npcTask:responseTask(cid)
			--end	
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
				dialog:say("O Rei ficará contente ".. getCreatureName(cid) .."! Ao sul desta portão você encontrará uma pequena ponte, atravessando-a entrará num territorio desertico habitado por minotauros. Nele há uma piramide destruida. A sua  tarefa é a seguinte: [...]", cid)
				dialog:say("Você deve entrar no sub-solo da piramide e decer até o andar mais baixo. Note que está é uma missão muito perigosa pois o sub-solo da piramide é recheada de minotaurs dos mais variados tipos, como minotaur archer, guard e mage [...]", cid, 6)
				dialog:say("Para lhe auxiliar nesta missão foi dado na recompensa da tarefa dos anões um stealth ring. Ao usar-lo, você ficará invisivel e isso permitirá você andar entre os minotaurs, mas preste atenção: [...]", cid, 6)
				dialog:say("Minotaurs Mage conseguem enchergar mesmo guerreiros que estão invisiveis, portanto será necessario confrontar-los, portanto, tome muito cuidado. Outra coisa, não perca muito tempo pois o stealth ring tem duração de apénas 15 minutos! [...]", cid, 6)
				dialog:say("Quando você chegar no andar mais baixo você precisa encontrar uma reliquia real que foi roubada, ela provavelmente está em algum baú. Você deve pegar-la, sair da piramide e levar a reliquia ao Rei. Ele provavelmente lhe dará uma valiosa recompensa!", cid, 6)
				dialog:say("Desejo boa sorte a você nesta tarefa!", cid, 6)
				kingTask:setStarted()
			end
		elseif((npcSys:isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("Até! E lembre-se: Tenha sempre cuidado fora da cidade!", cid)
			npcSys:removeFocus(cid)		
		end
	end
end

function onCreatureDisappear(cid) npcSys:onCreatureDisappear(cid) end
function onPlayerCloseChannel(cid) npcSys:onPlayerCloseChannel(cid) end
function onThink() npcSys:onThink() end