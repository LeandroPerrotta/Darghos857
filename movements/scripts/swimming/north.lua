dofile(getDataDir() .. "movements/scripts/swimming/swimlib.lua")

function onStepIn(cid, item, pos)
	return checkSwim(cid, NORTH, SOUTH)
end
