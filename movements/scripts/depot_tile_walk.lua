function onStepIn(cid, item, pos, frompos)
	--could be a scripted depot tile item
	if(item.actionid > 0) then
		return TRUE
	end

	doTeleportThing(cid, frompos)
	return FALSE
end
