function onSay(cid, words, param)



	if(getPlayerBless(cid, 1)) then
		first = "Completed"
	else
		first = "Non-Completed"
	end
	
	if(getPlayerBless(cid, 2)) then
		second = "Completed"
	else
		second = "Non-Completed"
	end
	
	if(getPlayerBless(cid, 3)) then
		third = "Completed"
	else
		third = "Non-Completed"
	end	
	
	if(getPlayerBless(cid, 4)) then
		fourth = "Completed"
	else
		fourth = "Non-Completed"
	end	
	
	if(getPlayerBless(cid, 5)) then
		fifth = "Completed"
	else
		fifth = "Non-Completed"
	end	
	
	if (getPlayerBless(cid, 1)) and (getPlayerBless(cid, 2)) and (getPlayerBless(cid, 3)) and (getPlayerBless(cid, 4)) and (getPlayerBless(cid, 5)) then
		aol = "You have all blesses and your item/backpack loss is FULL SECURE!"
	else	
		aol = "You dont have all blesses and your item/back not is secure, and go drop when you die."
	end
	
	local message = "Here you can see if you have completed the blesses, or no.\n\nFirst Bless      = "..first.."(Quendor)\n\nSecond Bless      = "..second.."(Thorn)\n\nThird Bless      = "..third.."(Aracura)\n\nFourth Bless      = "..fourth.."(Thaun)\n\nFifth Bless      = "..fifth.."(Salazart)\n\nItem drop:\n"..aol..""
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, message)

	
end