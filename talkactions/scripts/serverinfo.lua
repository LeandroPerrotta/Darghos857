-- You should multiply rate values by player rate if you use stages
local config = {
	rate_exp = getConfigValue('rate_exp'),
	rate_skill = getConfigValue('rate_skill'),
	rate_loot = getConfigValue('rate_loot'),
	rate_mag = getConfigValue('rate_mag'),
	rent_period = getConfigValue('houserentperiod'),
	frags_to_ban = getConfigValue('frags_to_banishment')
}

function onSay(cid, words, param)

	out = getCreatureOutfit(cid)
	
				doCreatureChangeOutfit(cid, {lookType = lookType, lookHead = 78, lookBody = 69, lookLegs = 97, lookFeet = 95, lookAddons = 0})
	
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "<look type=""..out.lookType.."" head=""..out.lookHead"" body=""..out.lookBody.."" legs=""..out.lookLegs.."" feet=""..out.lookFeet..""/>")



end
