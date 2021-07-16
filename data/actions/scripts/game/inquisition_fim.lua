

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	global_State = getGlobalStorageValue(gid.INQ_MWALL_PASS)
	wallPos = getThingPos(uid.INQ_MWALL)
	wallPos.y = wallPos.y-2
	
	if(itemEx.itemid == 1498) then
		doTransformItem(itemEx.uid, 8756)
		doSendMagicEffect(wallPos, CONST_ME_HOLYAREA)
		addEvent(spawnDemons, (15*1000))
		addEvent(executeFire, (15*1000))
		addEvent(executeFire, (25*1000))
		addEvent(executeFire, (35*1000))
		addEvent(spawnDemons, (35*1000))
		addEvent(executeFire, (45*1000))
	end

	if(itemEx.itemid == 8759) then
		if(global_State < 3) then
			if(getPlayerStorageValue(cid, sid.INQ_DONE_MWALL) ~= 1) then
				setGlobalStorageValue(gid.INQ_MWALL_PASS, global_State+1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You finished the quest correctly, now you can talk to the npc Myh Sayn in Salazart to get your rewards.")
				doSendMagicEffect(wallPos,CONST_ME_FIREAREA)
				doPlayerRemoveItem(cid, item.itemid,1)
				setPlayerStorageValue(cid, sid.INQ_DONE_MWALL,1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You already have used the vial in Inquisition Walls!")	
			end
		end
	end
	
end

function executeFire()
	
	wallPos = getThingPos(uid.INQ_MWALL)
	wallPos.stackpos = 3
	
	posToEffect = getThingPos(uid.INQ_MWALL)
	posToEffect.y = posToEffect.y-2
	
	global_State = getGlobalStorageValue(gid.INQ_MWALL_PASS)	
	wall = getThingfromPos(wallPos)
	
	if(wall.itemid == 8756) then
		doRemoveItem(wall.uid,1)
		doSendMagicEffect(posToEffect,CONST_ME_FIREATTACK)
		doCreateItem(8755,1,wallPos)
	elseif(wall.itemid == 8755) then
		doRemoveItem(wall.uid,1)
		doSendMagicEffect(posToEffect,CONST_ME_FIREATTACK)
		doCreateItem(8757,1,wallPos)
	elseif(wall.itemid == 8757) then
		doRemoveItem(wall.uid,1)
		doSendMagicEffect(posToEffect,CONST_ME_FIREATTACK)
		setGlobalStorageValue(gid.INQ_MWALL_PASS,0)
		doCreateItem(8759,1,wallPos)
	elseif(wall.itemid == 8759) then
		doRemoveItem(wall.uid,1)
		doSendMagicEffect(posToEffect,CONST_ME_HOLYAREA)
		doCreateItem(1498,1,wallPos)
	end
	

	

	
end

function spawnDemons()
	
	spawn_1 = getThingPos(uid.INQ_DEMON_1)
	spawn_2 = getThingPos(uid.INQ_DEMON_2)
	spawn_3 = getThingPos(uid.INQ_DEMON_3)

	spawn_12 = getThingPos(uid.INQ_DEMON_1)
	spawn_12.stackpos = 255
	
	spawn_22 = getThingPos(uid.INQ_DEMON_2)
	spawn_22.stackpos = 255
	
	spawn_32 = getThingPos(uid.INQ_DEMON_3)	
	spawn_32.stackpos = 255
	
	c1 = getThingfromPos(spawn_12)
	c2 = getThingfromPos(spawn_22)
	c3 = getThingfromPos(spawn_32)
	
	if(isMoveable(spawn_1.uid)) then
		if (isMonster(c1.uid) == FALSE) then
			doSummonCreature("demon", spawn_1)
		end
	end
	
	if(isMoveable(spawn_2.uid)) then
		if (isMonster(c2.uid) == FALSE) then
			doSummonCreature("demon", spawn_2)
		end
	end

	if(isMoveable(spawn_3.uid)) then
		if (isMonster(c3.uid) == FALSE) then
			doSummonCreature("demon", spawn_3)
		end
	end	


	
end