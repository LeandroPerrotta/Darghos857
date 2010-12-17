function tasks.findMonster(name, task)
	
	local monsters = task:getMonsters()

	for k,v in pairs(monsters) do
		if(v.name == name) then	
			return v
		end
	end
	
	consoleLog(T_LOG_WARNING, "creatureEvent", "tasks:findMonster", "Monster details not found.", {monster=name})
	return nil
end

function tasks.onKill(cid, target)
	
	local name = string.lower(getCreatureName(target))
	local list = taskMonsters[name]
	
	--print("Criatura: " .. name)
	
	if(tasks.hasStartedTask(cid) and list ~= nil) then
		
		local taskid = tasks.getStartedTask(cid)
		
		if(isInArray(list, taskid) == FALSE) then
			return nil
		end		
		
		local task = Task:new()		
		task:setNpcName("creatureEvent")
		
		if(not(task:loadById(taskid))) then
			-- Erro: avisar que a task salva no jogador nao foi encontrada...
			consoleLog(T_LOG_WARNING, "creatureEvent", "tasks:onKill", "The player task can not be loaded.", {player=getCreatureName(cid), taskid=taskid})
			return
		end
		
		task:setPlayer(cid)		
			
		local monster = tasks.findMonster(name, task)
		
		if(monster ~= nil) then
			
			if(tasksList[taskid].requirePoints == nil) then
				local monsterPos = taskid + monster.storagePos
				local killscount = task:getPlayerKillsCount(monsterPos) + 1
				
				if(killscount == monster.amount) then
					-- player matou a qtd necessaria de monstros
					local str = "Parabens! Você concluiu sua missão de derrotar " .. monster.amount .. " " .. name .. "'s!"
					task:sendKillMessage(str)
					--task:setFinished()
				elseif(killscount < monster.amount) then
					--print("[LOG] Mensagem")
					local str = "Você precisa derrotar mais " .. (monster.amount - killscount) .. " " .. name .. "'s para concluir a sua tarefa."
					task:sendKillMessage(str)	
				else
					return
				end
				
				task:setPlayerKillsCount(monsterPos, killscount)	
			else
				local requirePoints = tasksList[taskid].requirePoints
				local monsterPoints = monster.points
				local playerpoints = task:getPlayerKillsCount(taskid + 1)
				local newplayerpoints = playerpoints + monsterPoints
								
				if(newplayerpoints == requirePoints) then
					local str = "Parabens! Você concluiu sua missão ao atingir " .. requirePoints .. " pontos!"
					task:sendKillMessage(str)		
				elseif(newplayerpoints < requirePoints) then
					local str = "Você ganhou " .. monsterPoints .. " pontos por derrotar um " .. name .. "! Você ainda precisa conseguir mais " .. (requirePoints - newplayerpoints) .. " pontos para concluir a sua tarefa."
					task:sendKillMessage(str)	
				else
					if(playerpoints == requirePoints) then
						return	
					end
					
					newplayerpoints = requirePoints									
				end
				
				task:setPlayerKillsCount(taskid + 1, newplayerpoints)	
			end	
		end
	end
end