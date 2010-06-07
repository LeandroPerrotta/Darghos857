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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Já existe uma enquete ativa.")
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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não existe nenhuma enquete aberta no momento.")
		return false	
	end

	Polls.BroadcastMessage()

	local minleft = (Polls.enddate - os.time()) / 60

	local info = "Informações basicas sobre o sistema de enquetes rápidas:\n"
	info = info .. "Você pode votar entre sim e não, leia o assunto e responda se você concorda com o comando !vote sim ou caso você não concorda com !vote nao.\n"
	info = info .. "As enquetes possuem um tempo em que ficam ativas, e após este tempo não é possivel mais votar. Esta enquete irá expirar em " .. minleft .. " minutos.\n"
	info = info .. "As enquetes possuem um level minimo na qual o jogador poderá votar, no caso, esta enquete o nivel minimo para votar é " .. Polls.minlevel .. ".\n"
	
	broadcastMessage(info, MESSAGE_TYPES["orange"])
	
	info = "O resultado parcial da enquete é exibido de tempos em tempos, e ao final da enquete será exibido o resultado final.\n"
	info = info .. "Para visualizar novamente esta mensagem digite o comando !voteinfo."
	
	broadcastMessage(info, MESSAGE_TYPES["orange"])
	
	return true
end

function Polls.InfoPlayer(cid)

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não existe nenhuma enquete aberta no momento.")
		return false	
	end

	Polls.PlayerMessage()

	local minleft = (Polls.enddate - os.time()) / 60

	local info = "Informações basicas sobre o sistema de enquetes rápidas:\n"
	info = info .. "Você pode votar entre sim e não, leia o assunto e responda se você concorda com o comando !vote sim ou caso você não concorda com !vote nao.\n"
	info = info .. "As enquetes possuem um tempo em que ficam ativas, e após este tempo não é possivel mais votar. Esta enquete irá expirar em " .. minleft .. " minutos.\n"
	info = info .. "As enquetes possuem um level minimo na qual o jogador poderá votar, no caso, esta enquete o nivel minimo para votar é " .. Polls.minlevel .. ".\n"
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, info)
	
	info = "O resultado parcial da enquete é exibido de tempos em tempos, e ao final da enquete será exibido o resultado final.\n"
	info = info .. "Para visualizar novamente esta mensagem digite o comando !voteinfo."
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, info)
	
	return true
end

function Polls.BroadcastMessage()
	broadcastMessage("Enquete: " .. Polls.message, MESSAGE_TYPES["green"])
end

function Polls.PlayerMessage()
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Enquete: " .. Polls.message, MESSAGE_TYPES["green"])
end

function Polls.ParcialResult()
	broadcastMessage("Resultado parcial: Sim [" .. Polls.yes .." votos] - Não [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
end

function Polls.GMResult(cid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Resultado parcial: Sim [" .. Polls.yes .." votos] - Não [" .. Polls.no .. " votos]")
end

function Polls.FinalResult()
	if(Polls.yes > Polls.no) then
		broadcastMessage("Resultado final: [VENCEDOR] Sim [" .. Polls.yes .." votos] - Não [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
	elseif(Polls.yes < Polls.no) then
		broadcastMessage("Resultado final: [VENCEDOR] Não [" .. Polls.no .. " votos] - Sim [" .. Polls.yes .." votos]", MESSAGE_TYPES["green"])
	elseif(Polls.yes == Polls.no) then
		broadcastMessage("Resultado final: [EMPATE] Sim [" .. Polls.yes .." votos] - Não [" .. Polls.no .. " votos]", MESSAGE_TYPES["green"])
	end
end

function Polls.VoteYes(cid)
	local account_id = getAccountNumberByPlayerName(getPlayerName(cid))

	if(getPlayerLevel(cid) < Polls.minlevel) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Para votar nesta enquete é preciso ser level " .. Polls.minlevel .. " ou superior.")
		return false	
	end

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não existe nenhuma enquete aberta no momento.")
		return false	
	end

	if(isInArray(Polls.votes, account_id) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já votou para esta enquete.")
		return false
	end
	
	if(os.time() > Polls.enddate) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esta enquete já foi encerrada.")
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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Para votar nesta enquete é preciso ser level " .. Polls.minlevel .. " ou superior.")
		return false	
	end

	if(Polls.message == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não existe nenhuma enquete aberta no momento.")
		return false	
	end

	if(isInArray(Polls.votes, account_id) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já votou para esta enquete.")
		return false
	end
	
	if(os.time() > Polls.enddate) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esta enquete já foi encerrada.")
		return false	
	end
	
	table.insert(Polls.votes, account_id)
	Polls.no = Polls.no + 1
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O seu voto foi registrado com sucesso! Obrigado!")
	
	return true
end