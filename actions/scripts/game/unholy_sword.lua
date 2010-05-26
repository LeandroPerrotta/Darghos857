function onUse(cid, item, frompos, item2, topos)

	if(item2.actionid == aid.CHURCH_ALTAR) then
	
		doRemoveItem(item2.uid, 1)
	end
end