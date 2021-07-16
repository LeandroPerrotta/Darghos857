function onAdvance(cid, LEVEL_EXPERIENCE, oldlevel, newlevel)
	

		if(LEVEL_EXPERIENCE == 99) then
			broadcastMessage("Ok...")
			if(getGlobalStorageValue(gid.STORAGE_LEVEL100) == -1) then
				broadcastMessage("The player ".. getCreatureName(cid) .." is the first player to reach level 100 on Darghos Server!")
				setPlayerStorageValue(cid, sid.FIRST_LEVEL100, 1)
				setGlobalStorageValue(gid.STORAGE_LEVEL100, 2)
			elseif(getGlobalStorageValue(gid.STORAGE_LEVEL100) == 2) then
				broadcastMessage("The player ".. getCreatureName(cid) .." is the second player to reach level 100 on Darghos Server!")
				setPlayerStorageValue(cid, sid.SECOND_LEVEL100, 1)
				setGlobalStorageValue(gid.STORAGE_LEVEL100, 3)		
			elseif(getGlobalStorageValue(gid.STORAGE_LEVEL100) == 3) then
				broadcastMessage("The player ".. getCreatureName(cid) .." is the third player to reach level 100 on Darghos Server!")
				setPlayerStorageValue(cid, sid.THIRD_LEVEL100, 1)
				setGlobalStorageValue(gid.STORAGE_LEVEL100, 3)
			end
		end

end