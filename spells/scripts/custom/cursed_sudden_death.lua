local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(cid, level, maglevel)
	local min = (((level/5)+(maglevel*4))+100) * 1.2
	local max = (((level/5)+(maglevel*7))+100) * 1.2
		
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune_area = {
{1, 0, 0, 0, 1},
{0, 1, 0, 1, 0},
{0, 0, 3, 0, 0},
{0, 1, 0, 1, 0},
{1, 0, 0, 0, 1}
}

local area = createCombatArea(rune_area)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
