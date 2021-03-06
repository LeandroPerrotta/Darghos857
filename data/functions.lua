-- Backward compatibility
getConfigInfo = getConfigValue
doPlayerRemOutfit = doPlayerRemoveOutfit
doPlayerRemOutfitEx = doPlayerRemoveOutfitEx
getThingfromPos = getThingFromPos
getPlayerBalance = getPlayerAccountBalance

function setExperienceRate(cid, value)
	return doPlayerSetRate(cid, LEVEL_EXPERIENCE, value)
end

function setMagicRate(cid, value)
	return doPlayerSetRate(cid, LEVEL_MAGIC, value)
end

function setSkillRate(cid, skillid, value)
	return doPlayerSetRate(cid, skillid, value)
end

function doPlayerAddHealth(cid, health, filter)
	filter = filter == FALSE and FALSE or TRUE
	if isPlayer(cid) == TRUE then
		if doCreatureAddHealth(cid, health, filter) ~= LUA_ERROR then
			return LUA_NO_ERROR
		end
	end

	return LUA_ERROR
end

function getPlayerPosition(cid)
	if isPlayer(cid) == TRUE then
		local position = getCreaturePosition(cid)
		if position ~= LUA_ERROR then
			return position
		end
	end

	return LUA_ERROR
end

function getPlayerHealth(cid)
	if isPlayer(cid) == TRUE then
		local health = getCreatureHealth(cid)
		if health ~= LUA_ERROR then
			return health
		end
	end

	return LUA_ERROR
end

function getPlayerMaxHealth(cid)
	if isPlayer(cid) == TRUE then
		local maxHealth = getCreatureMaxHealth(cid)
		if maxHealth ~= LUA_ERROR then
			return maxHealth
		end
	end

	return LUA_ERROR
end

function getPlayerName(cid)
	if isPlayer(cid) == TRUE then
		local name = getCreatureName(cid)
		if name ~= LUA_ERROR then
			return name
		end
	end

	return LUA_ERROR
end

function getPlayerByName(name)
	local player = getCreatureByName(name)
	if player ~= LUA_NULL and isPlayer(player) == TRUE then
		return player
	end

	return LUA_NULL
end

function doPlayerSay(cid, text, textType)
	if isPlayer(cid) == TRUE then
		if doCreatureSay(cid, text, textType) ~= LUA_ERROR then
			return LUA_NO_ERROR
		end
	end

	return LUA_ERROR
end

function getPlayerLight(cid)
	if isPlayer(cid) == TRUE then
		local light = getCreatureLight(cid)
		if light ~= LUA_ERROR then
			return light
		end
	end

	return LUA_ERROR
end

function getPlayerLookDir(cid)
	if isPlayer(cid) == TRUE then
		local lookDir = getCreatureLookDir(cid)
		if lookDir ~= LUA_ERROR then
			return lookDir
		end
	end

	return LUA_ERROR
end

function doSetPlayerLight(cid, lightLevel, lightColor, lightTime)
	if isPlayer(cid) == TRUE then
		if doSetCreatureLight(cid, lightLevel, lightColor, lightTime) ~= LUA_ERROR then
			return LUA_NO_ERROR
		end
	end

	return LUA_ERROR
end

function getCreaturePos(pos)
	return getCreaturePosition(pos)
end

function getPlayerPos(pos)
	return getPlayerPosition(pos)
end

-- Other functions
function isPlayer(cid)
	if (isCreature(cid) == TRUE and cid >= PLAYER_ID_RANGE and cid < MONSTER_ID_RANGE) then
		return TRUE
	end

	return FALSE
end

function isMonster(cid)
	if (isCreature(cid) == TRUE and cid >= MONSTER_ID_RANGE and cid < NPC_ID_RANGE) then
		return TRUE
	end

	return FALSE
end

function isNPC(cid)
	if (isCreature(cid) == TRUE and cid >= NPC_ID_RANGE) then
		return TRUE
	end

	return FALSE
end

function isSorcerer(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isSorcerer: Player not found.")
		return false
	end

	return (isInArray({1,5,9}, getPlayerVocation(cid)) == TRUE)
end

function isDruid(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isDruid: Player not found.")
		return false
	end

	return (isInArray({2,6,10}, getPlayerVocation(cid)) == TRUE)
end

function isPaladin(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isPaladin: Player not found.")
		return false
	end

	return (isInArray({3,7,11}, getPlayerVocation(cid)) == TRUE)
end

function isKnight(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isKnight: Player not found.")
		return false
	end

	return (isInArray({4,8,12}, getPlayerVocation(cid)) == TRUE)
end

function getDirectionTo(pos1, pos2)
	local dir = NORTH
	if(pos1.x > pos2.x) then
		dir = WEST
		if(pos1.y > pos2.y) then
			dir = NORTHWEST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHWEST
		end
	elseif(pos1.x < pos2.x) then
		dir = EAST
		if(pos1.y > pos2.y) then
			dir = NORTHEAST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHEAST
		end
	else
		if(pos1.y > pos2.y) then
			dir = NORTH
		elseif(pos1.y < pos2.y) then
			dir = SOUTH
		end
	end
	return dir
end

function getDistanceBetween(pos1, pos2)
	local xDif = math.abs(pos1.x - pos2.x)
	local yDif = math.abs(pos1.y - pos2.y)

	local posDif = math.max(xDif, yDif)
	if (pos1.z ~= pos2.z) then
		posDif = (posDif + 9 + 6)
	end
	return posDif
end

function getPlayerLookPos(cid)
	return getPosByDir(getThingPos(cid), getPlayerLookDir(cid))
end

function getPosByDir(basePos, dir)
	local pos = basePos
	if(dir == NORTH) then
		pos.y = pos.y-1
	elseif(dir == SOUTH) then
		pos.y = pos.y + 1
	elseif(dir == WEST) then
		pos.x = pos.x-1
	elseif(dir == EAST) then
		pos.x = pos.x+1
	elseif(dir == NORTHWEST) then
		pos.y = pos.y-1
		pos.x = pos.x-1
	elseif(dir == NORTHEAST) then
		pos.y = pos.y-1
		pos.x = pos.x+1
	elseif(dir == SOUTHWEST) then
		pos.y = pos.y+1
		pos.x = pos.x-1
	elseif(dir == SOUTHEAST) then
		pos.y = pos.y+1
		pos.x = pos.x+1
	end
	return pos
end

function getPlayerMoney(cid)
	return ((getPlayerItemCount(cid, ITEM_CRYSTAL_COIN) * 10000) + (getPlayerItemCount(cid, ITEM_PLATINUM_COIN) * 100) + getPlayerItemCount(cid, ITEM_GOLD_COIN))
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name)
	return (getPlayerGUIDByName(name) ~= 0)
end

function getTibiaTime()
	local worldTime = getWorldTime()
	local hours = 0
	while (worldTime > 60) do
		hours = hours + 1
		worldTime = worldTime - 60
	end

	return {hours = hours, minutes = worldTime}
end

exhaustion =
{

	check = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage)
		if (os.time() >= exhaust) then
			return FALSE
		else
			return TRUE
		end
	end,

	get = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage)
		local left = exhaust - os.time()
		if (left >= 0) then
			return left
		else
			return FALSE
		end
	end,

	set = function (cid, storage, time)
		setPlayerStorageValue(cid, storage, os.time()+time)
	end,

	make = function (cid, storage, time)
		local exhaust = exhaustion.get(cid, storage)
		if (exhaust > 0) then
			return FALSE
		else
			exhaustion.set(cid, storage, time)
			return TRUE
		end
	end
}


table.find = function (table, value)
	for i,v in pairs(table) do
		if (v == value) then
			return i
		end
	end
	return nil
end
table.getPos = table.find

table.isStrIn = function (txt, str)
	local result = false
	for i, v in pairs(str) do
		result = (string.find(txt, v) and not string.find(txt, '(%w+)' .. v) and not string.find(txt, v .. '(%w+)'))
		if (result) then
			break
		end
	end
	return result
end

table.countElements = function (table, item)
	local count = 0
	for i, n in pairs(table) do
		if (item == n) then count = count + 1 end
	end
	return count
end

table.getCombinations = function (table, num)
	local a, number, select, newlist = {}, #table, num, {}
	for i = 1, select do
		a[#a + 1] = i
	end
	local newthing = {}
	while (1) do
		local newrow = {}
		for i = 1, select do
			newrow[#newrow + 1] = table[a[i]]
		end
		newlist[#newlist + 1] = newrow
		i = select
		while (a[i] == (number - select + i)) do
			i = i - 1
		end
		if (i < 1) then break end
			a[i] = a[i] + 1
			for j = i, select do
				a[j] = a[i] + j - i
			end
		end
	return newlist
end

function table.show(t, name, indent)
   local cart     -- a container
   local autoref  -- for self references

   --[[ counts the number of elements in a table
   local function tablecount(t)
      local n = 0
      for _, _ in pairs(t) do n = n+1 end
      return n
   end
   ]]
   -- (RiciLake) returns true if the table is empty
   local function isemptytable(t) return next(t) == nil end

   local function basicSerialize (o)
      local so = tostring(o)
      if type(o) == "function" then
         local info = debug.getinfo(o, "S")
         -- info.name is nil because o is not a calling level
         if info.what == "C" then
            return string.format("%q", so .. ", C function")
         else 
            -- the information is defined through lines
            return string.format("%q", so .. ", defined in (" ..
                info.linedefined .. "-" .. info.lastlinedefined ..
                ")" .. info.source)
         end
      elseif type(o) == "number" then
         return so
      else
         return string.format("%q", so)
      end
   end

   local function addtocart (value, name, indent, saved, field)
      indent = indent or ""
      saved = saved or {}
      field = field or name

      cart = cart .. indent .. field

      if type(value) ~= "table" then
         cart = cart .. " = " .. basicSerialize(value) .. ";\n"
      else
         if saved[value] then
            cart = cart .. " = {}; -- " .. saved[value] 
                        .. " (self reference)\n"
            autoref = autoref ..  name .. " = " .. saved[value] .. ";\n"
         else
            saved[value] = name
            --if tablecount(value) == 0 then
            if isemptytable(value) then
               cart = cart .. " = {};\n"
            else
               cart = cart .. " = {\n"
               for k, v in pairs(value) do
                  k = basicSerialize(k)
                  local fname = string.format("%s[%s]", name, k)
                  field = string.format("[%s]", k)
                  -- three spaces between levels
                  addtocart(v, fname, indent .. "   ", saved, field)
               end
               cart = cart .. indent .. "};\n"
            end
         end
      end
   end

   name = name or "__unnamed__"
   if type(t) ~= "table" then
      return name .. " = " .. basicSerialize(t)
   end
   cart, autoref = "", ""
   addtocart(t, name, indent)
   return cart .. autoref
end

string.gfind = string.gmatch
string.split = function (str)
	local t = {}
	local function helper(word) table.insert(t, word) return "" end
	if (not str:gsub("%w+", helper):find"%S") then return t end
end

string.separate = function(separator, string)
	local a, b = {}, 0
	if (#string == 1) then return string end
	while (true) do
		local nextSeparator = string.find(string, separator, b + 1, true)
		if (nextSeparator ~= nil) then
			table.insert(a, string.sub(string,b,nextSeparator-1))
			b = nextSeparator + 1
		else
			table.insert(a, string.sub(string, b))
			break
		end
	end
	return a
end

function string.explode(p, d, m)
	local limit = m or 0
	local t, ll, j
	t={}
	ll=0
	j=0
	if(#p == 1) then return p end
		while true do
			l=string.find(p,d,ll+1,true) -- find the next d in the string
			if l~=nil and (j < limit or limit == 0) then -- if "not not" found then..
				table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
				ll=l+1 -- save just after where we found it for searching next time.
				j=j+1 -- number of explosions
			else
				table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
				break -- Break at end, as it should be, according to the lua manual.
			end
		end
	return t
end

function string.strip_whitespace(str)
	if str == nil then return str end
	local start = string.find(str, "[^%s]") -- First non-whitespace character
	local _end = #str + 1 - string.find(str:reverse(), "[^%s]") -- Last non-whitespace character

	if start ~= nil and _end ~= nil then
		return string.sub(str, start, _end)
	elseif start ~= nil then
		return string.sub(str, start)
	elseif _end ~= nil then
		return string.sub(str, 1, _end)
	end
	return str
end

function getPlayerByAccountNumber(acc)
	players = getPlayersByAccountNumber(acc)
	if #players == 0 then
		return 0
	end
	return players[1]
end

function convertIntToIP(int, mask)
	local b4 = bit.urshift(bit.uband(int,  4278190080), 24)
	local b3 = bit.urshift(bit.uband(int,  16711680), 16)
	local b2 = bit.urshift(bit.uband(int,  65280), 8)
	local b1 = bit.urshift(bit.uband(int,  255), 0)
	if mask ~= nil then
		local m4 = bit.urshift(bit.uband(mask,  4278190080), 24)
		local m3 = bit.urshift(bit.uband(mask,  16711680), 16)
		local m2 = bit.urshift(bit.uband(mask,  65280), 8)
		local m1 = bit.urshift(bit.uband(mask,  255), 0)
		if (m1 == 255 or m1 == 0) and (m2 == 255 or m2 == 0) and (m3 == 255 or m3 == 0) and (m4 == 255 or m4 == 0) then
			if m1 == 0 then b1 = "x" end
			if m2 == 0 then b2 = "x" end
			if m3 == 0 then b3 = "x" end
			if m4 == 0 then b4 = "x" end
		else
			if m1 ~= 255 or m2 ~= 255 or m3 ~= 255 or m4 ~= 255 then
				return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4 .. " : " .. m1 .. "." .. m2 .. "." .. m3 .. "." .. m4
			end
		end
	end

	return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4
end

function convertIPToInt(str)
	local maskindex = str:find(":")
	if maskindex ~= nil then
		-- IP:Mask style
		if maskindex <= 1 then
			return 0, 0
		else
			ipstring = str:sub(1, maskindex - 1)
			maskstring = str:sub(maskindex)

			local ipint = 0
			local maskint = 0

			local index = 0
			for b in ipstring:gmatch("(%d+).?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then -- Invalid
				return 0, 0
			end

			index = 0
			for b in maskstring:gmatch("(%d+)%.?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then
				return 0, 0
			end

			return ipint, maskint
		end
	else
		local ipint = 0
		local maskint = 0
		local index = 24

		for b in str:gmatch("([x%d]+)%.?") do
			if b ~= "x" then
				if b:find("x") ~= nil then
					return 0, 0
				end
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(255, index))
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
			end
			index = index - 8
			if index < 0 then
				break
			end
		end
		if index ~= -8 then -- Invalid
			return 0, 0
		end
		return ipint, maskint
	end
end

function getPlayerBless(cid, blessid)
	local storageid = STORAGE_BLESSES + blessid
	if getPlayerStorageValue(cid, storageid) >= 1 then
		return TRUE
	else
		return FALSE
	end
end

function doPlayerRemoveSkillLossPercent(cid, amount)
	local lossvalue = getPlayerLossPercent(cid, PLAYERLOSS_EXPERIENCE)
	local newvalue = lossvalue - amount
	if newvalue < 0 then
		newvalue = 0
	end
	-- Setting experience is enough (all other types follow it)
	doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, newvalue)
end

function doPlayerUpdateItemLossPercent(cid)
	-- check quantity of bless
	local i = 0
	local blesses = 0
	while i < 5 do
		if getPlayerBless(cid, i) == TRUE then
			blesses = blesses + 1
		end
		i = i + 1
	end

	-- update %
	if blesses >= 5 then
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 0)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 0)
	elseif blesses >= 4 then
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 1)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 10)
	elseif blesses >= 3 then
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 3)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 25)
	elseif blesses >= 2 then
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 5)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 45)
	elseif blesses >= 1 then
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 7)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 70)
	else
		doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 10)
		doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 100)
	end
end

function doPlayerAddBless(cid, blessid)
	if getPlayerBless(cid, blessid) == FALSE then
		doPlayerRemoveSkillLossPercent(cid, 8)
		local storageid = STORAGE_BLESSES + blessid
		setPlayerStorageValue(cid, storageid, 1)
		doPlayerUpdateItemLossPercent(cid)
	end
end

function doPlayerRemoveBless(cid, blessid)
	if getPlayerBless(cid, blessid) == TRUE then
		doPlayerRemoveSkillLossPercent(cid, -8)
		local storageid = STORAGE_BLESSES + blessid
		setPlayerStorageValue(cid, storageid, -1)
		doPlayerUpdateItemLossPercent(cid)
	end
end

function getBlessPrice(level)
	local price = 2000
	level = math.min(120, level)
	if(level > 30) then
		price = (price + ((level - 30) * 200))
	end

	return price
end

function getPlayerRequiredExperience(cid, level)
	if isPlayer(cid) == TRUE and level >= 1 then
		local playerLevel = getPlayerLevel(cid)
		local experienceLeft = 0
		local levelExp = 0

		if playerLevel > level then
			levelExp = Calculator:getLevelExp(level)
			experienceLeft = getPlayerExperience(cid) - levelExp
		elseif playerLevel < level then
			levelExp = Calculator:getLevelExp(level)
			experienceLeft = levelExp - getPlayerExperience(cid)
		end
		return experienceLeft
	end

	return LUA_ERROR
end

function doPlayerAddLevel(cid, level)
	if isPlayer(cid) == TRUE and level >= 1 then
		local experience = getPlayerRequiredExperience(cid, getPlayerLevel(cid)+level)
		return doPlayerAddExp(cid, experience)
	end

	return LUA_FALSE
end

function doPlayerRemoveLevel(cid, level)
	if isPlayer(cid) == TRUE and level >= 1 then
		local experience = getPlayerRequiredExperience(cid, getPlayerLevel(cid)-level)
		return doPlayerRemoveExp(cid, experience)
	end

	return LUA_FALSE
end

-- Functions made by Jiddo
function doPlayerGiveItem(cid, itemid, count, charges)
	local hasCharges = (isItemRune(itemid) == TRUE or isItemFluidContainer(itemid) == TRUE)
	if(hasCharges and charges == nil) then
		charges = 1
	end

	while count > 0 do
    	local tempcount = 1

    	if(hasCharges) then
    		tempcount = charges
    	end
    	if(isItemStackable(itemid) == TRUE) then
    		tempcount = math.min (100, count)
   		end

       	local ret = doPlayerAddItem(cid, itemid, tempcount)
       	if(ret == LUA_ERROR) then
        	ret = doCreateItem(itemid, tempcount, getPlayerPosition(cid))
        end

        if(ret ~= LUA_ERROR) then
        	if(hasCharges) then
        		count = count-1
        	else
        		count = count-tempcount
        	end
        else
        	return LUA_ERROR
        end
	end
    return LUA_NO_ERROR
end

function doPlayerTakeItem(cid, itemid, count)
	if(getPlayerItemCount(cid,itemid) >= count) then

		while count > 0 do
			local tempcount = 0
    		if(isItemStackable(itemid) == TRUE) then
    			tempcount = math.min (100, count)
    		else
    			tempcount = 1
    		end
        	local ret = doPlayerRemoveItem(cid, itemid, tempcount)

            if(ret ~= LUA_ERROR) then
            	count = count-tempcount
            else
            	return LUA_ERROR
            end
		end

		if(count == 0) then
			return LUA_NO_ERROR
		end
	end
	return LUA_ERROR
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	if(doPlayerRemoveMoney(cid, cost) == TRUE) then
		return doPlayerGiveItem(cid, itemid, count, charges)
	end
	return LUA_ERROR
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(doPlayerTakeItem(cid, itemid, count) == LUA_NO_ERROR) then
		if(doPlayerAddMoney(cid, cost) ~= LUA_NO_ERROR) then
			error('Could not add money to ' .. getPlayerName(cid) .. '(' .. cost .. 'gp)')
		end
		return LUA_NO_ERROR
	end
	return LUA_ERROR

end

function getContainerCapById(itemid)
	local container = doCreateItemEx(itemid, 1)
	local capacity = getContainerCap(container)
	if capacity ~= LUA_ERROR then
		doRemoveItem(container)
		return capacity
	else
		doRemoveItem(container)
		return LUA_ERROR
	end
end

function isThingMoveable(uid)
	if(isMoveable(uid) == TRUE and uid > 65535) then
		return TRUE
	end

	return FALSE
end

function isThingDestroyable(thing)
	if(thing.uid <= 0 or isCreature(thing.uid) == TRUE or isThingMoveable(thing.uid) == FALSE) then
		return FALSE
	end

	return TRUE
end

function doCleanTileItemsByPos(pos, ignore)
	local ignore = ignore or {}
	local removed_items = 0
	local stackpos = 1

	while true do
		pos.stackpos = stackpos
		local thing = getTileThingByPos(pos)

		if(isThingDestroyable(thing) == TRUE and isInArray(ignore, thing.itemid) == FALSE) then
			doRemoveItem(thing.uid)
			removed_items = removed_items + 1
		else
			if thing.uid > 0 then
				stackpos = stackpos + 1
			else
				break
			end
		end
	end
	
	return removed_items
end

function isInArray(array, value, isCaseSensitive)
	local compareLowerCase = FALSE
	if type(value) == "string" and isCaseSensitive ~= TRUE then
		value = string.lower(value)
		compareLowerCase = TRUE
	end
	for k,v in pairs(array) do
		local newV
		if compareLowerCase == TRUE and type(v) == "string" then
			newV = string.lower(v)
		else
			newV = v
		end
		if newV == value then 
			return TRUE, k
		end
	end
	return FALSE
end

function doBroadcastMessage(message, class)
	local messageClass = class or MESSAGE_STATUS_WARNING
	if messageClass < MESSAGE_CLASS_FIRST or messageClass > MESSAGE_CLASS_LAST then
		return LUA_ERROR
	end

	for i, cid in ipairs(getPlayersOnlineList()) do
		doPlayerSendTextMessage(cid, messageClass, message)
	end
	return LUA_NO_ERROR
end

broadcastMessage = doBroadcastMessage
broadcastMessageEx = broadcastMessage