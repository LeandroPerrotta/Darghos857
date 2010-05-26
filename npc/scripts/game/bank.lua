local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local stan = 0
local stan_two = 0
local player_pattern = '^[a-zA-Z0-9 -]+$'
local number_pattern = '%d'
local target_cid = 0
local number_pattern_two = '%d+'
local b, e = 0
local count = 0
local talk_state = 0
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end

	if msgcontains(msg, 'deposit') then
		
		if string.find(msg, number_pattern) then
		
			b, e = string.find(msg, number_pattern_two)
			count = tonumber(string.sub(msg, b, e))
			
			if getPlayerMoney(cid) >= count then
			
				doPlayerDepositMoney(cid, count)
				npcHandler:say('Alright, we have added the amount of '..count..' gold to your balance. You can withdraw your money anytime.', cid)
			else
			
				npcHandler:say('You don\'t have so much gold.', cid)
			end
			
		else
		
			npcHandler:say('Please tell me how much gold you would like to deposit.', cid)
			talk_state = 1
		end
		
	elseif msgcontains(msg, 'withdraw') then
	
		if string.find(msg, number_pattern) then
		
			b, e = string.find(msg, number_pattern_two)
			count = tonumber(string.sub(msg, b, e))
			
			if getPlayerBalance(cid) - count >= 0 then
			
				doPlayerWithdrawMoney(cid, count)
				npcHandler:say('Here you are, '..count..' gold. Please let me know if there is something else I can do for you.', cid)
			else
			
				npcHandler:say('There is not enough gold on your account.', cid)
			end
		else
		
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
			talk_state = 2
		end
		
	elseif msgcontains(msg, 'balance') then
	
		local balance = getPlayerBalance(cid)
		npcHandler:say('Your account balance is ' .. balance .. ' gold.', cid)
		
	elseif talk_state == 1 then
	
		count = tonumber(msg)
		if count ~= nil then
		
			if getPlayerMoney(cid) >= count then
			
				doPlayerDepositMoney(cid, count)
				npcHandler:say('Alright, we have added the amount of '..count..' gold to your balance. You can withdraw your money anytime.', cid)
				talk_state = 0
			else
			
				npcHandler:say('You don\'t have so much gold.', cid)
			end
		else
		
			npcHandler:say('Please tell me how much gold you would like to deposit.', cid)
		end
		
	elseif talk_state == 2 then
	
		count = tonumber(msg)
		if count ~= nil then
		
			if count <= getPlayerBalance(cid) then
			
				doPlayerWithdrawMoney(cid, count)
				npcHandler:say('Here you are, '..count..' gold. Please let me know if there is something else I can do for you.', cid)
				talk_state = 0
			else
			
				npcHandler:say('There is not enough gold on your account.', cid)
			end
		else
		
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
		end
		
		return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
--npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye, bye. You gold safe at here, |PLAYERNAME|. <snickers>!')
npcHandler:addModule(FocusModule:new())