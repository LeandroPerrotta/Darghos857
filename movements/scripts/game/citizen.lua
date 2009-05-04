function onStepIn(cid, item, position, fromPosition)
	if(item.actionid > 30020 and item.actionid < 30100) then
	local city = getTownName(item.actionid - 30020)
		doPlayerSetTown(cid, item.actionid - 30020)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT,"Now you are a citizen of "..city..".")
	end
	return TRUE
end
