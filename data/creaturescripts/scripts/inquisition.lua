function onKill(cid, target)

	
	creature = getCreatureName(target)

	
	local pos = 
	{
		ushuriel_to = getThingPos(uid.INQ_TP_USHURIEL_TO),
		ushuriel_in	= getThingPos(uid.INQ_TP_USHURIEL_IN),
	
		zugurosh_to = getThingPos(uid.INQ_TP_ZUGUROSH_TO),
		zugurosh_in = getThingPos(uid.INQ_TP_ZUGUROSH_IN), 
		
		madareth_to = getThingPos(uid.INQ_TP_MADARETH_TO), 
		madareth_in = getThingPos(uid.INQ_TP_MADARETH_IN),
		
		latrivan_to = getThingPos(uid.INQ_TP_LATRIVAN_TO), 
		latrivan_in = getThingPos(uid.INQ_TP_LATRIVAN_IN),
		
		anihilion_to = getThingPos(uid.INQ_TP_ANIHILION_TO), 
		anihilion_in = getThingPos(uid.INQ_TP_ANIHILION_IN),
		
		hellgorak_to = getThingPos(uid.INQ_TP_HELLGORAK_TO), 
		hellgorak_in = getThingPos(uid.INQ_TP_HELLGORAK_IN)
		
	}
	
	pos.ushuriel_in.stackpos = 1
	pos.zugurosh_in.stackpos = 1
	pos.madareth_in.stackpos = 1
	pos.latrivan_in.stackpos = 1
	pos.anihilion_in.stackpos = 1
	pos.hellgorak_in.stackpos = 1
	
	config = 
	{
		timeTo 		= 180,
		tpID		= 1387,
		doEffect 	= 10,
		message 	= "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear"

	}


	if(creature == "Ushuriel") then

		if(getThingfromPos(pos.ushuriel_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.ushuriel_in).uid,1)
		end		
		teleport = doCreateTeleport(config.tpID, pos.ushuriel_to, pos.ushuriel_in)
		doSendMagicEffect(pos.ushuriel_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeUshuriel, (1000*config.timeTo))
			
	elseif(creature == "Zugurosh") then

		if(getThingfromPos(pos.zugurosh_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.zugurosh_in).uid,1)
		end			
		teleport = doCreateTeleport(config.tpID, pos.zugurosh_to, pos.zugurosh_in)
		doSendMagicEffect(pos.zugurosh_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeZugurosh, (1000*config.timeTo))
		
	elseif(creature == "Madareth") then

		if(getThingfromPos(pos.madareth_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.madareth_in).uid,1)
		end		
		teleport = doCreateTeleport(config.tpID, pos.madareth_to, pos.madareth_in)
		doSendMagicEffect(pos.madareth_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeMadareth, (1000*config.timeTo))
		
	elseif(creature == "Latrivan") then

		if(getThingfromPos(pos.latrivan_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.latrivan_in).uid,1)
		end		
		teleport = doCreateTeleport(config.tpID, pos.latrivan_to, pos.latrivan_in)
		doSendMagicEffect(pos.latrivan_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeLatrivan, (1000*config.timeTo))
		
	elseif(creature == "Annihilon") then

		if(getThingfromPos(pos.anihilion_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.anihilion_in).uid,1)
		end			
		teleport = doCreateTeleport(config.tpID, pos.anihilion_to, pos.anihilion_in)
		doSendMagicEffect(pos.anihilion_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeAnnihilon, (1000*config.timeTo))
			
	elseif(creature == "Hellgorak") then

		if(getThingfromPos(pos.hellgorak_in).itemid == 1387) then
			doRemoveItem(getThingfromPos(pos.hellgorak_in).uid,1)
		end		
		teleport = doCreateTeleport(config.tpID, pos.hellgorak_to, pos.hellgorak_in)
		doSendMagicEffect(pos.hellgorak_in, config.doEffect)
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1)
		addEvent(removeHellgorak, (1000*config.timeTo))
				
	end
	
	return TRUE

end

	-- Funções do satanas que irão remover os teleports
function removeUshuriel()
	local ushuriel_in	= getThingPos(uid.INQ_TP_USHURIEL_IN)
		
	removeTp(ushuriel_in)
	doSendMagicEffect(ushuriel_in, 15)
	backpos = getThingPos(uid.INQ_TP_BACK)	
	backpos.stackpos = 1
	newTP = doCreateTeleport(1387, backpos,ushuriel_in)
 
end

function removeZugorosh()
	local zugurosh_in	= getThingPos(uid.INQ_TP_ZUGUROSH_IN)

		
	removeTp(zugurosh_in)
	backpos = getThingPos(uid.INQ_TP_BACK)	
	backpos.stackpos = 1
	newTP = doCreateTeleport(1387, backpos,zugurosh_in)
 
end

function removeMadareth()
	local madareth_in	= getThingPos(uid.INQ_TP_MADARETH_IN)

		
	removeTp(madareth_in)
	backpos = getThingPos(uid.INQ_TP_BACK)
	backpos.stackpos = 1
	newTP = doCreateTeleport(1387, backpos,madareth_in)
 
end

function removeLatrivan()
	local latrivan_in	= getThingPos(uid.INQ_TP_LATRIVAN_IN)

		
	removeTp(latrivan_in)
	backpos = getThingPos(uid.INQ_TP_BACK)
	backpos.stackpos = 1	
	newTP = doCreateTeleport(1387, backpos,latrivan_in)
 
end

function removeAnnihilon()
	local annihilon_in	= getThingPos(uid.INQ_TP_ANIHILION_IN)

		
	removeTp(annihilon_in)
	backpos = getThingPos(uid.INQ_TP_BACK)	
	backpos.stackpos = 1
	newTP = doCreateTeleport(1387, backpos,annihilon_in)
 
end

function removeHellgorak()
	local hellgorak_in	= getThingPos(uid.INQ_TP_HELLGORAK_IN)

		
	removeTp(hellgorak_in)
	backpos = getThingPos(uid.INQ_TP_BACK)
	backpos.stackpos = 1
	newTP = doCreateTeleport(1387, backpos,hellgorak_in)
 
end

function removeTp(position)

	if(getThingfromPos({x=position.x, y=position.y, z=position.z, stackpos=1}).itemid == 1387) then
		doRemoveItem(getThingfromPos({x=position.x, y=position.y, z=position.z, stackpos=1}).uid,1)
		doSendMagicEffect({x=position.x, y=position.y, z=position.z, stackpos=1}, CONST_ME_POFF)
		return TRUE
	end
	
end











