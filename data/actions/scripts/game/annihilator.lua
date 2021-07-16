local INTERVAL_ENTER = 10 * 60 -- 10 minutes

local players = {}
local demons = {}

local function loadValues(actionid)

	players = {}
	demons = {}

	if(actionid == aid.ANIHI_SWITCH) then
	
		table.insert(players, {from = uid.ANIHI_PLAYER1, dest = uid.ANIHI_NPOS1})
		table.insert(players, {from = uid.ANIHI_PLAYER2, dest = uid.ANIHI_NPOS2})
		table.insert(players, {from = uid.ANIHI_PLAYER3, dest = uid.ANIHI_NPOS3})
		table.insert(players, {from = uid.ANIHI_PLAYER4, dest = uid.ANIHI_NPOS4})
		
		table.insert(demons, uid.ANIHI_DEMON1)
		table.insert(demons, uid.ANIHI_DEMON2)
		table.insert(demons, uid.ANIHI_DEMON3)
		table.insert(demons, uid.ANIHI_DEMON4)		
		table.insert(demons, uid.ANIHI_DEMON5)		
		table.insert(demons, uid.ANIHI_DEMON6)		
		table.insert(demons, uid.ANIHI_DEMON7)		
				
	elseif(actionid == aid.ANIHI_ARACURA_SWITCH) then

		table.insert(players, {from = uid.ANIHI_ARACURA_PLAYER1, dest = uid.ANIHI_ARACURA_NPOS4})
		table.insert(players, {from = uid.ANIHI_ARACURA_PLAYER2, dest = uid.ANIHI_ARACURA_NPOS3})
		table.insert(players, {from = uid.ANIHI_ARACURA_PLAYER3, dest = uid.ANIHI_ARACURA_NPOS2})
		table.insert(players, {from = uid.ANIHI_ARACURA_PLAYER4, dest = uid.ANIHI_ARACURA_NPOS1})
		
		table.insert(demons, uid.ANIHI_ARACURA_DEMON1)
		table.insert(demons, uid.ANIHI_ARACURA_DEMON2)
		table.insert(demons, uid.ANIHI_ARACURA_DEMON3)
		table.insert(demons, uid.ANIHI_ARACURA_DEMON4)		
		table.insert(demons, uid.ANIHI_ARACURA_DEMON5)		
		table.insert(demons, uid.ANIHI_ARACURA_DEMON6)		
		table.insert(demons, uid.ANIHI_ARACURA_DEMON7)		
	else
		debugPrint("Unknown actionid type.")
	end

end

function canTeleportPlayers(cid)

	local ERROR = {
		NONE 							= 1,
		NEED_ALL_PLAYERS 				= 2,
		PLAYER_ALREADY_MADE_QUEST 		= 3
	}

	local stats = ERROR.NONE

	-- check if all is ok to teleport players
	for k,v in pairs(players) do
	
		local thing_pos = getThingPos(v.from)		
		local player = getTopCreature(thing_pos)
		
		if(player.uid ~= FALSE) then
			if(getPlayerAccess(player.uid) < ACCESS_ADMIN and isPlayer(player.uid) == FALSE) then
				stats = ERROR.NEED_ALL_PLAYERS
				break
			end
		else
			stats = ERROR.NEED_ALL_PLAYERS
			break
		end
		
		if(getPlayerStorageValue(player.uid, sid.ANIHI_COMPLETE) ~= -1) then
			stats = ERROR.PLAYER_ALREADY_MADE_QUEST
			break
		end
		
		v["cid"] = player.uid
	end
	
	if(stats == ERROR.NONE) then
		-- inserimos o objeto do jogador para ser usado posteriormente
		return true
	else
		if(stats == ERROR.PLAYER_ALREADY_MADE_QUEST) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "A player of this team already have done this quest.")
		elseif(stats == ERROR.NEED_ALL_PLAYERS) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Its nescessary four players to own this quest.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "For an unknown reason can not be make this action. An log has been reported to admin.")
			debugPrint("Unknown error code for checking players.")
		end
		
		return false
	end	
end

local function teleportPlayers()
	for k,v in pairs(players) do
		local pos = getCreaturePosition(v.cid)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
		doTeleportThing(v.cid, getThingPos(v.dest))
		doSendMagicEffect(getThingPos(v.dest), CONST_ME_TELEPORT)
	end
end

local function summonDemons()
	for k,v in pairs(demons) do
		local demon_pos = getThingPos(v)
		doSummonCreature("demon", demon_pos)
	end
end

local function removeDemons()
	for k,v in pairs(demons) do
		local demon_pos = getThingPos(v)
		local demon = getTopCreature(demon_pos)
		
		if(demon.uid ~= FALSE and isMonster(demon.uid) == TRUE) then
			doRemoveCreature(demon.uid)
		end
	end
	
	-- we need to check in player pos because the demons can be walk to this tiles
	for k,v in pairs(players) do
		local player_pos = getThingPos(v.dest)
		local player = getTopCreature(player_pos)
		
		if(player.uid ~= FALSE and isMonster(player)) then
			doRemoveCreature(player.uid)
		end
	end	
end

function onUse(cid, item, frompos, item2, topos)

	if item.itemid ~= 1945 and item.itemid ~= 1946 then
		debugPrint("Wrong item id?")
		return TRUE
	end

	local lastEnter = getGlobalStorageValue(gid.ANIHI_TIMER)

	if(lastEnter == -1 or os.time() > lastEnter + INTERVAL_ENTER) then
		loadValues(item.actionid)
	
		if(canTeleportPlayers(cid)) then
			summonDemons()
			teleportPlayers()
			
			setGlobalStorageValue(gid.ANIHI_TIMER, os.time())
			addEvent(anihi_timmer, INTERVAL_ENTER * 1000)
		else
			return TRUE
		end		
	else
		local secondsLeft = ((lastEnter + INTERVAL_ENTER) - os.time()) 
		local minutes = math.ceil(secondsLeft / 60)
		
		if(secondsLeft > 60) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "An another team has recently actived the lever. You must wait " .. minutes .. " minutes to activate it again.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "An another team has recently actived the lever. You must wait less then a minute to activate it again.")
		end
		return TRUE	
	end
end

function anihi_timmer()

	removeDemons()
end 