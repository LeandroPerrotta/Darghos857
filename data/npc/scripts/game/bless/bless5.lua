local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end

local node1 = keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to buy one part of blessing for 2000 (plus level depending amount) gold?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 5, premium = true, baseCost = 2000, levelCost = 250, startLevel = 30, endLevel = 500})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

npcHandler:addModule(FocusModule:new())
