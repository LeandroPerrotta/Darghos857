function onUse(cid, item, frompos, item2, topos)
	if item.actionid == aid.ANIHI_SWITCH then
		if item.itemid == 1945 then
			
			p1 = {}
			p2 = {}
			p3 = {}
			p4 = {}
			
			p1 = getThingPos(uid.ANIHI_PLAYER1)
			p1.stackpos = 253
			p2 = getThingPos(uid.ANIHI_PLAYER2)
			p2.stackpos = 253		
			p3 = getThingPos(uid.ANIHI_PLAYER3)
			p3.stackpos = 253			
			p4 = getThingPos(uid.ANIHI_PLAYER4)
			p4.stackpos = 253	
			
			pla_1 		= getThingfromPos(p1)
			pla_2 		= getThingfromPos(p2)		
			pla_3 		= getThingfromPos(p3)		
			pla_4 		= getThingfromPos(p4)
			
			npos_1		= getThingPos(uid.ANIHI_NPOS1)
			npos_2		= getThingPos(uid.ANIHI_NPOS2)
			npos_3		= getThingPos(uid.ANIHI_NPOS3)
			npos_4		= getThingPos(uid.ANIHI_NPOS4)
			
			
			
			if(pla_1.itemid > 0 and pla_2.itemid > 0 and pla_3.itemid > 0 and pla_4.itemid > 0) then
					
					status_1	= getPlayerStorageValue(pla_1.uid, sid.ANIHI_COMPLETE)
					status_2	= getPlayerStorageValue(pla_2.uid, sid.ANIHI_COMPLETE)
					status_3	= getPlayerStorageValue(pla_3.uid, sid.ANIHI_COMPLETE)
					status_4	= getPlayerStorageValue(pla_4.uid, sid.ANIHI_COMPLETE)
					
				if(status_1 == -1 and status_2 == -1 and status_3 == -1 and status_4 == -1) then
					
					demon_1		= getThingPos(uid.ANIHI_DEMON1)
					demon_2		= getThingPos(uid.ANIHI_DEMON2)
					demon_3		= getThingPos(uid.ANIHI_DEMON3)
					demon_4		= getThingPos(uid.ANIHI_DEMON4)
					demon_5		= getThingPos(uid.ANIHI_DEMON5)
					demon_6		= getThingPos(uid.ANIHI_DEMON6)
					
					doSummonCreature("demon", demon_1)	
					doSummonCreature("demon", demon_2)	
					doSummonCreature("demon", demon_3)	
					doSummonCreature("demon", demon_4)	
					doSummonCreature("demon", demon_5)	
					doSummonCreature("demon", demon_6)

					doSendMagicEffect(p1, 2)
					doSendMagicEffect(p2, 2)
					doSendMagicEffect(p3, 2)
					doSendMagicEffect(p4, 2)
					
					doTeleportThing(pla_1.uid, npos_1)
					doTeleportThing(pla_2.uid, npos_2)
					doTeleportThing(pla_3.uid, npos_3)
					doTeleportThing(pla_4.uid, npos_4)
					
					doSendMagicEffect(npos_1, 10)
					doSendMagicEffect(npos_2, 10)
					doSendMagicEffect(npos_3, 10)
					doSendMagicEffect(npos_4, 10)
					
					setGlobalStorageValue(gid.ANIHI_TIMER,1)
					addEvent(anihi_timmer, (600*1000))					
				else
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "A player of this team already have done this quest.")
					return TRUE
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Its nescessary four players to own this quest.")
				return TRUE
			end
		end
	end		
	
	
	
	if item.itemid == 1946 then
		if(getGlobalStorageValue(gid.ANIHI_TIMER) ~= 1) then
	
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You need wait 10 minutes for use the the switch again.")
			return TRUE			
		end
	end

end

function anihi_timmer()

			setGlobalStorageValue(gid.ANIHI_TIMER,0)
			
			demon_1		= getThingPos(uid.ANIHI_DEMON1)
			demon_1.stackpos = 253
			demon_2		= getThingPos(uid.ANIHI_DEMON2)
			demon_2.stackpos = 253		
			demon_3		= getThingPos(uid.ANIHI_DEMON3)
			demon_3.stackpos = 253
			demon_4		= getThingPos(uid.ANIHI_DEMON4)
			demon_4.stackpos = 253
			demon_5		= getThingPos(uid.ANIHI_DEMON5)
			demon_5.stackpos = 253
			demon_6		= getThingPos(uid.ANIHI_DEMON6)
			demon_6.stackpos = 253
			
			npos_1				= getThingPos(uid.ANIHI_NPOS1)
			npos_1.stackpos 	= 253
			npos_2				= getThingPos(uid.ANIHI_NPOS2)
			npos_2.stackpos 	= 253
			npos_3				= getThingPos(uid.ANIHI_NPOS3)
			npos_3.stackpos 	= 253
			npos_4				= getThingPos(uid.ANIHI_NPOS4)	
			npos_4.stackpos 	= 253
			
			player_pos1	= getThingfromPos(npos_1)
			player_pos2	= getThingfromPos(npos_2)
			player_pos3	= getThingfromPos(npos_3)
			player_pos4	= getThingfromPos(npos_4)
			
			demon1 		= getThingfromPos(demon_1)
			demon2 		= getThingfromPos(demon_2)
			demon3 		= getThingfromPos(demon_3)
			demon4 		= getThingfromPos(demon_4)
			demon5 		= getThingfromPos(demon_5)
			demon6 		= getThingfromPos(demon_6)
				
			doRemoveCreature(demon1.uid)
			doRemoveCreature(demon2.uid)
			doRemoveCreature(demon3.uid)
			doRemoveCreature(demon4.uid)
			doRemoveCreature(demon5.uid)
			doRemoveCreature(demon6.uid)
			doRemoveCreature(player_pos1.uid)
			doRemoveCreature(player_pos2.uid)
			doRemoveCreature(player_pos3.uid)
			doRemoveCreature(player_pos4.uid)

end