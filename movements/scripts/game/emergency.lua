function onStepIn(cid, item, position, fromPosition)
	
	if(position.x == 2813) then
		if(getPlayerLevel(cid) < 25) then
			doTeleportThing(cid, {x= 2815, y=1236 ,z=6})
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid, 25,'Only players level 25+ can own this quest.')
			return TRUE
		else
			
		end
	end

end
