_NpcSystem = {
	talkRadius = 4,
	dialog = 0,
	focuses = nil,
	topics = nil
}

function _NpcSystem:new()
	local obj = {}
	obj.focuses = {}
	obj.topics = {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function _NpcSystem:getTalkRadius()
	return self.talkRadius
end

function _NpcSystem:setTopic(cid, topic)
	if(self.topics[cid] == nil) then
		table.insert(self.topics, cid, topic)
	else
		self.topics[cid] = topic
	end
end

function _NpcSystem:getTopic(cid)
	local topic = self.topics[cid]
	return topic
end

function _NpcSystem:isFocused(cid)
	for i, v in pairs(self.focuses) do
		if(v == cid) then
			return true
		end
	end
	return false
end

function _NpcSystem:addFocus(cid)
	if(not self:isFocused(cid)) then
		table.insert(self.focuses, cid)
	end
end

function _NpcSystem:removeFocus(cid)
	for i, v in pairs(self.focuses) do
		if(v == cid) then
			table.remove(self.focuses, i)
			break
		end
	end
	
	if(self.topics[cid] ~= nil) then
		self.topics[cid] = nil
	end
end

function _NpcSystem:lookAtFocus()
	for i, v in pairs(self.focuses) do
		if(isPlayer(v)) then
			doNpcSetCreatureFocus(v)
			return
		end
	end
	doNpcSetCreatureFocus(0)
end

function _NpcSystem:setDialog(dialog)
	self.dialog = dialog
end

function _NpcSystem:onCreatureSay(cid, type, message)
end

function _NpcSystem:onCreatureAppear(cid)
end

function _NpcSystem:onCreatureDisappear(cid)
	if(self:isFocused(cid)) then
		self.dialog:say("Mas que pressa!")
		self:removeFocus(cid)
	end
end

function _NpcSystem:onPlayerCloseChannel(cid)
	if(self:isFocused(cid)) then
		self.dialog:say("Hmph!")
		self:removeFocus(cid)
	end
end

function _NpcSystem:onThink()
	for i, focus in pairs(self.focuses) do
		if(not isCreature(focus)) then
			self:removeFocus(focus)
		else
			local distance = getDistanceTo(focus) or -1
			if((distance > self.talkRadius) or (distance == -1)) then
				self.dialog:say("Mas que pressa!")
				self:removeFocus(focus)
			end
		end
	end
	self.dialog:run()
	self:lookAtFocus()
end

function _NpcSystem:addInteraction(interaction)
	table.insert(self.interactions, interaction)
end