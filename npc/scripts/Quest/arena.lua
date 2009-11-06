local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                             npcHandler:onThink()                        end

function enterArena(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local cost = 0
    local levelname = ''
    if getPlayerStorageValue(cid, 42355) < 1 then
        cost = 1000
        levelname = 'Greenhorn'
        levelneeded = 40
    elseif getPlayerStorageValue(cid, 42355) == 1 then
        cost = 5000
        levelname = 'Scrapper'
        levelneeded = 50
    elseif getPlayerStorageValue(cid, 42355) == 2 then
        cost = 10000
        levelname = 'Warlord'
        levelneeded = 60
    end
    if string.lower(keywords[1]) == 'yes' and parameters.prepare ~= 1 then
  if getPlayerStorageValue(cid, 42351) ~= 1 then
        if(getPlayerLevel(cid) >= levelneeded) then
            if(getPlayerMoney(cid) >= cost) then
                npcHandler:say('As you wish! You can pass the door now and enter the teleporter to the pits.', cid)
doPlayerRemoveMoney(cid, cost)
                setPlayerStorageValue(cid, 42351, 1)
            else
                npcHandler:say('You need ' .. cost .. ' gold pieces to enter this arena in this {difficulty}!', cid)
        npcHandler:resetNpc()
            end
        else
            npcHandler:say('You need level ' .. levelneeded .. ' for this arena {difficulty}!', cid)
        npcHandler:resetNpc()
        end
else
 npcHandler:say('You have already paid the {fee} for entering the arena pits!', cid)
end
        npcHandler:resetNpc()
    elseif string.lower(keywords[1]) == 'no' then
        npcHandler:say('Come back when you feel ready!', cid)
        npcHandler:resetNpc()
    else
        if getPlayerStorageValue(cid, 42355) < 3 then
            npcHandler:say('So you agree with the {rules} and want to participate in the challenge? The {fee} for one try in {' .. levelname .. '} {difficulty} {level} is ' .. cost .. ' gold pieces. Do you really want to participate and pay the {fee}?', cid)
        else
            npcHandler:say('You\'ve already completed the arena in all {difficulty} {levels}.',cid)

        npcHandler:resetNpc()
        end
    end
    return true
end

local yesNode = KeywordNode:new({'yes'}, enterArena, {})
local noNode = KeywordNode:new({'no'}, enterArena, {})

local node1 = keywordHandler:addKeyword({'arena'}, enterArena, {prepare=1})
    node1:addChildKeywordNode(yesNode)
    node1:addChildKeywordNode(noNode)
    
local node2 = keywordHandler:addKeyword({'fight'}, enterArena, {prepare=1})
    node2:addChildKeywordNode(yesNode)
    node2:addChildKeywordNode(noNode)
local node3 = keywordHandler:addKeyword({'yes'}, enterArena, {prepare=1})
    node3:addChildKeywordNode(yesNode)
    node3:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())