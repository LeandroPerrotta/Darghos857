local specialQuests = {
	[2001] = 30015 --Annihilator
}

local questsExperience = {
	[2026] = 1800000,
	[2027] = 1000000,
	[2028] = 4000000
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerCustomFlagValue(cid, PlayerCustomFlag_GamemasterPrivileges) == TRUE) then
		return TRUE
	end

	local storage = specialQuests[item.actionid]
	if(storage == nil) then
		storage = item.uid
		if(storage > 65535) then
			return FALSE
		end
	end

	local result = "It is empty."
	if(getPlayerStorageValue(cid, storage) == -1) then
		local items = {}
		local reward = 0

		local size = isContainer(item.uid) == TRUE and getContainerSize(item.uid) or 0
		if(size == 0) then
			reward = doCopyItem(item, FALSE)
		else
			for i = 0, size do
				local tmp = getContainerItem(item.uid, i)
				if(tmp.itemid > 0) then
					table.insert(items, tmp)
				end
			end
		end

		size = table.maxn(items)
		if(size == 1) then
			reward = doCopyItem(items[1], TRUE)
		end

		if(reward ~= 0) then
			local ret = getItemDescriptions(reward.uid)
			if(reward.type > 0 and isItemRune(reward.itemid) == TRUE) then
				result = reward.type .. " charges " .. ret.name
			elseif(reward.type > 0 and isItemStackable(reward.itemid) == TRUE) then
				result = reward.type .. " " .. ret.plural
			else
				result = ret.article .. " " .. ret.name
			end
		else
			result = ""
			if(size > 20) then
				reward = doCopyItem(item, FALSE)
			elseif(size > 8) then
				reward = getThing(doCreateItemEx(1988, 1))
			else
				reward = getThing(doCreateItemEx(1987, 1))
			end

			for i = 1, size do
				local tmp = doCopyItem(items[i], TRUE)
				if(doAddContainerItemEx(reward.uid, tmp.uid) ~= RETURNVALUE_NOERROR) then
					print("[Warning] QuestSystem:", "Could not add quest reward")
				else
					local ret = ", "
					if(i == 2) then
						ret = " and "
					elseif(i == 1) then
						ret = ""
					end

					result = result .. ret
					ret = getItemDescriptions(tmp.uid)
					if(tmp.type > 0 and isItemRune(tmp.itemid) == TRUE) then
						result = result .. tmp.type .. " charges " .. ret.name
					elseif(tmp.type > 0 and isItemStackable(tmp.itemid) == TRUE) then
						result = result .. tmp.type .. " " .. ret.plural
					else
						result = result .. ret.article .. " " .. ret.name
					end
				end
			end
		end

		if(doPlayerAddItemEx(cid, reward.uid, FALSE) ~= RETURNVALUE_NOERROR) then
			result = "You have found a reward weighing " .. getItemWeight(reward.uid) .. " oz. It is too heavy or you have not enough space."
		else
			result = "You have found " .. result .. "."
			setPlayerStorageValue(cid, storage, 1)
			if(questsExperience[storage] ~= nil) then
				doPlayerAddExp(cid, questsExperience[storage])
				doSendAnimatedText(getCreaturePosition(cid), questsExperience[storage], TEXTCOLOR_WHITE)
			end
		end
	end

	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, result)
	return TRUE
end
