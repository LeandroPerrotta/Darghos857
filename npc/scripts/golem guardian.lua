local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function thinkCallback(cid)

local rand = math.random(1,200)
if rand == 1 then
doCreatureSay(getNpcCid(),'Prime Mission: protect Yalahari master.',TALKTYPE_SAY)
elseif rand == 2 then
doCreatureSay(getNpcCid(),'N.O.O.B. termination initiated.',TALKTYPE_SAY)
elseif rand == 3 then
doCreatureSay(getNpcCid(),'Monitoring interaction for hostilities.',TALKTYPE_SAY)
elseif rand == 4 then
doCreatureSay(getNpcCid(),'Danger: Overheating.',TALKTYPE_SAY)
elseif rand == 5 then
doCreatureSay(getNpcCid(),'Target locked.',TALKTYPE_SAY)
elseif rand == 6 then
doCreatureSay(getNpcCid(),'Scanning human life form.',TALKTYPE_SAY)
end
return true
end

function greetCallback(cid)
return false
end
 
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
