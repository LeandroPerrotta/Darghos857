function onStepIn(cid, item, pos, frompos)
	if item.actionid > 0 and item.actionid <= 65535 and isPlayer(cid) == TRUE then
		doTeleportThing(cid, frompos)
	end
	return TRUE
end