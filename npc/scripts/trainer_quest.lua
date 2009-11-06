local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


    if msgcontains(msg, 'mission') then
	if getPlayerStorageValue(cid, 30045) == -1 then
		npcHandler:say('I lost my baby seal dool in my home, can you help me the found dool?', cid)
		talkState[talkUser] = 1
         elseif getPlayerStorageValue(cid, 30046) == 1 then
                npcHandler:say('Own. you have a baby seal from me?', cid)
                talkState[talkUser] = 2
        elseif getPlayerStorageValue(cid, 30046) == 2 then
                npcHandler:say('Sorry...but you already have complete my service. Good Bye', cid)
                talkState[talkUser] = 3
        end
        
    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'yes') then
                npcHandler:say('Great. you have acess to enter in my home, report your mission afterwards..', cid)
                setPlayerStorageValue(cid,30045,1)
		        local chave = doCreateItemEx(2092, 1)
		        doSetItemActionId(chave, 4849)
		        doPlayerAddItemEx(cid, chave, 1)
                talkState[talkUser] = 2
                else
                selfSay('You already have the service. Come back have them...', cid)
        end

    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'yes') then
                npcHandler:say('Thank you! now you have acess to enter in my Training Room.', cid)
	            if doPlayerRemoveItem(cid,7183,1) == TRUE then
                setPlayerStorageValue(cid,30046,2)
                setPlayerStorageValue(cid,60034,1)
                talkState[talkUser] = 3
                else
                npcHandler:say('Sorry...but you dont have item. Come back have them', cid)
            end
            end
            end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
