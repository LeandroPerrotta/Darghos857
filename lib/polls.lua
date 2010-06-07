Polls = {
	--_singleton = nil
	message = "",
	enddate = 0,
	time = 0,
	minlevel = 0,
	yes = 0,
	no = 0,
	votes = {}	
}	

function Polls.Create(cid, msg, time, minlevel)

	if(Polls.message ~= "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "J� existe uma enquete ativa.")
		return false
	end
	
	Polls.message = msg
	Polls.enddate = os.time() + (time * 60)
	Polls.time = time
	Polls.minlevel = minlevel
	
	Polls.Info()
	
	addEvent(Polls.ParcialResult, 1000 * 60 * 2)
	addEvent(Polls.ParcialResult, 1000 * 60 * 4)
	addEvent(Polls.ParcialResult, 1000 * 60 * 6)
	addEvent(Polls.ParcialResult, 1000 * 60 * 8)
	addEvent(Polls.ParcialResult, 1000 * 60 * 2)
	addEvent(Polls.FinalResult, 1000 * 60 * time + (10000))
	
	return true
end

function Polls.Info(cid)

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "N�o existe nenhuma enquete aberta no momento.")
		return false	
	end

	Polls.BroadcastMessage()

	local minleft = (Polls.enddate - os.time()) / 60

	local info = "Informa��es basicas sobre o sistema de enquetes r�pidas:\n"
	info = info .. "Voc� pode votar entre sim e n�o, leia o assunto e responda se voc� concorda com o comando !vote sim ou caso voc� n�o concorda com !vote nao.\n"
	info = info .. "As enquetes possuem um tempo em que ficam ativas, e ap�s este tempo n�o � possivel mais votar. Esta enquete ir� expirar em " .. minleft .. " minutos.\n"
	info = info .. "As enquetes possuem um level minimo na qual o jogador poder� votar, no caso, esta enquete o nivel minimo para votar � " .. Polls.minlevel .. ".\n"
	
	broadcastMessage(info, MESSAGE_TYPES["orange"])
	
	info = "O resultado parcial da enquete � exibido de tempos em tempos, e ao final da enquete ser� exibido o resultado final.\n"
	info = info .. "Para visualizar novamente esta mensagem digite o comando !voteinfo."
	
	broadcastMessage(info, MESSAGE_TYPES["orange"])
	
	return true
end

function Polls.BroadcastMessage()
	broadcastMessage("Enquete: " .. Polls.message, MESSAGE_TYPES["green"])
end

function Polls.ParcialResult()
	broadcastMessage("Resultado parcial: Sim [" .. Polls.yes .." votos] - N�o [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
end

function Polls.GMResult(cid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Resultado parcial: Sim [" .. Polls.yes .." votos] - N�o [" .. Polls.no .. " votos]")
end

function Polls.FinalResult()
	if(Polls.yes > Polls.no) then
		broadcastMessage("Resultado final: [VENCEDOR] Sim [" .. Polls.yes .." votos] - N�o [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
	elseif(Polls.yes < Polls.no) then
		broadcastMessage("Resultado final: [VENCEDOR] N�o [" .. Polls.no .. " votos] - Sim [" .. Polls.yes .." votos]", MESSAGE_TYPES["green"])
	elseif(Polls.yes == Polls.no) then
		broadcastMessage("Resultado final: [EMPATE] Sim [" .. Polls.yes .." votos] - N�o [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
	end
end

function Polls.VoteYes(cid)
	local account_id = getAccountNumberByPlayerName(getPlayerName(cid))

	if(getPlayerLevel(cid) < Polls.minlevel) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Para votar nesta enquete � preciso ser level " .. Polls.minlevel .. " ou superior.")
		return false	
	end

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "N�o existe nenhuma enquete aberta no momento.")
		return false	
	end

	if(isInArray(Polls.votes, account_id) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� j� votou para esta enquete.")
		return false
	end
	
	if(os.time() > Polls.enddate) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esta enquete j� foi encerrada.")
		return false	
	end
	
	table.insert(Polls.votes, account_id)
	Polls.yes = Polls.yes + 1
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O seu voto foi registrado com sucesso! Obrigado!")
	
	return true
end

function Polls.VoteNo(cid)
	local account_id = getAccountNumberByPlayerName(getPlayerName(cid))

	if(getPlayerLevel(cid) < Polls.minlevel) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Para votar nesta enquete � preciso ser level " .. Polls.minlevel .. " ou superior.")
		return false	
	end

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "N�o existe nenhuma enquete aberta no momento.")
		return false	
	end

	if(isInArray(Polls.votes, account_id) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� j� votou para esta enquete.")
		return false
	end
	
	if(os.time() > Polls.enddate) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esta enquete j� foi encerrada.")
		return false	
	end
	
	table.insert(Polls.votes, account_id)
	Polls.no = Polls.no + 1
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O seu voto foi registrado com sucesso! Obrigado!")
	
	return true
end