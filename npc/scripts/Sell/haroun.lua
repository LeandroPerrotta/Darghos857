local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- ASSASSIN START --
function AssassinFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    
        if getPlayerItemCount(cid,2498) >= 2 then
        if doPlayerRemoveItem(cid,2498,2) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5884,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
        end
    end


function AssassinSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end


    
        if getPlayerItemCount(cid,2475) >= 4 then
        if doPlayerRemoveItem(cid,2475,4) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5885,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
        end
    end

function AssassinFourth(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end


    

        if getPlayerItemCount(cid,2195) >= 1 then
        if doPlayerRemoveItem(cid,2195,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5891,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
        end

    end

function AssassinThird(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    

        if getPlayerItemCount(cid,2392) >= 3 then
        if doPlayerRemoveItem(cid,2392,3) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5904,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)

   end

end
-- ASSASSIN END --

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can exchange 2 royal helmets for fighting spirit, 4 warrior helmets for warrior\'s sweat, 3 fire swords for magic sulphur and boots of haste for enchanted chicken wing."})

local node1 = keywordHandler:addKeyword({'fighting spirit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade 2 royal helmets for a fighting spirit?'})
    node1:addChildKeyword({'yes'}, AssassinFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'warrior sweat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade 4 warrior helmets for warrior\'s sweat?'})
    node2:addChildKeyword({'yes'}, AssassinSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node6 = keywordHandler:addKeyword({'enchanted chicken wing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade boots of haste for a enchanted chicken wing?'})
    node6:addChildKeyword({'yes'}, AssassinFourth, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node3 = keywordHandler:addKeyword({'magic sulphur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade 3 fire swords for some magic sulphur?'})
    node3:addChildKeyword({'yes'}, AssassinThird, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node4 = keywordHandler:addKeyword({'warriors sweat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade your 4 warrior helmets for warrior\'s sweat?'})
    node4:addChildKeyword({'yes'}, AssassinSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node5 = keywordHandler:addKeyword({'warrior\'s sweat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade your 4 warrior helmets for warrior\'s sweat?'})
    node5:addChildKeyword({'yes'}, AssassinSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())
