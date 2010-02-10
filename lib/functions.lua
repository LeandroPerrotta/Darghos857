--[[
	* GLOBAL SERVER SAVE
]]--
function startGlobalSave()
	
	broadcastMessage("Efetuando pause para auto save...", MESSAGE_STATUS_CONSOLE_RED)
	print("[autosave] Auto save iniciando...")
	addEvent(endGlobalSave, 500)
	
end

function endGlobalSave()

	if(doSaveServer(TRUE) ~= LUA_ERROR) then
		broadcastMessage("Auto save concluido.", MESSAGE_STATUS_CONSOLE_RED)
		print("[autosave] Auto save concluido.")
	else
		print("[saveserver] Auto save falhou.")
	end
end

--[[
	* TRAINERS
]]--
function addTrainer(actionid)

	if(actionid == aid.TRAINERS_WEST) then
		local pos = {
			trainer1 = {x= item.x-1, y= item.y-1, z= item.z},
			trainer2 = {x= item.x-1, y= item.y+1, z= item.z}				
		}
	end
	
	if(actionid == aid.TRAINERS_EAST) then
		local pos = {
			trainer1 = {x= item.x-1, y= item.y-1, z= item.z},
			trainer2 = {x= item.x-1, y= item.y+1, z= item.z}				
		}	
	end
	
	

end

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

function setRateStage(cid, newlevel)

	if(getPlayerTown(cid) ~= 6 and getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) ~= 1) then
		setPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE, 1)
	end

	local stages = {
	
		first 	= 50,
		second	= 20,
		third	= 10,
		fourth 	= 4,
		fifth	= 2,
		sixth	= 1
	
	}
	
	if(getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) == 1) then
		if(newlevel < 40) then
			setExperienceRate(cid, stages.first)
		elseif(newlevel < 80) then
			setExperienceRate(cid, stages.second)
		elseif(newlevel < 120) then
			setExperienceRate(cid, stages.third)
		elseif(newlevel < 160) then
			setExperienceRate(cid, stages.fourth)
		elseif(newlevel < 220) then
			setExperienceRate(cid, stages.fifth)
		else
			setExperienceRate(cid, stages.sixth)
		end
	else
		if(newlevel < 20) then
			setExperienceRate(cid, stages.first)
		elseif(newlevel < 60) then
			setExperienceRate(cid, stages.second)
		elseif(newlevel < 80) then
			setExperienceRate(cid, stages.third)
		else
			setExperienceRate(cid, stages.sixth)
		end		
	end	
	
	return LUA_TRUE

end

function setLoginSkillRateStages(cid)

	if(getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) == -1) then
	
		if(getPlayerSkill(cid, LEVEL_SKILL_FIST) >= 85) then
			setSkillRate(cid, LEVEL_SKILL_FIST, 1)
		else
			setSkillRate(cid, LEVEL_SKILL_FIST, 30)
		end	
			
		if(getPlayerSkill(cid, LEVEL_SKILL_CLUB) >= 85) then	
			setSkillRate(cid, LEVEL_SKILL_CLUB, 1)
		else
			setSkillRate(cid, LEVEL_SKILL_CLUB, 30)
		end		
			
		if(getPlayerSkill(cid, LEVEL_SKILL_SWORD) >= 85) then		
			setSkillRate(cid, LEVEL_SKILL_SWORD, 1)
		else	
			setSkillRate(cid, LEVEL_SKILL_SWORD, 30)
		end		
			
		if(getPlayerSkill(cid, LEVEL_SKILL_SWORD) >= 85) then		
			setSkillRate(cid, LEVEL_SKILL_AXE, 1)
		else	
			setSkillRate(cid, LEVEL_SKILL_AXE, 30)
		end		
			
		if(getPlayerSkill(cid, LEVEL_SKILL_DISTANCE) >= 85) then	
			setSkillRate(cid, LEVEL_SKILL_DISTANCE, 1)
		else	
			setSkillRate(cid, LEVEL_SKILL_DISTANCE, 30)
		end		
			
		if(getPlayerSkill(cid, LEVEL_SKILL_SHIELDING) >= 85) then		
			setSkillRate(cid, LEVEL_SKILL_SHIELDING, 1)
		else	
			setSkillRate(cid, LEVEL_SKILL_SHIELDING, 30)
		end		
			
		if(getPlayerSkill(cid, LEVEL_SKILL_FISHING) >= 85) then		
			setSkillRate(cid, LEVEL_SKILL_FISHING, 1)	
		else	
			setSkillRate(cid, LEVEL_SKILL_FISHING, 30)	
		end		
	else
	
		setSkillRate(cid, LEVEL_SKILL_FIST, 30)
		setSkillRate(cid, LEVEL_SKILL_CLUB, 30)
		setSkillRate(cid, LEVEL_SKILL_SWORD, 30)
		setSkillRate(cid, LEVEL_SKILL_AXE, 30)
		setSkillRate(cid, LEVEL_SKILL_DISTANCE, 30)
		setSkillRate(cid, LEVEL_SKILL_SHIELDING, 30)
		setSkillRate(cid, LEVEL_SKILL_FISHING, 30)			
	end	
end

function playerRecord()

	local record = getGlobalStorageValue(gid.PLAYERS_RECORD)
	
	if(record ~= -1) then
		
		local playerson = getPlayersOnlineList()
		local total = #playerson
		
		--[[if(total <= 100) then
			total = total * 2
		else
			total = total + 100
		end]]--
		
		if(total > record) then
		
			setGlobalStorageValue(gid.PLAYERS_RECORD, total)
			broadcastMessage("A marca de ".. total .." jogadores online é um novo recorde no Darghos!", MESSAGE_EVENT_DEFAULT)
		end
	else

		setGlobalStorageValue(gid.PLAYERS_RECORD, 200)
	end
end




--[[
 * ATIVANDO O RATE STAGES! USED IN ACTION!

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
]]--
--[[
 * Contem todas funções referente ao Darghos
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


-- Verificação ATUAL se um player está em Area premmy, e teleporta ele para area free.
function runPremiumSystem(cid)

	local name = getCreatureName(cid)
	if(getPlayerTown(cid) == getTownIdByName("Island of Peace")) then
		backCity = "Island of Peace"
	else
		backCity = "Quendor City"
	end	
	local message = "Dear "..name..",\nYour premium time is over!\nYou were automatically taken to the temple of "..backCity..".\nContinue contributing to the Darghos Server and have a good game!\n\nYours,\nUltraXSoft Team."
	
	if isPremium(cid) == TRUE then
		
		if getPlayerStorageValue(cid,sid.PREMMY_VERIFY) ~= 1 then
		
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,1)
			doSendMagicEffect(getPlayerPosition(cid),11)
			
			--print("[premiumsystem] Configurou o Premium Status no Storage Value (Player:"..name..")")
		end
	else
	
		if getPlayerStorageValue(cid, sid.PREMMY_VERIFY) == 1 then
			
			if(getPlayerTown(cid) == getTownIdByName("Island of Peace")) then
				TP_CITY = ISLAND_PEACE
				ID_NAME = "Island of Peace"
			else
				TP_CITY = QUENDOR
				ID_NAME = "quendor"	
			end
			
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, message)
			doTeleportThing(cid, TP_CITY)
			setPlayerStorageValue(cid, sid.PREMMY_VERIFY,0)
			doPlayerSetTown(cid, getTownIdByName(ID_NAME))
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

	local shop_id = getPlayerStorageValue(cid, sid.SHOPSYS_ID)
	
	if shop_id ~= -1 then
		if(getPlayerFreeCap(cid) > 350) then
			local shop_itemid = getPlayerStorageValue(cid, sid.SHOPSYS_ITEM_ID)
			local shop_itemcount = getPlayerStorageValue(cid, sid.SHOPSYS_ITEM_COUNT)
			
			local presentBoxShop = doPlayerAddItem(cid, 1990, 1)
			local addContainer = doAddContainerItem(presentBoxShop, shop_itemid, shop_itemcount)
			
				if addContainer == LUA_ERROR then
					print("[itemshopsys] Item falhou ao ser adicionado (shopid: " .. shop_id .. ")")
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Ouve um erro ao entregar seu item, por favor, entre em contato com um Tutor ou Gamemaster.")
					
					setPlayerStorageValue(cid, sid.SHOPSYS_ID, 0)
					return
				end
				
				sendEnvolveEffect(cid, CONST_ME_ENERGYHIT)
			
				setPlayerStorageValue(cid, sid.SHOPSYS_ID, -1)
				setPlayerStorageValue(cid, sid.SHOPSYS_ITEM_ID, -1)
				setPlayerStorageValue(cid, sid.SHOPSYS_ITEM_COUNT, -1)
				
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You received in your inventory the item purchased in our Item Shop with success!")
				
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You don't have capacity needed to receive the item purchased in our Item Shop. Please release 350oz and re-log in to receive the item.")
			--print("[itemshopsys] Nao possui cap sulficiente (shopid: " .. idFromShop .. ")")
		end
	end 
	
end
