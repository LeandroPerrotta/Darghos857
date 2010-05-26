local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level/5)+(maglevel*10))
	local max = ((level/5)+(maglevel*14))
	
	local baseMin = min
	local baseMax = max
	
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
		min = min + ((baseMin * (1 + (HELMET_BONUS[head.itemid] / 100))) - baseMin)
		max = max + ((baseMax * (1 + (HELMET_BONUS[head.itemid] / 100))) - baseMax)
	end
	
	if(armor ~= FALSE and ARMOR_BONUS[armor.itemid] ~= nil) then
		min = min + ((baseMin * (1 + (ARMOR_BONUS[armor.itemid] / 100))) - baseMin)
		max = max + ((baseMax * (1 + (ARMOR_BONUS[armor.itemid] / 100))) - baseMax)
	end
	
	if(legs ~= FALSE and LEGS_BONUS[legs.itemid] ~= nil) then
		min = min + ((baseMin * (1 + (LEGS_BONUS[legs.itemid] / 100))) - baseMin)
		max = max + ((baseMax * (1 + (LEGS_BONUS[legs.itemid] / 100))) - baseMax)	
	end
	
	if(boots ~= FALSE and BOOTS_BONUS[boots.itemid] ~= nil) then
		min = min + ((baseMin * (1 + (BOOTS_BONUS[boots.itemid] / 100))) - baseMin)
		max = max + ((baseMax * (1 + (BOOTS_BONUS[boots.itemid] / 100))) - baseMax)	
	end
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local ret = doCombat(cid, combat, var)

	--send effects
	if ret == LUA_NO_ERROR then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
		if isCreature(var.number) == TRUE then
			if cid ~= var.number then
				doSendMagicEffect(getCreaturePosition(var.number), CONST_ME_MAGIC_GREEN)
			end
		end
	end

	return ret
end
