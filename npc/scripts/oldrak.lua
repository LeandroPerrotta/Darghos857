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


    if msgcontains(msg, 'demon oak') then
        if getPlayerStorageValue(cid, 15006) <= 4 and getPlayerStorageValue(cid, 15005) == -1 then
            selfSay('You need know exactly location, go local and research more...' ,cid)
        elseif getPlayerStorageValue(cid, 15006) == 3 and getPlayerStorageValue(cid, 15005) == -1 then
            selfSay('You found the demon oak ? For kill it\'s you need a {Hallowed Axe}. You want get this ?', cid)
            talkState[talkUser] = 1
        elseif getPlayerStorageValue(cid, 15005) == 3 then
            selfSay('Go defeat demon oak. When you do this report me.', cid)
            talkState[talkUser] = 0
        elseif getPlayerStorageValue(cid, 15005) == 7 then
            selfSay('I can\'t believe, you really defeat the demon oak. Now is possible you get you reward. Search near cemitery.', cid)
            setPlayerStorageValue(cid,15005,8)
            talkState[talkUser] = 0
        else
            selfSay('You found the demon oak ? For kill it\'s you need a {Hallowed Axe}. You want get this ?', cid)
        end

    elseif msgcontains(msg, 'hallowed axe') then
        if getPlayerStorageValue(cid, 15005) == -1 then
                selfSay('I can forge this but i need {1000 gold coins} and a {axe}. You interessed ?', cid)
                talkState[talkUser] = 1
        elseif getPlayerStorageValue(cid, 15005) == 1 then
                selfSay('Great. You have 1000 gold coins to give me ?.', cid)
                talkState[talkUser] = 2
        elseif getPlayerStorageValue(cid, 15005) == 2 then
                selfSay('Great. Now you have a {axe} to me ?.', cid)
                talkState[talkUser] = 3
            end
    
    elseif msgcontains(msg, 'hugo') then
        selfSay('Ah, the curse of the Plains of Havoc, the hidden beast, the unbeatable foe. I\'ve been living here for years and I\'m sure this is only a {myth}.', cid)
        talkState[talkUser] = 4
        
    elseif talkState[talkUser] == 4 then
        if msgcontains(msg, 'myth') then
            selfSay('There are many tales about the fearsome Hugo. It\'s said it\'s an abnormality, accidentally created by {Yenny the Gentle}. It\'s half demon, halfsomething else and people say it\'s still alive after all these years.', cid)
            talkState[talkUser] = 5
        end
    
    elseif talkState[talkUser] == 5 then
        if msgcontains(msg, 'yenny the gentle') then
            selfSay('Yenny, known as the Gentle, was one of the most powerful wielders of magic in ancient times. She was known throughout the world for her mercy and kindness.', cid)
            setPlayerStorageValue(cid,15200,1)
        end
    
    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'yes') then
                selfSay('Great. You have 1000 gold coins to give me ?.', cid)
                setPlayerStorageValue(cid,15005,1)
                talkState[talkUser] = 2
                else
                selfSay('Ok.', cid)
        end

    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'yes') then
            if(doPlayerRemoveMoney(cid, 1000) == TRUE) then
                selfSay('Great. Now you have a {axe} to me ?.', cid)
                setPlayerStorageValue(cid,15005,2)
                talkState[talkUser] = 3
                else
                selfSay('Ok.', cid)
            end
        end

    elseif talkState[talkUser] == 3 then
        if msgcontains(msg, 'yes') then
            if doPlayerRemoveItem(cid,2386,1) == 1 then
                selfSay('Great. Now go and defeat a Demon Oak. Later report me.', cid)
                doPlayerAddItem(cid,8293,1)
                setPlayerStorageValue(cid,15005,3)
                talkState[talkUser] = 3
                else
                selfSay('Ok.', cid)
            end
        end

    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())