local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(npcHandler.focus ~= cid) then
        return false
    end
    
local telePos = {x = 711, y = 1014, z = 6}
    
    if msgcontains(msg, 'madame shadow') then
        if getPlayerItemCount(cid,2798) >= 1 then
            doPlayerRemoveItem(cid,2798,1)
            doTeleportThing(cid,telePos)
            selfSay('Thank You! Search far to the west in the great swamp. If you find the door, use that key and you will probaly get a fine reward!')
        else
            selfSay('You should die! Never joke with a Witch about a blood herb, it\'s our most precious item!')
        end
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
