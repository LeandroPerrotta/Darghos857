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

	if(self.messages[cid] == nil) then
		table.insert(self.messages, creature, {msgQueue = {}, lastMessage = 0})
	end

	if(delay == nil) then
		delay = NPC_DIALOG_INTERVAL
	end
	
	self:delay(delay, creature)
	
	local prop = {msgStr=message}
	table.insert(self.messages[creature].msgQueue, prop)
end

function NpcDialog:delay(seconds, cid)


	if(cid ~= nil) then
		if(self.messages[cid] == nil) then
			table.insert(self.messages, cid, {lastMessage = 0})
		end
	
		if(self.messages[cid] == nil or self.messages[cid].lastMessage == 0) then
			self.messages[cid].lastMessage = os.time() + seconds
		else
			if(os.time() > self.messages[cid].lastMessage) then
				self.messages[cid].lastMessage = os.time() + seconds
			else
				self.messages[cid].lastMessage = self.messages[cid].lastMessage + seconds
			end
		end
	
		table.insert(self.messages[cid].msgQueue, {delay=self.messages[cid].lastMessage})	
	else
		debugPrint("Deprecated use of function delay(seconds) on NpcDialog class, use delay(seconds, cid).")
	
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
end

function NpcDialog:run()

	--print(table.show(self.messages))

	for cid,value in pairs(self.messages) do	
	
		if(value.msgQueue ~= nil) then
			for k,msgInfo in pairs(value.msgQueue) do
				if(msgInfo.delay ~= nil) then
					if(os.time() <= msgInfo.delay) then
						break
					end
					
					self.messages[cid].msgQueue[k] = nil
				else
					--[[
					if(msgInfo.msgStr ~= nil) then
						if(msgInfo.cid == nil) then
							selfSay(msgInfo.msgStr)
						else
					]]--
					selfSay(msgInfo.msgStr, cid)
					--	end
					--end
					
					self.messages[cid].msgQueue[k] = nil	
				end		
			end	
		end
	end
end