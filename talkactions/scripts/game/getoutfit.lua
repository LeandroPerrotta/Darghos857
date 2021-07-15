function onSay(cid, words, param)

	local outfit = getCreatureOutfit(cid)
	
	local message = "<look type=\"".. outfit.lookType .."\" head=\"".. outfit.lookHead .."\" body=\"".. outfit.lookBody .."\" legs=\"".. outfit.lookLegs .."\" feet=\"".. outfit.lookFeet .."\" addons=\"".. outfit.lookAddons .."\"/>"   

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, message)

end
