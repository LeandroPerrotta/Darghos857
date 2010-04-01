function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	
	if(item.itemid == 5957) then
	
		a = math.random(1,100)
		
		if(a < 5) then
				doPlayerAddItem(cid,5958,1)
				doSendMagicEffect(fromPosition, 30)
				doRemoveItem(item.uid)				
				doCreatureSay(cid, "Winning Ticket!! OmG!1!1!", TALKTYPE_ORANGE_1)
		else
			doCreatureSay(cid, "Try again, never give up.", TALKTYPE_ORANGE_1)	
			doSendMagicEffect(fromPosition, 2)	
			doPlayerRemoveItem(cid,item.itemid,1)			
		end
	end
	
end
