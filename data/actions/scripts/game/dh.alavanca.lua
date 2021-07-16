local STONE_ID = 1304
local TELEPORT_ID = 1387

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local _stone = nil
	local _teleport_pos = nil
	local _teleport_dest = nil
	
	if(item.actionid == aid.DH_ARACURA_SWITCH) then
		_stone = getThingPos(uid.ARACURA_DH_STONE)
		_teleport_pos = getThingPos(uid.ARACURA_DH_TELEPORT)
		_teleport_dest = getThingPos(uid.ARACURA_DH_TELEPORT_DEST)
	elseif(item.actionid == aid.DH_ALAVANCA) then

		_stone = getThingPos(uid.AARAGON_DH_STONE)
		_teleport_pos = getThingPos(uid.AARAGON_DH_TELEPORT)
		_teleport_dest = getThingPos(uid.AARAGON_DH_TELEPORT_DEST)
	else
		debugPrint("Unknown actionid type.")
		return
	end
	
	_stone.stackpos = 1
	_teleport_pos.stackpos = 1
	
	local stone = getThingFromPos(_stone)
	local teleport = getThingFromPos(_teleport_pos)
	
	print(table.show(stone))
	print(table.show(teleport))
	
	if (item.itemid == 1945) then
		if(stone.itemid == STONE_ID) then
			doRemoveItem(stone.uid)
			doCreateTeleport(TELEPORT_ID, _teleport_dest, _teleport_pos)
		else
			debugPrint("The stone can not found to be removed.")
		end
	elseif (item.itemid == 1946) then
		if(stone.itemid == 0 and teleport.itemid == TELEPORT_ID) then
			doCreateItem(STONE_ID, 1, _stone)
			doRemoveItem(teleport.uid)
		else
			debugPrint("The stone already exists or teleport can not found to be removed.")
		end
	end	
end
