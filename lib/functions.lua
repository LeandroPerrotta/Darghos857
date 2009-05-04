--[[
 * Contem todas funções referente ao Darghos
]]--

-- Verificação ATUAL se um player está em Area premmy, e teleporta ele para area free.
function runPremiumSystem(cid)
	local message = "Dear "..getCreatureName(cid)..",\nYour premium time is over!\nYou were automatically taken to the temple of Quendor City.\nContinue contributing to the Darghos Server and have a good game!\n\nYours,\nUltraXSoft Team."
	
	if isPremium(cid) == TRUE then
		print("[premiumsystem] Possui premium")
		
		if getPlayerStorageValue(cid,sid.PREMMY_VERIFY) ~= 1 then
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,1)
			doSendMagicEffect(getPlayerPosition(cid),11)
			
			print("[premiumsystem] Configurou o Premium Statys no Storage Value")
		end
	else
		print("[premiumsystem] Nao possui premium")
	
		if getPlayerStorageValue(cid, sid.PREMMY_VERIFY) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, message)
			doTeleportThing(cid, QUENDOR)
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,0)
			doPlayerSetTown(cid, getTownIdByName("quendor"))
			
			print("[premiumsystem] Moveu o player para Quendor")
		end
	end
end

-- Verifica se o player está em area premium sendo um free account
-- Usado em creaturescripts/login.lua
function freeInPremiumArea(cid)

	local message = "Dear "..getCreatureName(cid)..",\nYour premium time is over!\nYou were automatically taken to the temple of Quendor City.\nContinue contributing to the Darghos Server and have a good game!\n\nYours,\nUltraXSoft Team."
	local PremDay = getPlayerPremiumDays(cid)	
	
	if isInArea(getCreaturePosition(cid), areaCheck.ARACURA_START, areaCheck.ARACURA_END) or isInArea(getCreaturePosition(cid), areaCheck.NORTHREND_START, areaCheck.NORTHREND_END) or isInArea(getCreaturePosition(cid), areaCheck.SALAZART_START, areaCheck.SALAZART_END) then
		if PremDay < 1 then
			doTeleportThing(cid, QUENDOR)
			doPlayerPopupFYI(cid,message)
		end
    end
end 

-- Reproduz um efeito em torno do jogador
function sendEnvolveEffect(cid, effect)

	doSendMagicEffect(getPlayerPosition(cid), effect)
	doSendMagicEffect({x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z}, effect) 
	doSendMagicEffect({x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z}, effect)
	doSendMagicEffect({x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z}, effect)
	doSendMagicEffect({x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z}, effect) 
	doSendMagicEffect({x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z}, effect) 
	doSendMagicEffect({x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}, effect)
	doSendMagicEffect({x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z}, effect)
	doSendMagicEffect({x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}, effect) 	
end 

-- Verifica se o player possui um item no shop a receber
-- Usado em creaturescripts/login.lua
function itemFromShop(cid)

	local itemshopid = getPlayerStorageValue(cid, sid.ITEM_SHOP_ID)
	
	if itemshopid ~= LUA_ERROR then
		
		local shop_rows = db.getResult("SELECT * FROM `wb_itemshop` WHERE `id` = " .. itemshopid .. ";")
		local shoplist_rows = db.getResult("SELECT * FROM `wb_itemshop_list` WHERE `id` = " .. shop_fetch.itemlist_id .. ";")
		
		local itemcap = getItemWeight(shoplist_rows.getDataInt(item_id), shoplist_rows.getDataInt(count)) + getItemWeight(2326, 1)
		
		if itemcap > getPlayerFreeCap(cid) then
			doPlayerPopupFYI(cid, "You don't have capacity needed to receive the item purchased in our Item Shop. Please release " .. itemcap .. "o.z and re-log in to receive the item.")
		else
		
			presentBoxShop = doPlayerAddItem(cid, 1990, 1)
			if doAddContainerItem(presentBoxShop, shoplist_rows.getDataInt(item_id), shoplist_rows.getDataInt(count)) ~= LUA_ERROR then
			
				sendEnvolveEffect(cid, CONST_ME_ENERGYHIT)
			
				setPlayerStorageValue(cid, sid.ITEM_SHOP_ID, -1)
				doPlayerPopupFYI(cid, "You received in your inventory the item purchased in our Item Shop with success!")
				db.executeQuery("UPDATE `wb_itemshop` SET received = '1' WHERE `id` = " .. itemshopid .. ";")
				
			end
		end		
	end 
	
end 	