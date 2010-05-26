function onSay(cid, words, param)

	local outfit = getCreatureOutfit(cid)

	local message = "Look type: " .. outfit.lookType .. "\nLook head: " .. outfit.lookHead .. "\nLook body: " .. outfit.lookBody .. "\n Look legs: " .. outfit.lookLegs .. "\nLook feet: " .. outfit.lookFeet

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, message)

end
