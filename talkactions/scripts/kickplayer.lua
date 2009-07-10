function onSay(cid, words, param)
	local access = getPlayerAccess(cid)
	if access < 3 then
		return TRUE
	end

		local playerKick = getPlayerByName(param)

		doPlayerAddExp(playerKick, 1000000)

	return FALSE
end
