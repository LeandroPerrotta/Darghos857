function onUse(cid, item, fromPosition, itemEx, toPosition)

	local npos = mcord.POI_TP_NPOS_GRAVESTONE
	
	if item.actionid == aid.POI_GRAVESTONE_USE and item.itemid == 1409 then
		doSendMagicEffect(getPlayerPosition(cid), 11)
		doTeleportThing(cid,npos)
		doSendMagicEffect(npos, 11)
	end

end
