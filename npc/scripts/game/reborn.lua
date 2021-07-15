_startReborn = false
_timer = 0
_target = 0

function checkReborn()
	if(_startReborn) then			
		if(os.time() >= _timer) then
			selfSay("exevo gran mortiferus")
			_timer = 0	
			
			doSendDistanceShoot(getNpcPos(), getCreaturePosition(_target), CONST_ANI_SUDDENDEATH)
			doSendMagicEffect(getCreaturePosition(_target), CONST_ME_MORTAREA)
			_startReborn = false
			expToRemove = getPlayerExperience(_target) - 4200
			doPlayerRemoveExp(_target, expToRemove)
			doPlayerSetVocation(_target, getPlayerVocation(cid)+4)
			setPlayerStorageValue(_target, sid.REBORN_FIRST, 1)
			doTeleportThing(_target.uid, getPlayerMasterPos())
		end			
	end
end

function startReborn(cid)
	_startReborn = true
	_timer = os.time() + 2
	_target = cid
end