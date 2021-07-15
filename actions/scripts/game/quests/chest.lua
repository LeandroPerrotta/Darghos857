-- Reward Container Model:
-- rewardContainer = containerId
-- rewardItems = {[itemid] = { count, subtype }}

-- Reward exp
-- rewardExp = static exp
-- rewardExpLevel = {minlevel, maxlevel}
-- rewardIncrementLevels = levels to increment

local quests =
	{
		[uid.MOLS_GRIFFIN_SHIELD] = {
			storageId = sid.MOLS_GRIFFIN_SHIELD,
			rewardId = getItemIdByName("griffin shield"),
			count = 1
		},
		
		[uid.MOLS_DWARVEN_AXE] = {
			storageId = sid.MOLS_DWARVEN_AXE,
			rewardId = getItemIdByName("dwarven axe"),
			count = 1
		},
		
		[uid.MOLS_OBSIDIAN_LANCE] = {
			storageId = sid.MOLS_OBSIDIAN_LANCE,
			rewardId = getItemIdByName("obsidian lance"),
			count = 1
		},
		
		[uid.QUEST_BEHE_THIRD] = {
			storageId = sid.QUEST_BEHE_THIRD,
			rewardContainer = 1987,
			rewardContainerItems = { 
				{ itemid = 2145, count = 3 }, -- small diamonds
				{ itemid = 2146, count = 4 }  -- small sapphires
			}
		},
		
		[uid.QUEST_BEHE_SECOND] = {
			storageId = sid.QUEST_BEHE_SECOND,
			rewardContainer = 1987,
			rewardContainerItems = { 
				{ itemid = 2466, count = 1 }, -- golden armor
				{ itemid = 2427, count = 1 }, -- guardian halberd
				{ itemid = 2520, count = 1 }, -- demon shield
				{ itemid = 2171, count = 1 }  -- platinum amulet
			}
		},
		
		[uid.QUEST_BEHE_FIRST] = {
			storageId = sid.QUEST_BEHE_FIRST,
			rewardContainer = 1987,
			rewardContainerItems = { 
				{ itemid = 2168, count = 1 }, -- life ring
				{ itemid = 2124, count = 1 }  -- cristal ring
			}
		},
		
		[uid.ARACURA_DLAIR_FIRE_AXE] = {
			storageId = sid.ARACURA_DLAIR_FIRE_AXE,
			rewardContainer = 1993,
			rewardContainerItems = { 
				{ itemid = 2432, count = 1 }, -- fire axe
				{ itemid = 2214, count = 1 }, -- ring of healing
				{ itemid = 2201, count = 1 }, -- dragon necklace
				{ itemid = 2145, count = 10 } -- small diamond
			}
		},
		
		[uid.GOLDEN_GOBLET_QUEST] = {
			storageId = sid.GOLDEN_GOBLET_QUEST,
			rewardId = getItemIdByName("golden goblet"),
			count = 1
		},
		
		[uid.CHEST_DIVINE_ANKH] = {
			storageId = sid.CHEST_DIVINE_ANKH,
			rewardExp = 3000000,
			rewardContainer = 1990,
			rewardContainerItems = { 
				{ itemid = 2152, count = 100 },
				{ itemid = 2152, count = 100 }
			}
		},	
	
		[uid.XP_PIRATE] = {
			storageId = sid.PIRATE_EXPQUEST,
			rewardExp = 1800000,
			rewardContainer = 5927,
			rewardContainerItems = { 
				{itemid = 6099, count = 1}, -- Brutus Bloodbeard's hat
				{itemid = 6100, count = 1}, -- Lethal Lissy's shirt
				{itemid = 6101, count = 1}, -- Ron the Ripper's sabre
				{itemid = 6102, count = 1} -- Deadeye Devious' eye patch
			}
		},
		
		[uid.XP_HELHEIM] = {
			storageId = sid.HELHEIM_EXPQUEST,
			rewardExp = 1000000,
		},		
		
		[uid.XP_MINES] = {
			storageId = sid.MINES_EXPQUEST,
			rewardExp = 4000000,
		},		
	
		[uid.INQ_ROBE] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8890,
			count = 1
		},
		[uid.INQ_FIREBORN] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8881,
			count = 1
		},
		[uid.INQ_MASTER_ARCHER] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8888,
			count = 1
		},
		[uid.INQ_CLUB] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8928,
			count = 1
		},
		[uid.INQ_AXE] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8924,
			count = 1
		},
		[uid.INQ_SWORD] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8930,
			count = 1
		},
		[uid.INQ_BOOK] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8918,
			count = 1
		},
		[uid.INQ_BOW] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8854,
			count = 1
		},
		[uid.INQ_X_BOW] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8851,
			count = 1
		},
		[uid.BANSHEE_STEALTH] = {
			storageId = sid.BANSHEE_STEALTH,
			rewardId = 2165,
			count = 1
		},
		[uid.BANSHEE_SSA] = {
			storageId = sid.BANSHEE_SSA,
			rewardId = 2197,
			count = 5
		},			
		[uid.BANSHEE_10K] = {
			storageId = sid.BANSHEE_10K,
			rewardId = 2160,
			count = 1
		}	,
		[uid.TOWER_BANSHEE] = {
			storageId = sid.TOWER_BANSHEE,
			rewardId = 2528,
			count = 1
		},		
		[uid.GS_BANSHEE] = {
			storageId = sid.GS_BANSHEE,
			rewardId = 2393,
			count = 1
		}	,
		[uid.BOH_BANSHEE] = {
			storageId = sid.BOH_BANSHEE,
			rewardId = 2195,
			count = 1
		},		
		[uid.QUENDOR_10K] = {
			storageId = sid.QUENDOR_10K,
			rewardId = 2160,
			count = 1
		}	,
		[uid.SERPENT_SWORDARACURA] = {
			storageId = sid.SERPENT_SWORDARACURA,
			rewardId = 2409,
			count = 1
		},	
		[uid.QUEST_50PLATINUM] = {
			storageId = sid.QUEST_50PLATINUM,
			rewardId = 2152,
			count = 50
		},	
		[uid.PSET_ARMOR_ARACURA] = {
			storageId = sid.PSET_ARMOR_ARACURA,
			rewardId = 2463,
			count = 1
		},		
		[uid.PSET_LEGS_ARACURA] = {
			storageId = sid.PSET_LEGS_ARACURA,
			rewardId = 2647,
			count = 1
		},		
		[uid.PLATINUM_10QUEST] = {
			storageId = sid.PLATINUM_10QUEST,
			rewardId = 2160,
			count = 1
		},		
		[uid.DH_SHIELD] = {
			storageId = sid.DH_SHIELD,
			rewardId = 2520,
			count = 1
		},		
		[uid.DH_STEELBOOTS] = {
			storageId = sid.DH_STEELBOOTS,
			rewardId = 2645,
			count = 1
		},
		[uid.DH_HELMET] = {
			storageId = sid.DH_HELMET,
			rewardId = 2493,
			count = 1
		},
		[uid.BEGGAR_STAFF] = {
			storageId = sid.BEGGAR_STAFF,
			rewardId = 6107,
			count = 1
		},
		[uid.ANIHI_SCA] = {
			storageId = sid.ANIHI,
			rewardId = 2431,
			count = 1
		},
		[uid.ANIHI_SOV] = {
			storageId = sid.ANIHI,
			rewardId = 2400,
			count = 1
		},

		[uid.ANIHI_DARM] = {
			storageId = sid.ANIHI,
			rewardId = 2494,
			count = 1
		},
		
		[uid.ANIHI_PRESENT] = {
			storageId = sid.ANIHI,			
			rewardContainer = 1990,
			rewardContainerItems = { 
				{ itemid = 2326, count = 1 }
			}			
		},		
		
		[uid.POI_AVENGUER] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 6528,
			count = 1
		},
		[uid.POI_ARBALEST] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 5803,
			count = 1
		},
		[uid.POI_ARCANE] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 2453,
			count = 1
		},
		[uid.POI_ANKH] = {
			storageId = sid.POI_ANKH,
			rewardId = 6561,
			count = 1
		},
		[uid.POI_STUFFED] = {
			storageId = sid.POI_STUFFED,
			rewardId = 5791,
			count = 1
		},
		[uid.POI_100PLATINUM] = {
			storageId = sid.POI_100PLATINUM,
			rewardId = 2152,
			count = 100
		},
		[uid.POI_FROZEN] = {
			storageId = sid.POI_FROZEN,
			rewardId = 2361,
			count = 1
		},
		[uid.POI_BACKPACK] = {
			storageId = sid.POI_BACKPACK,
			rewardId = 2365,
			count = 1
		},
		[uid.POI_SOFTBOOTS] = {
			storageId = sid.POI_SOFTBOOTS,
			rewardId = 2640,
			count = 1
		},		
		[uid.WYRMS_LIGHTLEGS] = {
			storageId = sid.WYRMS_LIGHTLEGS,
			rewardId = 7895,
			count = 1
		},		
		[uid.HAND_AXE_ROOK] = {
			storageId = sid.HAND_AXE_ROOK,
			rewardId = 2380,
			count = 1
		},		
		[uid.SPIKE_SWORD_ROOK] = {
			storageId = sid.SPIKE_SWORD_ROOK,
			rewardId = 2383,
			count = 1
		},		
		[uid.PLATE_SHIELD_ROOK] = {
			storageId = sid.PLATE_SHIELD_ROOK,
			rewardId = 2510,
			count = 1
		},		
		[uid.KATANA_ROOK] = {
			storageId = sid.KATANA_ROOK,
			rewardId = 2412,
			count = 1
		},		
		[uid.CARLIN_SWORD_ROOK] = {
			storageId = sid.CARLIN_SWORD_ROOK,
			rewardId = 2395,
			count = 1
		},		
		[uid.STUDDED_LEGS_ROOK] = {
			storageId = sid.STUDDED_LEGS_ROOK,
			rewardId = 2468,
			count = 1
		},		
		[uid.VIKING_HELMET_ROOK] = {
			storageId = sid.VIKING_HELMET_ROOK,
			rewardId = 2473,
			count = 1
		},			
		[uid.FISHING_ROD_ROOK] = {
			storageId = sid.FISHING_ROD_ROOK,
			rewardId = 2580,
			count = 1
		},		
		[uid.CHAINARMOR_ROOK] = {
			storageId = sid.CHAINARMOR_ROOK,
			rewardId = 2464,
			count = 1
		},		
		[uid.MACHETE_ROOK] = {
			storageId = sid.MACHETE_ROOK,
			rewardId = 2420,
			count = 1
		},		
		[uid.STUDDED_SHIELDROOK] = {
			storageId = sid.STUDDED_SHIELDROOK,
			rewardId = 2526,
			count = 1
		},	
		[uid.RAT_ROOKCAVE] = {
			storageId = sid.RAT_ROOKCAVE,
			rewardId = 2384,
			count = 1
		},
		[uid.BASTSKIRT_DWORCS] = {
			storageId = sid.BASTSKIRT_DWORCS,
			rewardId = 2798,
			count = 1
		},
		[uid.BHERB_GS] = {
			storageId = sid.BHERB_GS,
			rewardId = 2798,
			count = 5
		},	
		[uid.WSTAKE_VAMP] = {
			storageId = sid.WSTAKE_VAMP,
			rewardId = 5941,
			count = 1
		},
		[uid.PLEGS_ELFCAMP] = {
			storageId = sid.PLEGS_ELFCAMP,
			rewardId = 2647,
			count = 1
		},		
		[uid.GSILK_ELFCAMP] = {
			storageId = sid.GSILK_ELFCAMP,
			rewardId = 5879,
			count = 4
		},		
		[uid.ROH_QUENDORCAVES] = {
			storageId = sid.ROH_QUENDORCAVES,
			rewardId = 2214,
			count = 1
		},		
		[uid.CEM_BOLTS_QUENDOR] = {
			storageId = sid.CEM_BOLTS_QUENDOR,
			rewardId = 2543,
			count = 100
		},	
		[uid.CEM_GOLDS_CYCS] = {
			storageId = sid.CEM_GOLDS_CYCS,
			rewardId = 2148,
			count = 100
		},
		[uid.DEVIL_HELMET_ANCIENT] = {
			storageId = sid.DEVIL_HELMET_ANCIENT,
			rewardId = 2462,
			count = 1
		},
		[uid.SMALL_SAPHIRE_ANCIENT] = {
			storageId = sid.SMALL_SAPHIRE_ANCIENT,
			rewardId = 2146,
			count = 10
		},
		[uid.QROD_ANCIENTQUEST] = {
			storageId = sid.QROD_ANCIENTQUEST,
			rewardId = 8911,
			count = 1
		},
		[uid.BROBE_ANCIENTQUEST] = {
			storageId = sid.BROBE_ANCIENTQUEST,
			rewardId = 2656,
			count = 1
		},
		[uid.MIGHT_RING_QUENDOR] = {
			storageId = sid.MIGHT_RING_QUENDOR,
			rewardId = 2164,
			count = 1
		},		
		[uid.SCALE_ARMOR_QUENDOR] = {
			storageId = sid.SCALE_ARMOR_QUENDOR,
			rewardId = 2483,
			count = 1
		},	
		[uid.STEEL_SHIELD_QUENDOR] = {
			storageId = sid.STEEL_SHIELD_QUENDOR,
			rewardId = 2509,
			count = 1
		},	
		[uid.BRASS_LEGS_QUENDOR] = {
			storageId = sid.BRASS_LEGS_QUENDOR,
			rewardId = 2478,
			count = 1
		},
		[uid.BRASS_ARMOR_QUENDOR] = {
			storageId = sid.BRASS_ARMOR_QUENDOR,
			rewardId = 2465,
			count = 1
		},	
		[uid.CRUSADER_HELMET] = {
			storageId = sid.CRUSADER_HELMET,
			rewardId = 2497,
			count = 1
		},		
		[uid.ORC_KAXE] = {
			storageId = sid.ORC_KAXE,
			rewardId = 2430,
			count = 1
		},
		[uid.ORC_KARMOR] = {
			storageId = sid.ORC_KARMOR,
			rewardId = 2476,
			count = 1
		},		
		[uid.ORC_FSWORD] = {
			storageId = sid.ORC_FSWORD,
			rewardId = 2392,
			count = 1
		},		
		[uid.BK_CARMOR] = {
			storageId = sid.BK_CARMOR,
			rewardId = 2487,
			count = 1
		},
		[uid.BK_CSHIELD] = {
			storageId = sid.BK_CSHIELD,
			rewardId = 2519,
			count = 1
		},		
		[uid.NOBLE_ARMOR_QUENDOR] = {
			storageId = sid.NOBLE_ARMOR_QUENDOR,
			rewardId = 2486,
			count = 1
		},
	}

function useQuestChest(cid, quest, questActionId)
	local queststatus = getPlayerStorageValue(cid, quest.storageId)
	if queststatus == -1 then
	
		if(quest.rewardId) then
		
			doPlayerSendTextMessage(cid, 25, "You have found a " .. getItemName(quest.rewardId) .. ".")
			doPlayerAddItem(cid, quest.rewardId, quest.count)
		elseif(quest.rewardContainer) then
			
			-- Verificamos se o container de reward items est� em ordem!!
			if(quest.rewardContainerItems == nil) then
			
				debugPrint("QuestChest: Reward container items not found.")
				return
			end		
			
			local containerItems = quest.rewardContainerItems
			local container = doPlayerAddItem(cid, quest.rewardContainer, 1)
			
			for key, value in pairs(containerItems) do
			
				if(containerItems[key].itemid == nil) then
				
					debugPrint("QuestChest: container item [" .. value.itemid .. "] not have proprieties found.")
					return				
				end
					
				doAddContainerItem(container, value.itemid, value.count)
				
				doPlayerSendTextMessage(cid, 25, "You have found a " .. getItemName(value.itemid) .. ".")
			end
		end
		
		if(quest.rewardExp ~= nil or quest.rewardExpLevel ~= nil or quest.rewardIncrementLevels ~= nil) then
		
			local expToAdd = 0
		
			if(quest.rewardExp ~= nil) then
			
				expToAdd = quest.rewardExp
			elseif(quest.rewardExpLevel.min ~= nil and quest.rewardExpLevel.max ~= nil)	then
			
				local min = quest.rewardExpLevel.min
				local max = quest.rewardExpLevel.max
			
				expToAdd = Calculator.getExpLeft(min, max)
			elseif(quest.rewardIncrementLevels ~= nil) then	
			
				expToAdd = Calculator.getExpLeft(getPlayerLevel(cid), getPlayerLevel(cid) + quest.rewardIncrementLevels)
			end
		
			doPlayerAddExp(cid, expToAdd)
			doSendAnimatedText(getCreaturePosition(cid), expToAdd, TEXTCOLOR_YELLOW)
			
			local position = getCreaturePosition(cid)
			local i = 0
			while i <= 100 do
				doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, 33)
				i = i + 1
			end				
		end
		
		setPlayerStorageValue(cid, quest.storageId, 1)	
		chestScripts(cid, questActionId)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
	end
end

function onUse(cid, item, frompos, item2, topos)
	if quests[item.uid] ~= nil then
		useQuestChest(cid, quests[item.uid], item.uid)
	end
	return TRUE
end
