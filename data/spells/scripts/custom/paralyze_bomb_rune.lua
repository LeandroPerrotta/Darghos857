local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NONE)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -1, 40, -1, 40)
setCombatCondition(combat, condition)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)

	local pos = getCreaturePosition(cid)

	local mana = getPlayerMaxMana(cid) / 2
	if(getPlayerMana(cid) < mana) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	if(doCombat(cid, combat, var) ~= LUA_NO_ERROR) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end
	
	doPlayerAddMana(cid, -(mana))
	doPlayerAddManaSpent(cid, mana)	

	return LUA_NO_ERROR
end
