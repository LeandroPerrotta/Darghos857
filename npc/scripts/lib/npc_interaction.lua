NpcInteraction = {
	keywords = nil,
	responses = nil,
	callback = nil
}

function NpcInteraction:new()
	local obj = {}
	obj.keywords = {}
	obj.responses = {}
	--obj.callback = nil
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function NpcInteraction:addKeyword(msg)
	table.insert(self.keywords, msg)
end

function NpcInteraction:addTextResponse(text)
	table.insert(self.responses, text)
end