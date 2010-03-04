_EggsGained = 0

local _HydraEggChance = 5400
local _HydraMessages = {
	"<GROARGGHHHTTTTTT!!!! ... um rugido de longe pode ser ouvido...>",
	"<o chão parece estar tremendo. Algo se aproxima!>"
}

local _SummonHydraMessage = "<Ghazran parece estar furioso! Ele vem proteger seu ninho.>"
local _GhazranPos = {x=2811, y=1806, z=10, stackpos=253}
local _GhazranSummoned = false

local ITEM_HYDRA_EGG = 4850


function onUse(cid, item, frompos, item2, topos)

	if(_GhazranSummoned) then
		
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Não pode mais mecher no ninho.")
		return TRUE
	end

	if(isInArray(aid.ARIADNE_HYDRA_NEST, item.actionid) == TRUE) then
	
		if(math.random(1, 100000) <= _HydraEggChance) then
		
			_EggsGained = _EggsGained + 1
			doPlayerAddItem(cid, ITEM_HYDRA_EGG, 1)
			
			local msgRandom = math.random(1, #_HydraMessages)
			
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, _HydraMessages[msgRandom])
		else
		
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Nada encontrado neste ninho, talvez deva procurar mais.")
		end	
		
		if(_EggsGained > 10 and math.random(1, 50) >= 50) then
			
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, _SummonHydraMessage)
			addEvent(summonGhazran, 1000 * 5)
			_GhazranSummoned = true
		end
	end
end

function summonGhazran()
	
	doSummonCreature("ghazran", _GhazranPos)
end