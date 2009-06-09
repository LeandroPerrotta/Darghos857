function onSay(cid, words, param)



	if(getPlayerStorageValue( then
		first = "Completed"
	else
		first = "Non-Completed"
	end
	
	if(getPlayerStorageValue(cid, 500000+1) == 1) then
		second = "Completed"
	else
		second = "Non-Completed"
	end
	
	if(getPlayerStorageValue(cid, 500000+2) == 1) then
		third = "Completed"
	else
		third = "Non-Completed"
	end	
	
	if(getPlayerStorageValue(cid, 500000+3) == 1) then
		fourth = "Completed"
	else
		fourth = "Non-Completed"
	end	
	
	if(getPlayerStorageValue(cid, 500000+4) == 1) then
		fifth = "Completed"
	else
		fifth = "Non-Completed"
	end	
	
	if (getPlayerStorageValue(cid, 500000+0) == 1) and (getPlayerStorageValue(cid, 500000+1) == 1) and (getPlayerStorageValue(cid, 500000+2) == 1) and (getPlayerStorageValue(cid, 500000+3) == 1) and (getPlayerStorageValue(cid, 500000+4) == 1) then
		aol = "You have all blesses and your item/backpack loss is FULL SECURE!"
	else	
		aol = "You dont have all blesses and your item/back not is secure, and go drop when you die."
	end
	
	local message = "Here you can see if you have completed the blesses, or no.\n\nFirst Bless      = "..first.."(Quendor)\n\nSecond Bless      = "..second.."(Thorn)\n\nThird Bless      = "..third.."(Aracura)\n\nFourth Bless      = "..fourth.."(Thaun)\n\nFifth Bless      = "..fifth.."(Salazart)\n\nItem drop:\n"..aol..""
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, message)

	
end