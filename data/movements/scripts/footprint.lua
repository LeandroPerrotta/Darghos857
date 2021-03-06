local TILE_SNOW = {
	[670] = 6594,
	[6580] = 6595,
	[6581] = 6596,
	[6582] = 6597,
	[6583] = 6598,
	[6584] = 6599,
	[6585] = 6600,
	[6586] = 6601,
	[6587] = 6602,
	[6588] = 6603,
	[6589] = 6604,
	[6590] = 6605,
	[6591] = 6606,
	[6592] = 6607,
	[6593] = 6608
}


function onStepIn(cid, item, pos)
	if (isPlayer(cid) == TRUE and getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN) == TRUE) then
		return TRUE
	end

	if (TILE_SNOW[item.itemid] ~= nil) then
		doTransformItem(item.uid, TILE_SNOW[item.itemid])
		doDecayItem(item.uid)
		return TRUE
	end

	return FALSE
end
