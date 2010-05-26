function onStepIn(cid, item, position, fromPosition)
		
	if(item.actionid == aid.SALAZART_MEDUSAS_TP) then
		if(getPlayerStorageValue(cid, sid.SALAZART_MEDUSAS_ACCESS) ~= 1) then
			doTeleportThing(cid, getThingPos(uid.MEDUSA_TP_BACK))
			doSendMagicEffect(getThingPos(uid.MEDUSA_TP_BACK), CONST_ME_MAGIC_BLUE)
		else
			doTeleportThing(cid, getThingPos(uid.MEDUSA_TP_GO))
			doSendMagicEffect(getThingPos(uid.MEDUSA_TP_GO), CONST_ME_MAGIC_BLUE)
		end
	end

end
