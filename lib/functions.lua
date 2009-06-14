--[[
	* SETAR NOVOS ITEMS PARA FIRST LOGIN
]]--
function defineFirstItems(cid)

	local storage = sid.FIRSTLOGIN_ITEMS

	
	local array = 
	{
		[1] = {
			legs 	=  getItemIdByName("studded legs"),
			armor	=  getItemIdByName("magician's robe"),
			boots	=  getItemIdByName("leather boots"),
			shield 	=  getItemIdByName("dwarven shield"),
			helmet	=  getItemIdByName("mage hat"),
			weapon	=  getItemIdByName("wand of vortex"),
			food	=  getItemIdByName("brown mushroom"),
			rope	=  getItemIdByName("rope"),
			shovel	=  getItemIdByName("shovel"),
			money	=  getItemIdByName("platinum coin")
		},
		[2] = {
			legs 	=  getItemIdByName("studded legs"),
			armor	=  getItemIdByName("magician's robe"),
			boots	=  getItemIdByName("leather boots"),
			shield 	=  getItemIdByName("dwarven shield"),
			helmet	=  getItemIdByName("mage hat"),
			weapon	=  getItemIdByName("snakebite rod"),
			food	=  getItemIdByName("brown mushroom"),
			rope	=  getItemIdByName("rope"),
			shovel	=  getItemIdByName("shovel"),
			money	=  getItemIdByName("platinum coin")
		},
		[3] = {
			legs 	=  getItemIdByName("studded legs"),
			armor	=  getItemIdByName("belted cape"),
			boots	=  getItemIdByName("leather boots"),
			shield 	=  getItemIdByName("dwarven shield"),
			helmet	=  getItemIdByName("studded helmet"),
			weapon	=  getItemIdByName("spear"),
			food	=  getItemIdByName("brown mushroom"),
			rope	=  getItemIdByName("rope"),
			shovel	=  getItemIdByName("shovel"),
			money	=  getItemIdByName("platinum coin")
		},
		[4] = {
			legs 	=  getItemIdByName("studded legs"),
			armor	=  getItemIdByName("studded armor"),
			boots	=  getItemIdByName("leather boots"),
			shield 	=  getItemIdByName("dwarven shield"),
			helmet	=  getItemIdByName("studded helmet"),
			weapon	=  getItemIdByName("hatchet"),
			weapon2	=  getItemIdByName("mace"),
			weapon3	=  getItemIdByName("katana"),
			food	=  getItemIdByName("brown mushroom"),
			rope	=  getItemIdByName("rope"),
			shovel	=  getItemIdByName("shovel"),
			money	=  getItemIdByName("platinum coin")	
		}
	}
	
	putItems(cid, array[getPlayerVocation(cid)])
	
end
function putItems(cid, add)
	
	local status 	= getPlayerStorageValue(cid, sid.FIRSTLOGIN_ITEMS)


	if(status ~= 1) then
		container = doPlayerAddItem(cid, getItemIdByName("backpack"), 1)
		doAddContainerItem(container, add.food,100)
		doAddContainerItem(container, add.rope,1)
		doAddContainerItem(container, add.shovel,1)
		doAddContainerItem(container, add.money,2)
		doPlayerAddItem(cid, add.armor,1)
		doPlayerAddItem(cid, add.legs,1)		
		doPlayerAddItem(cid, add.boots,1)		
		doPlayerAddItem(cid, add.shield,1)	
		doPlayerAddItem(cid, add.helmet,1)
		if(getPlayerVocation(cid) == 3) then
			doPlayerAddItem(cid, add.weapon,5)
		elseif(getPlayerVocation(cid) == 4) then
			doPlayerAddItem(cid, add.weapon,1)
			doPlayerAddItem(cid, add.weapon2,1)
			doPlayerAddItem(cid, add.weapon3,1)
		else
			doPlayerAddItem(cid, add.weapon,1)		
		end
		setPlayerStorageValue(cid, sid.FIRSTLOGIN_ITEMS, 1)		
	end
end



--[[
 * ATIVANDO O RATE STAGES! USED IN ACTION!
]]--
function setRateStage(cid)
	
	stages = {
	
	first 	= 50,
	second	= 20,
	third	= 10,
	fourth 	= 4,
	fifth	= 2,
	six		= 1
	}

	level 	= getPlayerLevel(cid)
	name 	= getPlayerName(cid)
	
	if(level <= 40) then
		setExperienceRate(cid, stages.first)
	elseif(level > 40) and (level <= 80) then
		setExperienceRate(cid, stages.second)
	elseif(level > 80) and (level <= 120) then
		setExperienceRate(cid, stages.third)
	elseif(level > 120) and (level <= 160) then
		setExperienceRate(cid, stages.fourth)
	elseif(level > 160) and (level <= 220) then
		setExperienceRate(cid, stages.fifth)
	elseif(level > 220) then
		setExperienceRate(cid, stages.six)
	else
		print("Player "..name.." falhou durante o processo de setRateStage.")
	end
	
end
--[[
 * Contem todas fun��es referente ao Darghos
]]--
function checkGeneralInfoPlayer(cid)
	
	local level 		= 	getPlayerLevel(cid)
	
	if(isSorcerer(cid)) or (isDruid(cid)) then
		realHP 	=	(level * 5 + 145)
	elseif(isKnight(cid)) then
		realHP	=	(level * 15 + 65)
	elseif(isPaladin(cid)) then
		realHP	= 	(level * 10 + 105)
	else
		realHP	= 	(level * 5 + 145)
	end
	
	if(getPlayerMaxHealth(cid)) < realHP then
		print("[infoChecker] Player "..getCreatureName(cid).." esta com a life bugada!")
	else
		print("[infoChecker] Player "..getCreatureName(cid).." esta mil grau.")
	end	
	
end


-- Verifica��o ATUAL se um player est� em Area premmy, e teleporta ele para area free.
function runPremiumSystem(cid)

	local name = getCreatureName(cid)
	local message = "Dear "..name..",\nYour premium time is over!\nYou were automatically taken to the temple of Quendor City.\nContinue contributing to the Darghos Server and have a good game!\n\nYours,\nUltraXSoft Team."
	
	if isPremium(cid) == TRUE then
		
		if getPlayerStorageValue(cid,sid.PREMMY_VERIFY) ~= 1 then
		
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,1)
			doSendMagicEffect(getPlayerPosition(cid),11)
			
			print("[premiumsystem] Configurou o Premium Status no Storage Value (Player:"..name..")")
		end
	else
	
		if getPlayerStorageValue(cid, sid.PREMMY_VERIFY) == 1 then
		
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, message)
			doTeleportThing(cid, QUENDOR)
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,0)
			doPlayerSetTown(cid, getTownIdByName("quendor"))
			--Player is not premium - remove premium privileges
			--Change outfit
			local lookType = 128
			if(getPlayerSex(cid) == 0) then
				lookType = 136
			end
			doCreatureChangeOutfit(cid, {lookType = lookType, lookHead = 78, lookBody = 69, lookLegs = 97, lookFeet = 95, lookAddons = 0})
						
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
function checkItemShop(cid)

	local idFromShop = getPlayerStorageValue(cid, sid.ITEM_SHOP_ID)
	
	if idFromShop ~= LUA_ERROR then
		
		local shop_itemid = getPlayerShopItemId(idFromShop)
		local shop_itemcount = getPlayerShopItemCount(idFromShop)
		
		local presentBoxShop = doPlayerAddItem(cid, 1990, 1)
		local addContainer = doAddContainerItem(presentBoxShop, shop_itemid, shop_itemcount)
		
		if getItemWeight(addContainer) > getPlayerFreeCap(cid) then
		
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You don't have capacity needed to receive the item purchased in our Item Shop. Please release " .. itemcap .. "o.z and re-log in to receive the item.")
		else
		
			if addContainer ~= LUA_ERROR then
			
				sendEnvolveEffect(cid, CONST_ME_ENERGYHIT)
			
				setPlayerStorageValue(cid, sid.ITEM_SHOP_ID, -1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You received in your inventory the item purchased in our Item Shop with success!")
				setPlayerShopReceived(idFromShop)
			end
		end		
	end 
	
end