-- Nothing --
dofile(getDataDir() .. "lib/polls.lua")

teleportto_usage = {}

function AddTpRequest(gm, player)
	table.insert(teleportto_usage, {["player"] = player, ["gamemaster"] = gm})
end

function GetTpRequest(player)

	for k,v in pairs(teleportto_usage) do 
		if(player == v["player"]) then
			return v["gamemaster"];
		end
	end
	
	return FALSE
end

function RemoveTpRequest(player)

	local index = nil

	for k,v in pairs(teleportto_usage) do 
		if(player == v["player"]) then
			index = k;
		end
	end

	if(index == nil) then
		return FALSE
	end

	table.remove(teleportto_usage, index)
	return TRUE
end