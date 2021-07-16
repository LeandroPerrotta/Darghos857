local _hasCreature = false

function onCreatureAppear(creature)
	
	_hasCreature = true
end 

function onCreatureDisappear(id)

	_hasCreature = false
end

function onThink()

	if(_hasCreature) then

		if(math.random(1, 100000) <= 3500) then
		
			local talkRandom = math.random(1, 3)
		
			if(talkRandom == 1) then
				selfSay("Saia daqui!! Não quero falar com ninguém vá embora!! Ninguem deve me ver assim! Estou horrivel!!")
			elseif(talkRandom == 2) then
				selfSay("Guardas tirem este instruso daqui! Ele vem zombar de minha desgraça!!")
			elseif(talkRandom == 3) then
				selfSay("Veja o que aquela bruxa satanica fez comigo!! Não! Não veja! Vá embora!")
			end
		end
	end
end 