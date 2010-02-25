local _lastMessage = 0
local _messageCache = {}

function AgendarMensagem(_message, _time)		
			
	if(_time == nil) then
		_time = 1
	end	
	
	table.insert(_messageCache, {msgStr=_message, timer = os.time() + _time})
end

function onCreatureMove(creature, oldPos, newPos)
	
	if(isPlayer(creature) == TRUE) then
		
		local distanceDiff = getDistanceBetween(getNpcPos(), newPos)
	
		if(distanceDiff <= 8) then
	
			local _questStats = getPlayerStorageValue(creature, QUESTLOG.ARIADNE.STORAGE_ID)
			
			if(_questStats == 2) then	
			
				--Isto preve que sejam enviadas muitas mensagens quandos varios players chegarem ao mesmo instante no local
				if(os.time() > _lastMessage + (60 * 5)) then
				
					selfSay("ALTO!!")					
					AgendarMensagem("Finalmente chegaram! N�o pensei que demorariam tanto! Estou a espera de voc�s a dias! Tomem cuidado, o Rei Ordon pediu que lhe desse instru��es, esta � a entrada de Ariadne Lair. Precisa se apressar a encontrar Ariadne e seus seguidores para que possa conseguir coletar os ingredintes necessarios para o antidoto da princesa... Boa sorte rapaz!")			
					
					_lastMessage = os.time()
				end
				
				setPlayerStorageValue(creature, QUESTLOG.ARIADNE.STORAGE_ID, 3)
			end	
		
		end
	end
end 

function onThink()
	
	for pos, msgInfos in pairs(_messageCache) do
		if(os.time() >= msgInfos.timer) then
			selfSay(msgInfos.msgStr)
			_messageCache[pos] = nil		
		end
	end
end 