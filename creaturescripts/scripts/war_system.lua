function onKill(cid, target)

	local creature = getCreatureName(target)
	
	if(isPlayer(cid) == TRUE) and (isPlayer(target) == TRUE) then
		if(isOfWar(cid) and isOfWar(target)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Gratz! You murdered player "..creature..".\nBoth guilds are in a state of war, then this death was justified.")
			doSendMagicEffect(getPlayerPosition(cid), 29)
			doSendAnimatedText(getPlayerPosition(cid), "WAR FRAG!", TEXTCOLOR_YELLOW)
		end
	end
	
end