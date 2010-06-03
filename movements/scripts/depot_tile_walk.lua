function onStepIn(cid, item, pos, frompos)
	--could be a scripted depot tile item
	if(item.actionid > 0 or isPlayer(cid) == FALSE) then
		return TRUE
	end

	if frompos.x == 0 and frompos.y == 0 and frompos.z == 0 then
		frompos = getPlayerMasterPos(cid)
	end

	local creature = getThingFromPos(pos)

	if(isPlayer(creature) == TRUE) then
		doTeleportThing(cid, frompos)
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end

	return TRUE
end

