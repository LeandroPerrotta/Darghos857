_NpcSystem = {
	talkRadius = 4,
	interactions = nil
}

function _NpcSystem:new()
	local obj = {}
	obj.interactions = {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function _NpcSystem:onCreatureSay(cid, type, message)
end

function _NpcSystem:onCreatureDisappear(cid)
end

function _NpcSystem:onPlayerCloseChannel(cid)
end

function _NpcSystem:onThink()
end

function _NpcSystem:addInteraction(interaction)
	table.insert(self.interactions, interaction)
end