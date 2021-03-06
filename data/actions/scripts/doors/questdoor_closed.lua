-- Player with storage value of the item's actionid set to 1 can open

function onUse(cid, item, frompos, item2, topos)
	if(item.actionid == 0 or item.actionid == 100) then
		-- Make it a normal door
		doTransformItem(item.uid, item.itemid+1)
		return TRUE
	end

	local canEnter = (getPlayerStorageValue(cid, item.actionid) == 1)
	if not(canEnter) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door is sealed against unwanted intruders.")
		return TRUE
	end

	doTransformItem(item.uid, item.itemid+1)
	local canGo = (queryTileAddThing(cid, frompos, bit.bor(2, 4)) == RETURNVALUE_NOERROR) --Veryfies if the player can go, ignoring blocking things
	if not(canGo) then
		return FALSE
	end

	local dir = getDirectionTo(getPlayerPosition(cid), frompos)
	doMoveCreature(cid, dir)
	return TRUE
end