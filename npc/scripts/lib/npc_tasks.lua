NpcTasks = {
	registeredTasks = nil,
	cid = 0,
	currentTask = 0,
	taskConf = 0,
	dialog = 0,
	_state = nil
}

function NpcTasks:new()
	local obj = {}
	obj.registeredTasks = {}
	obj._state = {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function NpcTasks:setPlayer(cid)
	self.cid = cid
end

function NpcTasks:setState(state)
	self._state = state
end

function NpcTasks:getState()
	return self._state
end

function NpcTasks:registerTask(taskid)
	table.insert(self.registeredTasks, taskid)
end

function NpcTasks:loadTask(taskid)
	self.currentTask = taskid
	self.taskConf = tasksList[taskid]
end

function NpcTasks:setDialog(dialog)
	self.dialog = dialog
end

function NpcTasks:responseTask(_state, cid)

	if(cid ~= nil) then
		self:setPlayer(cid)
	else
		if(self.cid ~= nil) then
			cid = self.cid
		else
			consoleLog(T_LOG_WARNING, "NpcTasks:responseTask", "No valid creature found.", {npc=getNpcName()})
		end
	end
	
	if(_state ~= nil) then
		self:setState(_state)
	else
		if(self._state ~= nil) then
			_state = self._state
		else
			consoleLog(T_LOG_WARNING, "NpcTasks:responseTask", "No valid _state found.", {npc=getNpcName()})
		end		
	end
	
	local startedTask = getPlayerStorageValue(cid, sid.TASK_STARTED)	
	consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "A player talking with NPC about tasks...", {npc=getNpcName(), player=getCreatureName(self.cid), startedTask=startedTask})
	
	-- verificamos se uma possivel task iniciada pelo player é uma das tasks do NPC
	if(startedTask ~= LUA_ERROR and isInArray(self.registeredTasks, startedTask) == FALSE) then
		-- se não for, é chamado um pedido de descrição, que deve mostrar
		-- os requerimentos para a task...
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "The player has an started task that is not from this NPC.")
		
		if(self:sendTaskDescription()) then
			consoleLog(T_LOG_ERROR, "NpcTasks:responseTask", "Player with a started task and this is not from the NPC has received description.", {player=getCreatureName(self.cid), startedTask=startedTask})
		end
		
		return
	end
	
	if(startedTask == LUA_ERROR) then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "NPC will talk to player about an task.")
		if(self:sendTaskDescription()) then
			_state.topic = 2
		end
	else
		local state = getPlayerStorageValue(cid, startedTask)
		
		if(state == taskStats.NONE or state == taskStats.COMPLETED) then
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "NPC will talk to player about an task.")
			if(self:sendTaskDescription()) then
				_state.topic = 2
			end
		elseif(state == taskStats.STARTED) then
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "NPC will check if the player has ended the task.")
			if(self:checkStatus()) then
				consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "All is ok! The player has done all requirements to complete task! We can now give the reward to him.")
				self:completed()
			end
		end		
	end
end

function NpcTasks:sendTaskDescription()

	for k, v in pairs(self.registeredTasks) do	
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "NPC will verify if the player know something about our tasks.", {taskid=v})
		if(getPlayerStorageValue(self.cid, v) == taskStats.NONE) then
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Yeah... Player not know nothing about this task.")
			self:loadTask(v)
			
			local requiredTask = self.taskConf.requiredTask 
			
			if(requiredTask ~= nil) then
				consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Oh, this task needs requirements to start, we need check it.")
							
				if(getPlayerStorageValue(self.cid, requiredTask) ~= taskStats.COMPLETED) then
					consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Haha! The player not have necessary requirements, we will talk to him... :(")
					self.dialog:say(self.taskConf.dialogs.requireTask, self.cid)
					return false
				end
			end
			
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "All is ok! Now we can talk to player about our task...")
			self.dialog:say(self.taskConf.dialogs.description, self.cid)
			return true
		end
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Oh shit! The player already know about this task... We go to next (if is necessary)")
	end
	
	consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Apparently the player already know about all our tasks... So we have notthing to him :(")
	self.dialog:say("Oh, desculpe mas não tenho nenhuma tarefa para você...", self.cid)
	return false	
end

function NpcTasks:sendTaskObjectives()

	consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Good! The player want help us! We will talk to him the task objetives!")
	local objective = self.taskConf.dialogs.taskObjectives

	if(type(objective) ~= "table") then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "The objectives is half, only one message needs!")
		self.dialog:say(objective, self.cid)
	else
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "The objectives is long, " .. # objective .. " messages are needs!")
		local isFirst = true
	
		for k,v in pairs(objective) do
			if(isFirst) then
				self.dialog:say(v, self.cid)
				isFirst = false
			else
				self.dialog:say(v, self.cid, 6)
			end
		end
	end	
end

function NpcTasks:sendTaskStart()

	consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Ok, the player has started our task! Good luck!")

	local task = Task:new()
	task:loadById(self.currentTask)
	task:setPlayer(self.cid)
	task:setStarted()
	self.dialog:say(self.taskConf.dialogs.taskStarted, self.cid)
	--nao podemos duplicar um creature event registrado =(
	--registerCreatureEvent(self.cid, "Tasks")
end

function NpcTasks:checkStatus()

	if(not (tasks.hasStartedTask(self.cid))) then
		consoleLog(T_LOG_ERROR, "NpcTasks:checkStatus", "Player not have an started task.", {player=getCreatureName(self.cid)})
		return false
	end
	
	local task = Task:new()
	
	local playerTask = tasks.getStartedTask(self.cid)
	self:loadTask(playerTask)
	
	if(not task:loadById(self.currentTask)) then
		consoleLog(T_LOG_ERROR, "NpcTasks:checkStatus", "The task initialized by player can not be loaded.", {player=getCreatureName(self.cid), taskid=self.currentTask})
		return false
	end
	
	task:setPlayer(self.cid)
	
	if(not (self:checkKills(task)) ) then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Oh shit! The player not have kill all monsters needed to complete task... We need talk to him it.")
		self.dialog:say(self.taskConf.dialogs.taskIncomplete, self.cid)
		return false
	end
	
	if(not (task:removeRequiredItems())) then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Oh shit! The player not have all required items to complete task... We need talk to him it.")
		self.dialog:say(self.taskConf.dialogs.taskIncomplete, self.cid)
		return false	
	end

	return true
end

function NpcTasks:checkKills(task)	
	local monsters = task:getMonsters()	

	if(task:getRequirePoints() == nil) then
		for key,value in pairs(monsters) do
			local killscount = task:getPlayerKillsCount(self.currentTask + value.storagePos)
			
			if(killscount < value.amount) then
				return false
			end
		end
	else
		local playerpoints = task:getPlayerKillsCount(self.currentTask + 1)
		
		if(playerpoints < task:getRequirePoints()) then
			return false
		end
	end
	
	return true
end

function NpcTasks:completed()

	if(not (tasks.hasStartedTask(self.cid))) then
		consoleLog(T_LOG_ERROR, "NpcTasks:completed", "Player not have an started task.", {player=getCreatureName(self.cid)})
		return false
	end

	local task = Task:new()

	local playerTask = tasks.getStartedTask(self.cid)
	self:loadTask(playerTask)	
	
	task:loadById(playerTask)
	task:setPlayer(self.cid)
	
	if(task:getState() == taskStats.COMPLETED) then
		consoleLog(T_LOG_ERROR, "NpcTasks:completed", "This player has already completed the task! Check It!", {player=getCreatureName(self.cid), taskid=self.currentTask})
		return false
	end
	
	self.dialog:say(self.taskConf.dialogs.taskCompleted[1], self.cid)
	
	task:setCompleted()	
	
	function giveRewards(task) 
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Giving the reward with an special delay! Is is beautiful!")
		task:doPlayerAddReward()			
	end
	
	addEvent(giveRewards, 1000 * 2, task)
	
	self.dialog:say(self.taskConf.dialogs.taskCompleted[2], self.cid)		
	
	if(self.taskConf.events ~=  nil) then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Not ends! Apparently we have an event! We will check it...")
		if(self.taskConf.events.onComplete ~= nil) then
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Yes! We have an onComplete event!")
			self:eventOnComplete(self.taskConf.events.onComplete)
		end
	end
end

function NpcTasks:eventOnComplete(infos)
	
	if(infos.type == nil) then
		consoleLog(T_LOG_WARNING, "NpcTasks:eventOnComplete", "Event type not found.", {player=getCreatureName(self.cid), taskid=self.currentTask})
	elseif(infos.type == "question") then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Ok, the event is an question!")
		self.dialog:say(infos.text, self.cid)
		self._state.topic = 4
		
		if(infos.action ~= nil) then
			if(infos.action == "setState") then
				if(infos.confirmParam == nil) then
					consoleLog(T_LOG_WARNING, "NpcTasks:eventOnComplete", "Unknown param for setState.", {player=getCreatureName(self.cid), taskid=self.currentTask})
				else
					consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "The event has an custom setTopic!", {topic=infos.confirmParam})
					self._state.topic = infos.confirmParam
				end
			end
		end
	end	
end

function NpcTasks:onCompleteConfirm()
	
	consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Okey, the player has interacted with our onComplete event!")

	if(self.taskConf.events == nil or self.taskConf.events.onComplete == nil) then
		consoleLog(T_LOG_WARNING, "NpcTasks:onCompleteConfirm", "Task dont have any event.", {player=getCreatureName(self.cid), taskid=self.currentTask})
		return
	end

	local infos = self.taskConf.events.onComplete
	
	if(infos.onConfirm == nil)  then
		consoleLog(T_LOG_WARNING, "NpcTasks:onCompleteConfirm", "Unknown onConfirm event.", {player=getCreatureName(self.cid), taskid=self.currentTask})
		return
	end
	
	if(infos.onConfirm == "action") then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "The solution of event is an action...")
		if(infos.confirmParam == "callResponseTask") then
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "... and the action is an callResponseTask (talk about anther task?)")
			self:responseTask()
		else
			consoleLog(T_LOG_WARNING, "NpcTasks:onCompleteConfirm", "Unknown param for action.", {player=getCreatureName(self.cid), taskid=self.currentTask, param=infos.confirmParam})
		end
	elseif(infos.onConfirm == "teleport") then
		
		local destPos = infos.confirmParam
		
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "... and the action is an teleport event!", destPos)
		
		function teleportPlayer(cid, destPos)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, destPos)
			doSendMagicEffect(destPos, CONST_ME_TELEPORT)
			consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Ok, teleport with delay done!")
		end
		
		addEvent(teleportPlayer, 1000 * 3, self.cid, destPos)
	end
	
	if(infos.onConfirmText ~= nil) then
		consoleLog(T_LOG_NOTIFY, "NpcTasks:responseTask", "Okey, we have an final message to player!")
		self.dialog:say(infos.onConfirmText, self.cid)
	end
end