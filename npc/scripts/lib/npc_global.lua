function setTopic(cid, topic)
	local state = getNpcState(cid)
	state.topic = topic
	setNpcState(state, cid)
end

function getTopic(cid)
	local state = getNpcState(cid)
	return state.topic
end

function testScope()
	print("Estou lendo aqui!")
end