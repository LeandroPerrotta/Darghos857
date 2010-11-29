NPC_DIALOG_INTERVAL = 1

NpcDialog = {
	lastMessage = 0,
	delays = nil,
	messages = nil
}

function NpcDialog:new()
	local obj = {}
	obj.delays = {}
	obj.messages = {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function NpcDialog:say(message, creature, delay)	
	
	if(delay == nil) then
		delay = NPC_DIALOG_INTERVAL
	end
	
	self:delay(delay)
	
	local prop = {msgStr=message}
	
	if(creature ~= nil) then
		prop = {msgStr=message, cid=creature}
	end
	
	table.insert(self.messages, prop)
end

function NpcDialog:delay(seconds)

	if(self.lastMessage == 0) then
		self.lastMessage = os.time() + seconds
	else
		if(os.time() > self.lastMessage) then
			self.lastMessage = os.time() + seconds
		else
			self.lastMessage = self.lastMessage + seconds
		end
	end

	table.insert(self.messages, {delay=self.lastMessage})
end

function NpcDialog:run()

	--print(table.show(self.messages))

	for pos, msgInfo in pairs(self.messages) do	
	
		if(msgInfo.delay ~= nil) then
			if(os.time() <= msgInfo.delay) then
				break
			end
			
			self.messages[pos] = nil
		else
			if(msgInfo.msgStr ~= nil) then
				if(msgInfo.cid == nil) then
					selfSay(msgInfo.msgStr)
				else
					selfSay(msgInfo.msgStr, msgInfo.cid)
				end
			end
			
			self.messages[pos] = nil	
		end
	end
end