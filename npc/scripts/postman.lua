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
	if getPlayerStorageValue(cid, 30120) == -1 then
		npcHandler:say('I have many missions for the postman quest..you can help me?', cid)
		talkState[talkUser] = 1
         elseif getPlayerStorageValue(cid, 30121) == 1 then
                npcHandler:say('Own..you have my feedback?!', cid)
                talkState[talkUser] = 2
        elseif getPlayerStorageValue(cid, 30121) == 2 then
                npcHandler:say('Sorry...but you already have complete my service.', cid)
                talkState[talkUser] = 3
        end
        
    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'yes') then
                npcHandler:say('Great...delivery this letter for my girlfriend in depot of Name your City.', cid)
                doPlayerAddItem(cid,2333,1)
                setPlayerStorageValue(cid,30120,1)
                talkState[talkUser] = 2
                else
                selfSay('You already have the delivery...Come back have them...', cid)
        end

    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'yes') then
                npcHandler:say('Thanks officer! Now you have the acess to enter in MailBox Room\'s...Remember in future come here for more missions to have discount buying parcel and letters.', cid)
	            if doPlayerRemoveItem(cid,2665,1) == TRUE then
                setPlayerStorageValue(cid,30121,2)
                setPlayerStorageValue(cid,60035,1)
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
