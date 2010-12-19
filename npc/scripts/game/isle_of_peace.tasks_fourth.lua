local dialog = NpcDialog:new()
local npcSys = _NpcSystem:new()
npcSys:setDialog(dialog)

local npcTask = NpcTasks:new()
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SIXTH)
npcTask:registerTask(CAP_ONE.ISLAND_OF_PEACE.SEVENTH)
npcTask:setNpcSystem(npcSys)
npcTask:setDialog(dialog)

function onCreatureSay(cid, type, msg)
	msg = string.lower(msg)
	
	local kingTask = Task:new()
	kingTask:loadById(CAP_ONE.ISLAND_OF_PEACE.EIGHTH)
	kingTask:setPlayer(cid)	
	kingTask:setNpcName(getNpcName())		
	
	npcTask:setPlayer(cid)
	local distance = getDistanceTo(cid) or -1
	if((distance < npcSys:getTalkRadius()) or (distance ~= -1)) then
		if((msg == "hi" or msg == "hello" or msg == "ola") and not (npcSys:isFocused(cid))) then
		
			dialog:say("Ola ".. getCreatureName(cid) .."! Diga-me como posso lhe ajudar. S� n�o demore, n�o posso me destrair!", cid)
			npcSys:addFocus(cid)
		elseif(npcSys:isFocused(cid) and (msg == "task" or msg == "mission" or msg == "yes" or msg == "no")) then
			dialog:say("Desculpe " .. getCreatureName(cid) .. ", mas somente sei conversar em portugues.", cid)	
		elseif(npcSys:isFocused(cid) and (msg == "tarefa" or msg == "miss�o" or msg == "missao")) then
		
			if(kingTask:getState() ~= taskStats.COMPLETED and kingTask:checkPlayerRequirements()) then	
				dialog:say("Eu n�o tenho mais nenhuma tarefa para voc�, mas sei de algo que talvez lhe interesse, e envolve ajudar o Rei, quer saber mais?", cid)
				npcSys:setTopic(cid, 5)
			else
				npcTask:responseTask(cid)
			end	
		elseif(npcSys:isFocused(cid) and (msg == "n�o" or msg == "nao")) then
			dialog:say("Oh... Que pena, mas sem problemas! Ent�o o que deseja?", cid)
			npcSys:setTopic(cid, 0)
		elseif(npcSys:isFocused(cid) and msg == "sim") then
		
			if(npcSys:getTopic() == 2) then
				npcTask:sendTaskObjectives()
				npcSys:setTopic(cid, 3)
			elseif(npcSys:getTopic() == 3) then
				npcTask:sendTaskStart()
				npcSys:setTopic(cid, 0)
			elseif(npcSys:getTopic() == 4) then
				npcTask:onCompleteConfirm()
				npcSys:setTopic(cid, 0)	
			elseif(npcSys:getTopic() == 5) then	
				dialog:say("O Rei ficar� contente ".. getCreatureName(cid) .."! Ao sul desta port�o voc� encontrar� uma pequena ponte, atravessando-a entrar� num territorio desertico habitado por minotauros. Nele h� uma piramide destruida. A sua  tarefa � a seguinte: [...]", cid)
				dialog:say("Voc� deve entrar no sub-solo da piramide e decer at� o andar mais baixo. Note que est� � uma miss�o muito perigosa pois o sub-solo da piramide � recheada de minotaurs dos mais variados tipos, como minotaur archer, guard e mage [...]", cid, 6)
				dialog:say("Para lhe auxiliar nesta miss�o foi dado na recompensa da tarefa dos an�es um stealth ring. Ao usar-lo, voc� ficar� invisivel e isso permitir� voc� andar entre os minotaurs, mas preste aten��o: [...]", cid, 6)
				dialog:say("Minotaurs Mage conseguem enchergar mesmo guerreiros que est�o invisiveis, portanto ser� necessario confrontar-los, portanto, tome muito cuidado. Outra coisa, n�o perca muito tempo pois o stealth ring tem dura��o de ap�nas 15 minutos! [...]", cid, 6)
				dialog:say("Quando voc� chegar no andar mais baixo voc� precisa encontrar uma reliquia real que foi roubada, ela provavelmente est� em algum ba�. Voc� deve pegar-la, sair da piramide e levar a reliquia ao Rei. Ele provavelmente lhe dar� uma valiosa recompensa!", cid, 6)
				dialog:say("Desejo boa sorte a voc� nesta tarefa!", cid, 6)
				kingTask:setStarted()
			end
		elseif((npcSys:isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya" or msg == "adeus")) then
			dialog:say("At�! E lembre-se: Tenha sempre cuidado fora da cidade!", cid)
			npcSys:removeFocus(cid)		
		end
	end
end

function onCreatureDisappear(cid) npcSys:onCreatureDisappear(cid) end
function onPlayerCloseChannel(cid) npcSys:onPlayerCloseChannel(cid) end
function onThink() npcSys:onThink() end