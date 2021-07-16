local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, TRUE)

function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local level = getPlayerLevel(cid)

	local min = (((weaponSkill+weaponAttack)/3)+(level/5)) * 1.5
	local max = ((weaponSkill+weaponAttack)+(level/5)) * 1.5

	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
