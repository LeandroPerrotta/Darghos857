<<<<<<< .working
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.2, 0, -0.4, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
=======
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level/5)+(maglevel*1.2))
	if min < 20 then
		min = 20
	end

	local max = (((level/5)+(maglevel*2))+10)
	if max < 40 then
		max = 40
	end

	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
>>>>>>> .merge-right.r4484
end
