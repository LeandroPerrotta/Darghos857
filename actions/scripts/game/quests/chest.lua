-- Reward Container Model:
-- rewardContainer = containerId
-- rewardItems = {[itemid] = { count, subtype }}

-- Reward exp
-- rewardExp = static exp
-- rewardExpLevel = {minlevel, maxlevel}
-- rewardIncrementLevels = levels to increment

local quests =
	{
		[aid.CHEST_DIVINE_ANKH] = {
			storageId = sid.CHEST_DIVINE_ANKH,
			rewardExp = 3000000,
			rewardContainer = 1990,
			rewardContainerItems = { 
				{ itemid = 2152, count = 100 },
				{ itemid = 2152, count = 100 }
			}
		},	
	
		[aid.XP_PIRATE] = {
			storageId = sid.PIRATE_EXPQUEST,
			rewardExp = 1800000,
			rewardContainer = 5927,
			rewardContainerItems = { 
				[6099] = { count = 1 },
				[6100] = { count = 1 },
				[6101] = { count = 1 },
				[6102] = { count = 1 }
			}
		},
		
		[aid.XP_HELHEIM] = {
			storageId = sid.HELHEIM_EXPQUEST,
			rewardExp = 1000000,
		},		
		
		[aid.XP_MINES] = {
			storageId = sid.MINES_EXPQUEST,
			rewardExp = 4000000,
		},		
	
		[aid.INQ_ROBE] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8890,
			count = 1
		},
		[aid.INQ_FIREBORN] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8881,
			count = 1
		},
		[aid.INQ_MASTER_ARCHER] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8888,
			count = 1
		},
		[aid.INQ_CLUB] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8928,
			count = 1
		},
		[aid.INQ_AXE] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8924,
			count = 1
		},
		[aid.INQ_SWORD] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8930,
			count = 1
		},
		[aid.INQ_BOOK] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8918,
			count = 1
		},
		[aid.INQ_BOW] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8854,
			count = 1
		},
		[aid.INQ_X_BOW] = {
			storageId = sid.INQ_CHESTS,
			rewardId = 8851,
			count = 1
		},
		[aid.BANSHEE_STEALTH] = {
			storageId = sid.BANSHEE_STEALTH,
			rewardId = 2165,
			count = 1
		},
		[aid.BANSHEE_SSA] = {
			storageId = sid.BANSHEE_SSA,
			rewardId = 2197,
			count = 5
		},			
		[aid.BANSHEE_10K] = {
			storageId = sid.BANSHEE_10K,
			rewardId = 2160,
			count = 1
		}	,
		[aid.TOWER_BANSHEE] = {
			storageId = sid.TOWER_BANSHEE,
			rewardId = 2528,
			count = 1
		},		
		[aid.GS_BANSHEE] = {
			storageId = sid.GS_BANSHEE,
			rewardId = 2393,
			count = 1
		}	,
		[aid.BOH_BANSHEE] = {
			storageId = sid.BOH_BANSHEE,
			rewardId = 2195,
			count = 1
		},		
		[aid.QUENDOR_10K] = {
			storageId = sid.QUENDOR_10K,
			rewardId = 2160,
			count = 1
		}	,
		[aid.SERPENT_SWORDARACURA] = {
			storageId = sid.SERPENT_SWORDARACURA,
			rewardId = 2409,
			count = 1
		},	
		[aid.QUEST_50PLATINUM] = {
			storageId = sid.QUEST_50PLATINUM,
			rewardId = 2152,
			count = 50
		},	
		[aid.PSET_ARMOR_ARACURA] = {
			storageId = sid.PSET_ARMOR_ARACURA,
			rewardId = 2463,
			count = 1
		},		
		[aid.PSET_LEGS_ARACURA] = {
			storageId = sid.PSET_LEGS_ARACURA,
			rewardId = 2647,
			count = 1
		},		
		[aid.PLATINUM_10QUEST] = {
			storageId = sid.PLATINUM_10QUEST,
			rewardId = 2160,
			count = 1
		},		
		[aid.DH_SHIELD] = {
			storageId = sid.DH_SHIELD,
			rewardId = 2520,
			count = 1
		},		
		[aid.DH_STEELBOOTS] = {
			storageId = sid.DH_STEELBOOTS,
			rewardId = 2645,
			count = 1
		},
		[aid.DH_HELMET] = {
			storageId = sid.DH_HELMET,
			rewardId = 2493,
			count = 1
		},
		[aid.BEGGAR_STAFF] = {
			storageId = sid.BEGGAR_STAFF,
			rewardId = 6107,
			count = 1
		},
		[aid.ANIHI_SCA] = {
			storageId = sid.ANIHI,
			rewardId = 2431,
			count = 1
		},
		[aid.ANIHI_SOV] = {
			storageId = sid.ANIHI,
			rewardId = 2400,
			count = 1
		},

		[aid.ANIHI_DARM] = {
			storageId = sid.ANIHI,
			rewardId = 2494,
			count = 1
		},
		
		[aid.POI_AVENGUER] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 6528,
			count = 1
		},
		[aid.POI_ARBALEST] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 5803,
			count = 1
		},
		[aid.POI_ARCANE] = {
			storageId = sid.POI_AVENGUER,
			rewardId = 2453,
			count = 1
		},
		[aid.POI_ANKH] = {
			storageId = sid.POI_ANKH,
			rewardId = 6561,
			count = 1
		},
		[aid.POI_STUFFED] = {
			storageId = sid.POI_STUFFED,
			rewardId = 5791,
			count = 1
		},
		[aid.POI_100PLATINUM] = {
			storageId = sid.POI_100PLATINUM,
			rewardId = 2152,
			count = 100
		},
		[aid.POI_FROZEN] = {
			storageId = sid.POI_FROZEN,
			rewardId = 2361,
			count = 1
		},
		[aid.POI_BACKPACK] = {
			storageId = sid.POI_BACKPACK,
			rewardId = 2365,
			count = 1
		},
		[aid.POI_SOFTBOOTS] = {
			storageId = sid.POI_SOFTBOOTS,
			rewardId = 2640,
			count = 1
		},		
		[aid.WYRMS_LIGHTLEGS] = {
			storageId = sid.WYRMS_LIGHTLEGS,
			rewardId = 7895,
			count = 1
		},		
		[aid.HAND_AXE_ROOK] = {
			storageId = sid.HAND_AXE_ROOK,
			rewardId = 2380,
			count = 1
		},		
		[aid.SPIKE_SWORD_ROOK] = {
			storageId = sid.SPIKE_SWORD_ROOK,
			rewardId = 2383,
			count = 1
		},		
		[aid.PLATE_SHIELD_ROOK] = {
			storageId = sid.PLATE_SHIELD_ROOK,
			rewardId = 2510,
			count = 1
		},		
		[aid.KATANA_ROOK] = {
			storageId = sid.KATANA_ROOK,
			rewardId = 2412,
			count = 1
		},		
		[aid.CARLIN_SWORD_ROOK] = {
			storageId = sid.CARLIN_SWORD_ROOK,
			rewardId = 2395,
			count = 1
		},		
		[aid.STUDDED_LEGS_ROOK] = {
			storageId = sid.STUDDED_LEGS_ROOK,
			rewardId = 2468,
			count = 1
		},		
		[aid.VIKING_HELMET_ROOK] = {
			storageId = sid.VIKING_HELMET_ROOK,
			rewardId = 2473,
			count = 1
		},			
		[aid.FISHING_ROD_ROOK] = {
			storageId = sid.FISHING_ROD_ROOK,
			rewardId = 2580,
			count = 1
		},		
		[aid.CHAINARMOR_ROOK] = {
			storageId = sid.CHAINARMOR_ROOK,
			rewardId = 2464,
			count = 1
		},		
		[aid.MACHETE_ROOK] = {
			storageId = sid.MACHETE_ROOK,
			rewardId = 2420,
			count = 1
		},		
		[aid.STUDDED_SHIELDROOK] = {
			storageId = sid.STUDDED_SHIELDROOK,
			rewardId = 2526,
			count = 1
		},	
		[aid.RAT_ROOKCAVE] = {
			storageId = sid.RAT_ROOKCAVE,
			rewardId = 2384,
			count = 1
		},
		[aid.BASTSKIRT_DWORCS] = {
			storageId = sid.BASTSKIRT_DWORCS,
			rewardId = 2798,
			count = 1
		},
		[aid.BHERB_GS] = {
			storageId = sid.BHERB_GS,
			rewardId = 2798,
			count = 5
		},	
		[aid.WSTAKE_VAMP] = {
			storageId = sid.WSTAKE_VAMP,
			rewardId = 5941,
			count = 1
		},
		[aid.PLEGS_ELFCAMP] = {
			storageId = sid.PLEGS_ELFCAMP,
			rewardId = 2647,
			count = 1
		},		
		[aid.GSILK_ELFCAMP] = {
			storageId = sid.GSILK_ELFCAMP,
			rewardId = 5879,
			count = 4
		},		
		[aid.ROH_QUENDORCAVES] = {
			storageId = sid.ROH_QUENDORCAVES,
			rewardId = 2214,
			count = 1
		},		
		[aid.CEM_BOLTS_QUENDOR] = {
			storageId = sid.CEM_BOLTS_QUENDOR,
			rewardId = 2543,
			count = 100
		},	
		[aid.CEM_GOLDS_CYCS] = {
			storageId = sid.CEM_GOLDS_CYCS,
			rewardId = 2148,
			count = 100
		},
		[aid.DEVIL_HELMET_ANCIENT] = {
			storageId = sid.DEVIL_HELMET_ANCIENT,
			rewardId = 2462,
			count = 1
		},
		[aid.SMALL_SAPHIRE_ANCIENT] = {
			storageId = sid.SMALL_SAPHIRE_ANCIENT,
			rewardId = 2146,
			count = 10
		},
		[aid.QROD_ANCIENTQUEST] = {
			storageId = sid.QROD_ANCIENTQUEST,
			rewardId = 8911,
			count = 1
		},
		[aid.BROBE_ANCIENTQUEST] = {
			storageId = sid.BROBE_ANCIENTQUEST,
			rewardId = 2656,
			count = 1
		},
		[aid.MIGHT_RING_QUENDOR] = {
			storageId = sid.MIGHT_RING_QUENDOR,
			rewardId = 2164,
			count = 1
		},		
		[aid.SCALE_ARMOR_QUENDOR] = {
			storageId = sid.SCALE_ARMOR_QUENDOR,
			rewardId = 2483,
			count = 1
		},	
		[aid.STEEL_SHIELD_QUENDOR] = {
			storageId = sid.STEEL_SHIELD_QUENDOR,
			rewardId = 2509,
			count = 1
		},	
		[aid.BRASS_LEGS_QUENDOR] = {
			storageId = sid.BRASS_LEGS_QUENDOR,
			rewardId = 2478,
			count = 1
		},
		[aid.BRASS_ARMOR_QUENDOR] = {
			storageId = sid.BRASS_ARMOR_QUENDOR,
			rewardId = 2465,
			count = 1
		},	
		[aid.CRUSADER_HELMET] = {
			storageId = sid.CRUSADER_HELMET,
			rewardId = 2497,
			count = 1
		},		
		[aid.ORC_KAXE] = {
			storageId = sid.ORC_KAXE,
			rewardId = 2430,
			count = 1
		},
		[aid.ORC_KARMOR] = {
			storageId = sid.ORC_KARMOR,
			rewardId = 2476,
			count = 1
		},		
		[aid.ORC_FSWORD] = {
			storageId = sid.ORC_FSWORD,
			rewardId = 2392,
			count = 1
		},		
		[aid.BK_CARMOR] = {
			storageId = sid.BK_CARMOR,
			rewardId = 2487,
			count = 1
		},
		[aid.BK_CSHIELD] = {
			storageId = sid.BK_CSHIELD,
			rewardId = 2519,
			count = 1
		},		
		[aid.NOBLE_ARMOR_QUENDOR] = {
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
			
			-- Verificamos se o container de reward items está em ordem!!
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
	if quests[item.actionid] ~= nil then
		useQuestChest(cid, quests[item.actionid], item.actionid)
	end
	return TRUE
end