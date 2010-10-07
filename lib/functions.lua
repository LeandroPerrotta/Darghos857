function addShieldTriesInTrain(cid, target)

	local lastTry = getPlayerStorageValue(cid, sid.LAST_TRY_SHIELD)

	if(lastTry == -1 or os.date() + 2 > lastTry) then
		doPlayerAddSkillTry(cid, LEVEL_SKILL_SHIELDING, 2, TRUE)
	end
	
	local cTarget = getCreatureTarget(cid)
	
	if(cTarget == TRUE and cTarget == target) then
		setPlayerStorageValue(cid, sid.LAST_TRY_SHIELD, os.date())
		addEvent(addShieldTriesInTrain, 1000 * 2, cid, target)
	end
end

function addAllOufits(cid)

	if(isPlayer(cid) == TRUE) then
	
		doPlayerAddOutfit(cid, outfits.CITIZEN.male, 3)
		doPlayerAddOutfit(cid, outfits.CITIZEN.female, 3)
		
		doPlayerAddOutfit(cid, outfits.HUNTER.male, 3)
		doPlayerAddOutfit(cid, outfits.HUNTER.female, 3)
		
		doPlayerAddOutfit(cid, outfits.MAGE.male, 3)
		doPlayerAddOutfit(cid, outfits.MAGE.female, 3)
		
		doPlayerAddOutfit(cid, outfits.KNIGHT.male, 3)
		doPlayerAddOutfit(cid, outfits.KNIGHT.female, 3)
		
		doPlayerAddOutfit(cid, outfits.NOBLE.male, 3)
		doPlayerAddOutfit(cid, outfits.NOBLE.female, 3)
		
		doPlayerAddOutfit(cid, outfits.SUMMONER.male, 3)
		doPlayerAddOutfit(cid, outfits.SUMMONER.female, 3)
		
		doPlayerAddOutfit(cid, outfits.WARRIOR.male, 3)
		doPlayerAddOutfit(cid, outfits.WARRIOR.female, 3)
		
		doPlayerAddOutfit(cid, outfits.BARBARIAN.male, 3)
		doPlayerAddOutfit(cid, outfits.BARBARIAN.female, 3)
		
		doPlayerAddOutfit(cid, outfits.DRUID.male, 3)
		doPlayerAddOutfit(cid, outfits.DRUID.female, 3)
		
		doPlayerAddOutfit(cid, outfits.WIZARD.male, 3)
		doPlayerAddOutfit(cid, outfits.WIZARD.female, 3)
		
		doPlayerAddOutfit(cid, outfits.ORIENTAL.male, 3)
		doPlayerAddOutfit(cid, outfits.ORIENTAL.female, 3)
		
		doPlayerAddOutfit(cid, outfits.PIRATE.male, 3)
		doPlayerAddOutfit(cid, outfits.PIRATE.female, 3)
		
		doPlayerAddOutfit(cid, outfits.ASSASSIN.male, 3)
		doPlayerAddOutfit(cid, outfits.ASSASSIN.female, 3)
		
		doPlayerAddOutfit(cid, outfits.BEGGAR.male, 3)
		doPlayerAddOutfit(cid, outfits.BEGGAR.female, 3)
		
		doPlayerAddOutfit(cid, outfits.SHAMAN.male, 3)
		doPlayerAddOutfit(cid, outfits.SHAMAN.female, 3)
		
		doPlayerAddOutfit(cid, outfits.NORSE.male, 3)
		doPlayerAddOutfit(cid, outfits.NORSE.female, 3)
		
		doPlayerAddOutfit(cid, outfits.NIGHTMARE.male, 3)
		doPlayerAddOutfit(cid, outfits.NIGHTMARE.female, 3)
		
		doPlayerAddOutfit(cid, outfits.JESTER.male, 3)
		doPlayerAddOutfit(cid, outfits.JESTER.female, 3)
		
		doPlayerAddOutfit(cid, outfits.BROTHERHOOD.male, 3)
		doPlayerAddOutfit(cid, outfits.BROTHERHOOD.female, 3)
		
		doPlayerAddOutfit(cid, outfits.DEMONHUNTER.male, 3)
		doPlayerAddOutfit(cid, outfits.DEMONHUNTER.female, 3)
		
		doPlayerAddOutfit(cid, outfits.YALAHARIAN.male, 3)
		doPlayerAddOutfit(cid, outfits.YALAHARIAN.female, 3)
		
		doPlayerAddOutfit(cid, outfits.WARMASTER.male, 3)
		doPlayerAddOutfit(cid, outfits.WARMASTER.female, 3)
		
		doPlayerAddOutfit(cid, outfits.WEEDING.male, 3)
		doPlayerAddOutfit(cid, outfits.WEEDING.female, 3)
	end
end

--[[
	* REGISTRO DE EVENTOS ONKILL PARA MISS�ES
]]--
function OnKillCreatureMission(cid)

	-- Bonartes Mission's
	local _demonMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_DEMONS)
	local _heroMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_HEROS)
	local _behemothMission = getPlayerStorageValue(cid, QUESTLOG.MISSION_BONARTES.KILL_BEHEMOTHS)	
	
	if(_heroMission == 2 or _behemothMission == 1 or _demonMission == 1) then
		registerCreatureEvent(cid, "OnKillMission")
	end
end

--[[
	* DIVINE ANKH QUEST
]]--
function onLordVankynerDie()

	local door = getThing(uid.CHURCH_CHAMBER_DOOR)
	
	doSetItemActionId(door.uid, 0)
	
	addEvent(LordVankynerEvent, 1000 * 60 * 10)		
end

function LordVankynerEvent()

	local door = getThing(uid.CHURCH_CHAMBER_DOOR)
	
	doSetItemActionId(door.uid, 10000)
	
	local ALTAR_ID = 1643
	
	local altar = doCreateItem(ALTAR_ID, 1, mcord.CHURCH_ALTAR)
	doSetItemActionId(altar, aid.CHURCH_ALTAR)
	
	summonLordVankyner()
end

function summonLordVankyner()

	local creaturePos = getThingPos(uid.LORD_VANKYNER)
	local creature = doSummonCreature("Lord Vankyner", creaturePos)
	registerCreatureEvent(creature, "CreatureDie")
end

--[[
	* ARIADNE QUEST
]]--
function onGhazranDie(corpse)

	doSetItemActionId(corpse, aid.ARIADNE_GHAZRAN_CORPSE)
end

function obsidianKnifeOnGhazranCorpse(cid, corpse)

	local hasRemovedTongue = (getPlayerStorageValue(cid, sid.ARIADNE_GHAZRAN_TONGUE) == 1)
	
	if not(hasRemovedTongue) then

		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� conseguiu obter a l�ngua de Ghazran. Seu questlog foi atualizado.")
		setPlayerStorageValue(cid, sid.ARIADNE_GHAZRAN_TONGUE, 1)
		setPlayerStorageValue(cid, QUESTLOG.ARIADNE.GHAZRAN_WING, 3)
	else
		doPlayerSendCancel(cid, "Voc� j� obteve a l�ngua de Ghazran.")
	end
end

--[[
	@ Chama scripts customizados para quests em chests.lua
]]--
function chestScripts(cid, questActionId)

	if(questActionId == aid.CHEST_DIVINE_ANKH) then
		setPlayerStorageValue(cid, QUESTLOG.DIVINE_ANKH.CHAMBER_TEMPTATION, 4)
	end
end

--[[
	@ Fun��o chamada quando o server � iniciado
]]--
function onServerStart()

	Dungeons.onServerStart()
	
	summonLordVankyner()
end


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

	if(getPlayerTown(cid) ~= towns.ISLAND_OF_PEACE and getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) ~= 1) then
		setPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE, 1)
	end

	local stages = {
		normal 		= 4,
		reborn_1	= 3	
	}
	
	if(getPlayerStorageValue(cid, sid.ON_ISLAND_OF_PEACE) == 1) then
	
		local reborns = getPlayerStorageValue(cid, sid.REBORNS)
	
		if(reborns == 0 or reborns == -1) then
			setExperienceRate(cid, stages.normal)
		elseif(reborns == 1) then
			setExperienceRate(cid, stages.reborn_1)
		end
	else
		if(newlevel > 80) then
			setExperienceRate(cid, 1)
		else
			setExperienceRate(cid, stages.normal)
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
			
		if(getPlayerSkill(cid, LEVEL_SKILL_AXE) >= 85) then		
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
		
		if(getPlayerMagLevel(cid) >= 50) then		
			setSkillRate(cid, LEVEL_MAGIC, 1)	
		else	
			setSkillRate(cid, LEVEL_MAGIC, 7)	
		end			
	else
	
		setSkillRate(cid, LEVEL_SKILL_FIST, 30)
		setSkillRate(cid, LEVEL_SKILL_CLUB, 30)
		setSkillRate(cid, LEVEL_SKILL_SWORD, 30)
		setSkillRate(cid, LEVEL_SKILL_AXE, 30)
		setSkillRate(cid, LEVEL_SKILL_DISTANCE, 30)
		setSkillRate(cid, LEVEL_SKILL_SHIELDING, 30)
		setSkillRate(cid, LEVEL_SKILL_FISHING, 30)	
		setSkillRate(cid, LEVEL_MAGIC, 7)			
	end	
end

function playerRecord()

	local record = getGlobalStorageValue(gid.PLAYERS_RECORD)
	
	if(record ~= -1) then
		
		local playerson = getPlayersOnlineList()
		local total = #playerson
		
		if(total <= 50) then
			total = total * 2
		else
			total = total + 50
		end
		
		if(total > record) then
		
			setGlobalStorageValue(gid.PLAYERS_RECORD, total)
			broadcastMessage("A marca de ".. total .." jogadores online é um novo recorde no Darghos!", MESSAGE_EVENT_DEFAULT)
		end
	else

		setGlobalStorageValue(gid.PLAYERS_RECORD, 200)
	end
end

function msgcontains(txt, str)
      return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

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
