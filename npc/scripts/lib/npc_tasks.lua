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
			print("[WARNING] NpcTasks:responseTask :: No valid creature found")
		end
	end
	
	if(_state ~= nil) then
		self:setState(_state)
	else
		if(self._state ~= nil) then
			_state = self._state
		else
			print("[WARNING] NpcTasks:responseTask :: No valid _state found")
		end		
	end
	
	local startedTask = getPlayerStorageValue(cid, sid.TASK_STARTED)	
	
	if(isInArray(self.registeredTasks, startedTask) == FALSE) then
		if(self:sendTaskDescription()) then
			_state.topic = 2		
		end
		
		return
	end
	
	if(startedTask == LUA_ERROR) then
		if(self:sendTaskDescription()) then
			_state.topic = 2
		end
	else
		local state = getPlayerStorageValue(cid, startedTask)
		
		if(state == taskStats.NONE or state == taskStats.COMPLETED) then
			if(self:sendTaskDescription()) then
				_state.topic = 2
			end
		elseif(state == taskStats.STARTED) then
			if(self:checkStatus()) then
				self:completed()
			end
		end		
	end
end

function NpcTasks:sendTaskDescription()

	for k, v in pairs(self.registeredTasks) do	
		if(getPlayerStorageValue(self.cid, v) == taskStats.NONE) then
			self:loadTask(v)
			
			local requiredTask = self.taskConf.requiredTask 
			
			if(requiredTask ~= nil) then
				if(getPlayerStorageValue(self.cid, requiredTask) ~= taskStats.COMPLETED) then
					self.dialog:say(self.taskConf.dialogs.requireTask, self.cid)
					return false
				end
			end
			
			self.dialog:say(self.taskConf.dialogs.description, self.cid)
			return true
		end
	end
	
	self.dialog:say("Oh, desculpe mas não tenho nenhuma tarefa para você...", self.cid)
	return false	
end

function NpcTasks:sendTaskObjectives()

	local objective = self.taskConf.dialogs.taskObjectives

	if(type(objective) ~= "table") then
		self.dialog:say(objective, self.cid)
	else
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
		print("[WARNING] NpcTasks.checkStatus :: Player not have an started task")
		return false
	end
	
	local task = Task:new()
	
	local playerTask = tasks.getStartedTask(self.cid)
	self:loadTask(playerTask)
	
	if(not task:loadById(self.currentTask)) then
		print("[WARNING] NpcTasks.checkStatus :: Cannot load a task")
		return false
	end
	
	task:setPlayer(self.cid)
	
	if(not (self:checkKills(task)) ) then
		self.dialog:say(self.taskConf.dialogs.taskIncomplete, self.cid)
		return false
	end
	
	if(not (task:removeRequiredItems())) then
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
		print("[WARNING] NpcTasks.completed :: Player not have an started task")
		return false
	end

	local task = Task:new()

	local playerTask = tasks.getStartedTask(self.cid)
	self:loadTask(playerTask)	
	
	task:loadById(self.currentTask)
	task:setPlayer(self.cid)
	
	self.dialog:say(self.taskConf.dialogs.taskCompleted[1], self.cid)
	
	function giveRewards(task)
		task:doPlayerAddReward()
		task:doPlayerAddRewardItems()				
	end
	
	task:setCompleted()	
	addEvent(giveRewards, 1000 * 2, task)
	
	self.dialog:say(self.taskConf.dialogs.taskCompleted[2], self.cid)		
	
	if(self.taskConf.events ~=  nil) then
		if(self.taskConf.events.onComplete ~= nil) then
			self:eventOnComplete(self.taskConf.events.onComplete)
		end
	end
end

function NpcTasks:eventOnComplete(infos)
	
	if(infos.type == "question") then
		self.dialog:say(infos.text, self.cid)
		self._state.topic = 4
		
		if(infos.action == "setState") then
			if(infos.confirmParam == nil) then
				print("[WARNING] NpcTasks:onCompleteConfirm :: Unknown param for setState: {taskid=" .. self.taskid .. "}")
			else
				self._state.topic = infos.confirmParam
			end
		end
	end	
end

function NpcTasks:onCompleteConfirm()
	local infos = self.taskConf.events.onComplete
	
	if(infos.onConfirm == "action") then
		if(infos.confirmParam == "callResponseTask") then
			self:responseTask()
		else
			print("[WARNING] NpcTasks:onCompleteConfirm :: Unknown param for action: {taskid=" .. self.taskid .. ", confirmParam=".. infos.confirmParam .. "}")
		end
	elseif(infos.onConfirm == "teleport") then
		local destPos = infos.confirmParam
		
		function teleportPlayer(cid, destPos)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, destPos)
			doSendMagicEffect(destPos, CONST_ME_TELEPORT)			
		end
		
		addEvent(teleportPlayer, 1000 * 3, self.cid, destPos)
	end
	
	if(infos.onConfirmText ~= nil) then
		self.dialog:say(infos.onConfirmText, self.cid)
	end
end