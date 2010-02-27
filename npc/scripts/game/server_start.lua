local _serverStart = false

function onThink()

	if(not _serverStart) then
	
		Dungeons.onServerStart()
		_serverStart = true
	end
end 