local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'spear'},         2389, 3,       'spear')

shopModule:addSellableItem({'two handed sword'},         2377, 450,       'two handed sword')
shopModule:addSellableItem({'broad sword'},                   2413, 500,       'broad sword')
shopModule:addSellableItem({'sword'},         2376, 25,       'sword')
shopModule:addSellableItem({'dagger'},                   2379, 2,       'dagger')
shopModule:addSellableItem({'rapier'},         2384, 5,       'rapier')
shopModule:addSellableItem({'short sword'},                   2406, 10,       'short sword')
shopModule:addSellableItem({'spike sword'},                   2383, 240,       'spike sword')
shopModule:addSellableItem({'sabre'},                   2385, 12,       'sabre')
shopModule:addSellableItem({'longsword'},                   2397, 51,       'longsword')

shopModule:addSellableItem({'battle hammer'},         2417, 120,       'battle hammer')
shopModule:addSellableItem({'clerical mace'},         2423, 170,       'clerical mace')
shopModule:addSellableItem({'mace'},                   2398, 30,       'mace')        
shopModule:addSellableItem({'club'},                   2382, 1,       'club')        
shopModule:addSellableItem({'morning star'},                   2394, 90,       'morning star')    
shopModule:addSellableItem({'war hammer'},                   2391, 470,       'war hammer')      

shopModule:addSellableItem({'battle axe'},                     2378, 80,       'battle axe')
shopModule:addSellableItem({'halberd'},                           2381, 400,       'halberd')
shopModule:addSellableItem({'double axe'},                     2387, 260,       'double axe')
shopModule:addSellableItem({'orcish axe'},         2428, 350,       'orcish axe')
shopModule:addSellableItem({'hand axe'},                     2380, 4,       'hand axe')
shopModule:addSellableItem({'axe'},                     2386, 7,       'axe')
shopModule:addSellableItem({'barbarian axe'},         2429, 185,       'barbarian axe')

shopModule:addSellableItem({'brass armor'},				2465, 150,		'brass armor')
shopModule:addSellableItem({'belted cape'},				8872, 500,		'belted cape')
shopModule:addSellableItem({'chain armor'},				2464, 70,		'chain armor')
shopModule:addSellableItem({'plate armor'},				2463, 400,		'plate armor')
shopModule:addSellableItem({'leather armor'},				2467, 12,		'leather armor')
shopModule:addSellableItem({'scale armor'},				2483, 70,		'scale armor')

shopModule:addSellableItem({'leather helmet'},		2461, 4,		'leather helmet')
shopModule:addSellableItem({'chain helmet'},		2458, 17,		'chain helmet')

shopModule:addSellableItem({'chain legs'},2648, 25,		'chain legs')
shopModule:addSellableItem({'plate legs'},				2647, 115,		'plate legs')
shopModule:addSellableItem({'brass legs'},				2678, 49,		'brass legs')


shopModule:addSellableItem({'wooden shield'},		2512, 5,		'wooden shield')
shopModule:addSellableItem({'battle shield'},	2513, 95,		'battle shield')
shopModule:addSellableItem({'steel shield'}, 2509, 80,		'steel shield')
shopModule:addSellableItem({'viking shield'},		2531, 85,		'viking shield')


-------BUYABLE
shopModule:addBuyableItem({'two handed sword'},         2377, 950,       'two handed sword')
shopModule:addBuyableItem({'broad sword'},                   2413, 950,       'broad sword')
shopModule:addBuyableItem({'sword'},         2376, 85,       'sword')
shopModule:addBuyableItem({'crimson sword'},         7385, 610,       'crimson sword')
shopModule:addBuyableItem({'dagger'},                   2379, 5,       'dagger')
shopModule:addBuyableItem({'rapier'},         2384, 15,       'rapier')
shopModule:addBuyableItem({'sabre'},                   2385, 35,       'sabre')

shopModule:addBuyableItem({'battle hammer'},         2417, 350,       'battle hammer')
shopModule:addBuyableItem({'clerical mace'},         2423, 540,       'clerical mace')
shopModule:addBuyableItem({'mace'},                   2398, 90,       'mace')
shopModule:addBuyableItem({'morning star'},                   2394, 430,       'morning star')

shopModule:addBuyableItem({'hand axe'},                     2380, 8,       'hand axe')
shopModule:addBuyableItem({'axe'},                     2386, 20,       'hand axe')
shopModule:addBuyableItem({'barbarian axe'},         2429, 590,       'barbarian axe')
shopModule:addBuyableItem({'battle axe'},                     2378, 235,       'battle axe')

shopModule:addBuyableItem({'leather helmet'},		2461, 12,		'leather helmet')
shopModule:addBuyableItem({'chain helmet'},		2458, 52,		'chain helmet')
shopModule:addBuyableItem({'chain legs'},2648, 80,		'chain legs')

shopModule:addBuyableItem({'wooden shield'},		2512, 15,		'wooden shield')
shopModule:addBuyableItem({'steel shield'}, 2509, 240,		'steel shield')
shopModule:addBuyableItem({'viking shield'},		2531, 260,		'viking shield')

shopModule:addBuyableItem({'chain legs'},2648, 80,		'chain legs')

shopModule:addBuyableItem({'brass armor'},				2465, 450,		'brass armor')
shopModule:addBuyableItem({'chain armor'},				2464, 200,		'chain armor')
shopModule:addBuyableItem({'leather armor'},				2467, 35,		'leather armor')
shopModule:addBuyableItem({'scale armor'},				2483, 260,		'scale armor')

shopModule:addBuyableItem({'spear'},         2389, 10,       'spear')

npcHandler:addModule(FocusModule:new())
