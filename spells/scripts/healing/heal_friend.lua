local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level/5)+(maglevel*10))
	local max = ((level/5)+(maglevel*14))
	
	local head = getPlayerSlotItem(cid, CONST_SLOT_HEAD)
	local armor = getPlayerSlotItem(cid, CONST_SLOT_ARMOR)
	local legs = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
	local boots = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	
	local HELMET_BONUS = {
		[10555] = 15 -- warden helmet	
	}
	
	local ARMOR_BONUS = {
		[10556] = 15 -- warden armor
	}
	
	local LEGS_BONUS = {
		[10557] = 10 -- warden legs
	}
	
	local BOOTS_BONUS = {
		[10558] = 10 -- warden boots
	}
	
	if(head ~= FALSE and HELMET_BONUS[head.itemid] ~= nil) then
		min = min * (1 + (HELMET_BONUS[head.itemid] / 100))
		max = max * (1 + (HELMET_BONUS[head.itemid] / 100))
	end
	
	if(armor ~= FALSE and ARMOR_BONUS[head.itemid] ~= nil) then
		min = min * (1 + (ARMOR_BONUS[head.itemid] / 100))
		max = max * (1 + (ARMOR_BONUS[head.itemid] / 100))	
	end
	
	if(legs ~= FALSE and LEGS_BONUS[head.itemid] ~= nil) then
		min = min * (1 + (LEGS_BONUS[head.itemid] / 100))
		max = max * (1 + (LEGS_BONUS[head.itemid] / 100))	
	end
	
	if(boots ~= FALSE and BOOTS_BONUS[head.itemid] ~= nil) then
		min = min * (1 + (BOOTS_BONUS[head.itemid] / 100))
		max = max * (1 + (BOOTS_BONUS[head.itemid] / 100))	
	end
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
