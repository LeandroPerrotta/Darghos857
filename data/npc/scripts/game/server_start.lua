local _serverStart = false

function onThink()

	if(not _serverStart) then
	
		onServerStart()
		_serverStart = true
	end
end 