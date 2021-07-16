-- START CONFIGURE

-- O item entregue virá dentro de um container (padrão 1990 = present box)
-- Atribua zero para não vir dentro de um container
PURCHASE_CONTAINER = 1990

-- END CONFIGURE

ITEMSHOP_STATUS = {
	TO_RECEIVE = 1,
	RECEIVED = 0
}

ItemShop = {
}

function ItemShop.onLogin(cid)

	local pid = getPlayerGUID(cid)
	
	local itemsList = ItemShop.loadPurchaseList(pid)
	
	-- nenhum item comprado para entregar, não fazer nada
	if(not(itemsList)) then
		return
	end
	
	--print("Id: " .. id .. " Shop Id: " .. id)
	print(#itemsList)

	--[[for id, shop_id in pairs(itemsList) do

		local product = ItemShop.loadProductInfo(shop_id)
		
		if(PURCHASE_CONTAINER ~= 0) then
			container = doCreateItemEx(PURCHASE_CONTAINER, 1)
			item = doCreateItemEx(product.item_id, product.count)
			
			if(doAddContainerItemEx(container, item) == FALSE) then
				print("[ITEMSHOP] Fail adding item to container, operation interrupted")
				return
			end
			
			if(doPlayerAddItemEx(cid, container) == FALSE) then
				print("[ITEMSHOP] Fail adding item to player, operation interrupted")
				return
			end
			
		else
			item = doCreateItemEx(product.item_id, product.count)
			
			if(doPlayerAddItemEx(cid, item) == FALSE) then
				print("[ITEMSHOP] Fail adding non container item to player, operation interrupted")
				return
			end			
		end
		
		db.query("UPDATE `player_itemshop` SET `status` = '".. ITEMSHOP_STATUS.RECEIVED .."' WHERE `id` = '" .. id .. "';")
	end ]]
end

function ItemShop.loadProductInfo(id)
	local query = db.getResult("SELECT `params` FROM `itemshop_list` WHERE `id` = '" .. id .. "';")

	if(query:getID() == -1) then
		print("[ITEMSHOP] Fail loading product info for id " .. id)
		return false
	end
	
	local product = {}
	local params = string.explode(query:getDataString("params"), ";")
	local count = #params
	if(count == 1) then
		print("[ITEMSHOP] Incorrect params (1)")
	elseif(count > 1 and count >= 3) then
		
		product.item_id = params[0]
		product.count = params[1]
		
		if(count == 3) then
			product.subtype = params[2]
		end
	else
		print("[ITEMSHOP] Incorrect params (2)")
	end
	
	query:free();
	
	return product;
end

function ItemShop.loadPurchaseList(player_id)
	local query = db.getResult("SELECT `id`, `shop_id` FROM `player_itemshop` WHERE `player_id` = '" .. player_id .. "' AND `status` = '" .. ITEMSHOP_STATUS.TO_RECEIVE .. "';")
	
	if(query:getID() == -1) then
		return false
	end
	
	local purchaseList = {}
	
	repeat
	
		local _id = query:getDataInt("id")
		local _shop_id = query:getDataInt("shop_id")
	
		table.insert(purchaseList, {id = _id, shop_id = _shop_id})
	until not(query:next())
	query:free();
	
	return purchaseList
end
