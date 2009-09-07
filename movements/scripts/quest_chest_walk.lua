function onStepIn(cid, item, pos, frompos)
	if item.actionid > 0 and item.actionid <= 65535 and isPlayer(cid) == TRUE then

		if frompos.x == 0 and frompos.y == 0 and frompos.z == 0 then
			frompos = getPlayerMasterPos(cid)
		end

		doTeleportThing(cid, frompos)
	end
	return TRUE
end