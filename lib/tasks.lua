local STORAGE_RANGE = 100
local STORAGE_START = 52100

defaultDialogs = {
	STARTED_TASK = "Perfeito, faça seu trabalho e volte aqui quando ele estiver concluido... Boa sorte!",
	COMPLETED_TASK_INIT = "Oh! Vejo que não demorou tanto tempo para terminar a tarefa! Esta é sua recomensa:",
	COMPLETED_TASK_END = "Espero que fique satisfeito! Muito obrigado!",
	TELEPORTING = "Certo, você será teleportado em alguns instantes..."
}

destinations = {
	secondNPC = {x = 1231, y = 2190, z = 8},
	academy = {x = 1235, y = 2170, z = 7}
}

CAP_ONE = {
	ISLAND_OF_PEACE = {
		FIRST = STORAGE_START,
		SECOND = STORAGE_START + 100,
		THIRD = STORAGE_START + 200,
		FOURTH = STORAGE_START + 300,
		FIFTH = STORAGE_START + 400,
		SIXTH = STORAGE_START + 500,
		SEVENTH = STORAGE_START + 600,
		EIGHTH = STORAGE_START + 700,
		NINTH = STORAGE_START + 800,
		TENTH = STORAGE_START + 900,
		ELEVENTH = STORAGE_START + 1000,
		TWELFTH = STORAGE_START + 1100,
		THIRTEENTH = STORAGE_START + 1200,
	},
	QUENDOR = {
		TRAVELER_IOP = STORAGE_START + 1300
	}
}

taskStats = {
	NONE = -1,
	STARTED = 0,
	COMPLETED = 1
}

-- Classe de items que serÃ£o usados nas Tasks
items = {
	brown_backpack	 		= 1988,
	chain_legs		 		= getItemIdByName("chain legs"),
	health_potion		 	= getItemIdByName("health potion"),
	mana_potion 	 		= getItemIdByName("mana potion"),
	wand_of_dragonbreath 	= getItemIdByName("wand of dragonbreath"),
	moonlight_rod		 	= getItemIdByName("moonlight rod"),
	steel_axe			 	= getItemIdByName("steel axe"),
	jagged_sword		 	= getItemIdByName("jagged sword"),
	daramanian_mace		 	= getItemIdByName("daramanian mace"),
	ranger_legs		 		= getItemIdByName("ranger legs"),
	brass_legs		 		= getItemIdByName("brass legs"),
	wand_of_decay	 		= getItemIdByName("wand of decay"),
	wand_of_draconia 		= getItemIdByName("wand of draconia"),
	necrotic_rod 			= getItemIdByName("necrotic rod"),
	northwind_rod 			= getItemIdByName("northwind rod"),
	belted_cape	 			= getItemIdByName("belted cape"),
	plate_armor	 			= getItemIdByName("plate armor"),
	spike_sword	 			= getItemIdByName("spike sword"),
	battle_hammer 			= getItemIdByName("battle hammer"),
	battle_axe	 			= getItemIdByName("battle axe"),
	stealth_ring 			= 2165,
	guardian_shield			= getItemIdByName("guardian shield"),
	plate_legs				= getItemIdByName("plate legs"),
	dwarven_legs			= getItemIdByName("dwarven legs"),
	dwarven_armor			= getItemIdByName("dwarven armor"),
	noble_armor				= getItemIdByName("noble armor"),
	wand_of_inferno			= getItemIdByName("wand of inferno"),
	hailstorm_rod			= getItemIdByName("hailstorm rod"),
	clerical_mace			= getItemIdByName("clerical mace"),
	crimson_sword			= getItemIdByName("crimson sword"),
	halberd					= getItemIdByName("halberd"),
	blue_robe				= getItemIdByName("blue robe"),
	bright_sword			= getItemIdByName("bright sword"),
	naginata				= getItemIdByName("naginata"),
	orcish_maul				= getItemIdByName("orcish maul"),
	green_dragon_scale		= getItemIdByName("green dragon scale"),
	knight_armor			= getItemIdByName("knight armor"),
	knight_legs				= getItemIdByName("knight legs"),
	underworld_rod			= getItemIdByName("underworld rod"),
	wand_of_voodoo			= getItemIdByName("wand of voodoo"),
	dragon_shield			= getItemIdByName("dragon shield"),
	giant_spider_silk		= getItemIdByName("giant spider silk"),
	golden_goblet			= getItemIdByName("golden goblet"),
	crown_legs				= getItemIdByName("crown legs"),
	crown_armor				= getItemIdByName("crown armor")
}

-- Classe de monstros que devem disparar o evento onKill, e em qual condiÃ§Ã£o isso deve ocorrer
taskMonsters = {
	["troll"] = { CAP_ONE.ISLAND_OF_PEACE.FIRST },
	["rotworm"] = {CAP_ONE.ISLAND_OF_PEACE.SECOND},
	["carrion worm"] = {CAP_ONE.ISLAND_OF_PEACE.SECOND},
	["skeleton"] = {CAP_ONE.ISLAND_OF_PEACE.THIRD},
	["skeleton warrior"] = {CAP_ONE.ISLAND_OF_PEACE.THIRD},
	["amazon"] = {CAP_ONE.ISLAND_OF_PEACE.SIXTH},
	["valkyrie"] = {CAP_ONE.ISLAND_OF_PEACE.SIXTH},
	["dwarf"] = {CAP_ONE.ISLAND_OF_PEACE.SEVENTH},
	["dwarf soldier"] = {CAP_ONE.ISLAND_OF_PEACE.SEVENTH},
	["dwarf guard"] = {CAP_ONE.ISLAND_OF_PEACE.SEVENTH},
	["cyclops"] = {CAP_ONE.ISLAND_OF_PEACE.NINTH},
	["cyclops smith"] = {CAP_ONE.ISLAND_OF_PEACE.NINTH},
	["orc"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc spearman"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc warrior"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc shaman"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc rider"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc berserker"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc leader"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["orc warlord"] = {CAP_ONE.ISLAND_OF_PEACE.TENTH},
	["dragon"] = {CAP_ONE.ISLAND_OF_PEACE.ELEVENTH},
	["giant spider"] = {CAP_ONE.ISLAND_OF_PEACE.TWELFTH},
	["dragon lord"] = {CAP_ONE.ISLAND_OF_PEACE.THIRTEENTH},
}

-- Classe de informaÃ§Ãµes gerais das tasks
tasksList = {
	[CAP_ONE.ISLAND_OF_PEACE.FIRST] = {
		monsters = {{name = "troll", amount = 25, storagePos = 1}},
		dialogs = {
			description = "Uhmm, você gostaria de ajudar derrotando alguns trolls para ajudar no controle? Se quizer apénas diga que {sim}.",
			taskObjectives = "Certo, ao sul deste templo, existe um bueiro. Nele há trolls e trolls champion. Você precisara derrotar 25 trolls. Aceita a tarefa?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Vejo que ainda não completou sua tarefa! Lembre-se: Precisas derrotar 25 trolls! Apresse-se!",
			taskCompleted = {
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},
		events = {
			onComplete = { 
				type = "question", 
				text = "Eu tenho mais uma tarefa para você! Quer saber dela?", 
				onConfirm = "action",
				confirmParam = "callResponseTask"
			}
		},
		reward = {exp = 4800, money = 500, container = { id = items.brown_backpack, 
			items.chain_legs, items.mana_potion, items.health_potion
		}}
	},
	
	[CAP_ONE.ISLAND_OF_PEACE.SECOND] = {
		monsters = {{name = "rotworm", amount = 15, storagePos = 1}, {name = "carrion worm", amount = 10, storagePos = 2}},
		dialogs = {
			description = "Os vermes da terra estão causando problemas em nossas plantações, eles devoram tudo e não resta nada! Precisamos dar um jeito nestas criaturas, topa ajudar?",
			taskObjectives = "Fico contente com a sua ajuda! Bom... Ao oeste deste templo existe um bueiro, é nele que os vermes se escondem. Derrotar 15 rotworms e 10 carrion worms deve ser sulficiente. Aceita a tarefa?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Vejo que ainda não completou sua tarefa! Lembre-se: Precisas derrotar 15 rotworms e 10 carrion worms! Não perca tempo ou eles causaram mais prejuizos!",
			taskCompleted = {
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},		
		events = {
			onComplete = { 
				type = "question", 
				text = "Sei que o meu amigo Hector estava precisando de uma ajuda, ele fica em uma caverna ao norte do templo, sua entrada é meio escondida. Já que você é tão disposto a ajudar, se quiser posso lhe levar até lá para você falar com ele, quer?", 
				onConfirm = "teleport",
				confirmParam = destinations.secondNPC,
				onConfirmText = defaultDialogs.TELEPORTING
			}
		},		
		reward = {exp = 14400, money = 700, container = { id = items.brown_backpack,
			isSorcerer = { items.wand_of_dragonbreath },
			isDruid = { items.moonlight_rod },
			isKnight = { meleeOptions = { axe = items.steel_axe, sword = items.jagged_sword, club = items.daramanian_mace}}
		}}
	},
	[CAP_ONE.ISLAND_OF_PEACE.THIRD] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.SECOND,
		monsters = {{name = "skeleton", amount = 30, storagePos = 1}, {name = "skeleton warrior", amount = 5, storagePos = 2}},
		dialogs = {
			requireTask = "Eu preciso de sua ajuda para um trabalho mas primeiro você deve concluir os trabalhos dados por Mereus.",
			description = "Esta sarcofago é amaldiçoado... De vez em quando ele adquire vida e passa assustar todos na cidade! Pode nos ajudar?",
			taskObjectives = "Que bom! Ao norte daqui está o sarcofago... Nele derrote 30 skeletons e 5 skeleton warriors e a maldição já deverá diminuir. Topa?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Ora! A maldição está por todos os lados! Seja rápido em seu trabalho! Lembre-se: Precisas derrotar 30 skeletons e 5 skeleton warriors!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},
		events = {
			onComplete = { 
				type = "question", 
				text = "Ainda há muito trabalho a ser efetuado por aqui... Mas você parece estar fraco... Na academia conheço alguem que pode lhe deixar mais forte, o que acha? Quer que eu lhe leve a academia?", 
				onConfirm = "teleport",
				confirmParam = destinations.academy,
				onConfirmText = defaultDialogs.TELEPORTING
			}
		},			
		reward = {exp = 20900, money = 1000, container = { id = items.brown_backpack,
			isPaladin = { items.ranger_legs },
			isKnight = { items.brass_legs },
			isSorcerer = { items.brass_legs },
			isDruid = { items.brass_legs }
		}}
	},
	[CAP_ONE.ISLAND_OF_PEACE.FOURTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.THIRD,	
		reward = {paladinDistTo = 55, paladinShieldTo = 45, knightSkillTo = 50, magicLevelTo = 15}
	},
	[CAP_ONE.ISLAND_OF_PEACE.FIFTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.FOURTH
	},
	[CAP_ONE.ISLAND_OF_PEACE.SIXTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.FOURTH,
		monsters = {{name = "amazon", amount = 35, storagePos = 1}, {name = "valkyrie", amount = 15, storagePos = 2}},
		dialogs = {
			requireTask = "Sim preciso de uma ajuda... Mas... Deixe-me ver... Ohh... Você é muito fraco... Não posso dar tarefas fora da cidade para pessoas tão fracas. Faça as tarefas de dentro da cidade depois retorne aqui...",
			description = "As guerreiras amazonicas são criaturas traiçoeiras, elas quase sempre atacam guerreiros despreparados que não tem muitas chances de sobreviver, precisamos dar um jeito nelas... O que acha?",
			taskObjectives = {
				"Perfeito, elas se escondem não muito longe daqui, saia por esta saida, dê uns 15 passos para o leste e siga para o norte, você encontrará uma casa dominada pela vegetação. Atravesse ela e chegará ao esconderijo [...]",
				"No esconderijo, você deverá aniquilar 35 amazons e 15 valkyries, com isso espero fazer com que elas fiquem com medo de atacar novamente. Mas tome cuidado lá dentro, elas são numerosas! E então, aceita?"
			},
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Ainda tenho noticia de viajantes despreparados sendo atacados... Lembre-se: Precisas derrotar 35 amazons e 15 valkyries!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},
		events = {
			onComplete = { 
				type = "question", 
				text = "Saiba que tenho mais uma tarefa para você. Deseja conhecer-la?", 
				onConfirm = "action",
				confirmParam = "callResponseTask"
			}
		},		
		reward = {exp = 59500, money = 1000, container = { id = items.brown_backpack,
			isSorcerer = { items.wand_of_draconia, container = { id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}  },
			isDruid = { items.northwind_rod, container = { id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}  },
			isPaladin = { items.belted_cap, container = { id = items.brown_backpack, inside = { items.health_potion, amount = 20}} },
			isKnight = { items.plate_armor, meleeOptions = { sword = items.spike_sword, club = items.battle_hammer, axe = items.battle_axe }, container = { id = items.brown_backpack, inside = { items.health_potion, amount = 20}} },
		}}
	},
	[CAP_ONE.ISLAND_OF_PEACE.SEVENTH] = {
		--requiredTask = CAP_ONE.ISLAND_OF_PEACE.SIXTH,
		requirePoints = 360,
		monsters = {{name = "dwarf", points = 1}, {name = "dwarf soldier", points = 2}, {name = "dwarf guard", points = 4}},
		dialogs = {
			--requireTask = "",
			description = "Os anões de Kranos nunca foram muito amigaveis aos humanos de nossa cidade. Mas recentemente eles andam ultrapassando os limites do subterraneo, estão roubando riquezas que a nos pertence. Tem interesse em ajudar a combater esta ousadia?",
			taskObjectives = {
				"Perfeito! Siga ao leste e você encontrará a entrada das minas. No total existem 3 minas, cada uma com 4 andares subterraneos, conforme mais você for decendo você encontrara os anões mais fortes e perigosos [...]",
				"Sabe-se que no fundo de uma das cavernas existe um tesouro dos anões, dizem que ele é protegido por aranhas gigantes e nem os proprios anões se arriscam a chegar perto dele [...]",
				"Nesta tarefa cada vez que você matar um dwarf você ganhará 1 ponto, para dwarf soldiers serão 3 pontos e para dwarf soldiers serão 5 pontos. Seu objetivo é acumular 360 pontos. Posso contar com a sua ajuda?"
			},
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "No sub-solo da cidade ainda é possivel ouvir o barulho dos anões! Eles continuam nos saqueando! Lembre-se: Você precisa atingir 360 pontos derrotando dwarfs, dwarf soldiers e dwarf guards!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},
		events = {
			onComplete = { 
				type = "question", 
				text = "Existe uma outra tarefa, mas está não é para mim, é em nome do Rei. Gostaria de saber dela?",
				action = "setState",
				confirmParam = 5
			}
		},
		reward = {exp = 214200, container = { id = items.brown_backpack,
			items.stealth_ring,
			items.guardian_shield,
			isSorcerer = { items.wand_of_inferno, items.plate_legs },
			isDruid = { items.hailstorm_druid, items.plate_legs },
			isPaladin = { items.noble_armor, items.plate_legs },
			isKnight = { items.dwarven_armor, items.dwarven_legs, meleeOptions = { club = items.clerical_mace, sword = items.crimson_sword, axe = items.halberd } },
		}}
	},
	[CAP_ONE.ISLAND_OF_PEACE.EIGHTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.SEVENTH,
		requireItems = { { items.golden_goblet} },
		reward = { action = "promotePlayer" }
	},
	[CAP_ONE.ISLAND_OF_PEACE.NINTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.EIGHTH,
		monsters = {{name = "cyclops", amount = 70, storagePos = 1}, {name = "cyclops smith", amount = 10, storagePos = 2}},
		dialogs = {
			requireTask = "Dul! Fale com o guarda Winston! Ele tem informações sobre tarefas...",
			description = "Percebemos movimentação dos Cyclops, aliados dos Orcs, não muito longe daqui... Seria de grande ajuda se você pudesse nos ajudar a eliminar alguns deles, o que acha?",
			taskObjectives = "Ar fis! Seguindo ao oeste daqui existe uma montanha dominada pelos Cyclops. Derrotar 70 cyclops e 10 cyclops smiths seria de ajuda a nossa causa. Aceita a missão?",
			taskStarted = "Estaremos aguardando a finalização de sua missão, Ith! Mas cuidado, sabe-se que a montanha possui uma ponte que leva ao territorio dos Ka. Melhor não a atrevassar. ",
			taskIncomplete = "Ainda há muita movimentação dos cyclops... Lembre-se: Precisas derrotar 70 cyclops e 10 cyclops smiths!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				defaultDialogs.COMPLETED_TASK_END,
			},
		},		
		events = {
			onComplete = { 
				type = "question", 
				text = "Dul! Gostaria de continuar ajudando-nos?", 
				onConfirm = "action",
				confirmParam = "callResponseTask"
			}
		},			
		reward = {exp = 215200, money = 3000, container = { id = items.brown_backpack,
			isSorcerer = { items.blue_robe },
			isDruid = { items.blue_robe }
		}}
	},			
	[CAP_ONE.ISLAND_OF_PEACE.TENTH] = {
		--requiredTask = CAP_ONE.ISLAND_OF_PEACE.NINTH,
		requirePoints = 850,
		monsters = {
			{name = "orc", points = 1}, 
			{name = "orc spearman", points = 2}, 
			{name = "orc warrior", points = 3}, 
			{name = "orc shaman", points = 6}, 
			{name = "orc rider", points = 6}, 
			{name = "orc berserker", points = 8}, 
			{name = "orc leader", points = 12}, 
			{name = "orc warlord", points = 30}
		},
		dialogs = {
			--requireTask = "",
			description = "Otimo, Dul! Ao sul existe a fortaleza dos Orcs. Alguns informantes acreditam que eles estão tramando algo. Poderia nos ajudar enfrentando alguns deles?",
			taskObjectives = {
				"Sua ajuda é muito valiosa humano! Bom, acredito que se você os atacar derrotando alguns orcs que integram a elite da raça irá desacreditar eleas a vierem contra nós [...]",
				"Você precisará somar 850 pontos, sendo que a cada orc derrotado valera: normal 1 ponto, spearman 2 pontos, warrior 3 pontos, shaman e rider 6 pontos, berserker 8 pontos, leader 12 pontos e warlord 30 pontos... Aceita a missão?"
			},
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Eles continuam tramando! Seja rápido! Não temos como resistir se eles atacarem! Lembre-se: Precisa acumular 850 pontos matando orcs de qualquer tipo!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				"Deve achar que é uma recomensa bastante valiosa... A proposito, boatos dizem que é possivel conseguir o titulo de matador de dragões. Mate mais alguns cyclops atravessando a montanha e chegue nos dragões e procure por Mesth'zaros...",
			},
		},
		reward = {exp = 260000, money = 5000, container = { id = items.brown_backpack,
			isSorcerer = { 
				{ container = {id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}}, 
				{ container = {id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}} 
			},
			isDruid = { 
				{ container = {id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}}, 
				{ container = {id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}} 
			},
			isPaladin = { container = { id = items.brown_backpack, inside = { items.health_potion, amount = 20}} },
			isKnight = { meleeOptions = { sword = items.bright_sword, axe = items.naginata, club = items.orcish_maul }, container = { id = items.brown_backpack, inside = { items.health_potion, amount = 20}} },
		}}
	},	
	[CAP_ONE.ISLAND_OF_PEACE.ELEVENTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.TENTH,
		requireItems = { { items.green_dragon_scale, amount = 1} },
		monsters = {{name = "dragon", amount = 50, storagePos = 1}},
		dialogs = {
			requireTask = "Antes de você receber a tarefa que eu tenho para você é necessario que você ajude os Elfos, procure Van'Caelnis.",
			description = "Dragões são criaturas impiedosas, entretanto elas podem dar coisas valiosas quando derrotadas. Posso lhe transformar em um matador de dragões, quer saber mais?",
			taskObjectives = "Você parece valente jovem, mas precisará de muito mais que isso para se tornar um matador de dragões... A tarefa que tenho para tí é a seguinte: Você deve derrotar 50 dragões e me trazer ao menos 1 green dragon scale. Topa?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Está demorando de mais! Lembre-se: Precisas derrotar 50 dragões e me trazer ao menos 1 green dragon scale para se firmar como um matador de dragões!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				"Com esta recompensa você deve estar preparado para enfrentar qualquer tipo de criatura nesta ilha. Sei que Boros Krum está tendo problemas com as aranhas... Siga para o territorio das aranhas ao sul!",
			},
		},		
		reward = {exp = 877000, money = 10000, container = { id = items.brown_backpack,
			items.dragon_shield,
			isSorcerer = { items.wand_of_voodoo },
			isDruid = { items.underworld_rod },
			isKnight = { items.knight_armor, items.knight_legs }
		}}
	},		
	[CAP_ONE.ISLAND_OF_PEACE.TWELFTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.ELEVENTH,
		requireItems = { { items.giant_spider_silk, amount = 5} },
		monsters = {{name = "giant spider", amount = 80, storagePos = 1}},
		dialogs = {
			requireTask = "So tenho tarefas para matadores de dragões, mas você não parece ser um...",
			description = "Pode ver-las? Estão por toda a parte! É preciso eliminar-las algumas, ou em breve ela estarão por todo continente! Quer nos ajudar?",
			taskObjectives = "Você é um matador de dragões, talvez tenha algum sucesso nesta tarefa. Você deve derrotar 80 giant spiders e me trazer ao menos 5 giant spider silk's. Se conseguir terá uma recompensa... Aceita?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Está demorando de mais! Lembre-se: Precisas derrotar 80 giant spiders e me trazer ao menos 5 giant spider silk's!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				"Bastante generosa não? Creio que você está apto a enfrentar a criatura mais tenebrosa desta ilha... Os vermelhos... Volte a falar com o caçador de dragões...",
			},
		},		
		reward = {exp = 1111000, money = 10000}
	},		
	[CAP_ONE.ISLAND_OF_PEACE.THIRTEENTH] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.TWELFTH,
		monsters = {{name = "dragon lord", amount = 5, storagePos = 1}},
		dialogs = {
			requireTask = "Eu tenho mais uma tarefa para você, mas primeiro é preciso que você conclua a tarefa de Boros Krum, fale com ele na area das aranhas gigantes...",
			description = "Ao noroeste daqui existe uma pequena torre em meio aos dragões, nesta torre existe os senhores dos dragões, eles são as criaturas mais temidas dentro desta ilha. Quer saber mais sobre esta missão?",
			taskObjectives = "Você devera derrotar 5 dragon lords. Se conseguir completar esta missão receberá muitos pontos de experiencia e dinheiro. Topa?",
			taskStarted = defaultDialogs.STARTED_TASK,
			taskIncomplete = "Está demorando de mais! Lembre-se: Precisas derrotar 5 dragon lords!",
			taskCompleted = { 
				defaultDialogs.COMPLETED_TASK_INIT,
				"Como se sente? Agora você está preparado para seguir o seu destino. Você deve seguir para a cidade e vá para o barco, fale com o capitão e irá sair da ilha, vá para Quendor. Procure por Daves, no centro, ele tera algo para ti. Boa sorte bravo caçador de dragões!",
			},
		},
		reward = {exp = 1073500, money = 10000}
	},
	
	
	[CAP_ONE.QUENDOR.TRAVELER_IOP] = {
		requiredTask = CAP_ONE.ISLAND_OF_PEACE.THIRTEENTH,
		reward = {exp = 2669500, money = 20000, container = { id = items.brown_backpack,
			items.crown_armor, items.crown_legs}
		}
	}
}

-- Static Methods

tasks = {}

function tasks.hasStartedTask(cid)

	local task = tasks.getStartedTask(cid)
	
	if(task == LUA_ERROR) then
		return false
	end
		
	return true	
end

function tasks.getStartedTask(cid)
	return getPlayerStorageValue(cid, sid.TASK_STARTED)
end



-- Object Methods

Task = {
	taskid = 0,
	cid = 0,
	itemsStr = "",
	itemsStrFirst = true
}

function Task:new()
	local obj = {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function Task:loadById(taskid)

	for k,v in pairs(tasksList) do
		if(k == taskid) then
			self.taskid = taskid
			return true
		end
	end
	
	return false
end

function Task:setPlayer(player)
	self.cid = player
end

function Task:getMonsters()
	return tasksList[self.taskid].monsters
end

function Task:getRequirePoints()
	
	return tasksList[self.taskid].requirePoints
end

function Task:getPlayerKillsCount(monsterPos)
	local value = getPlayerStorageValue(self.cid, monsterPos)
	
	if(value == LUA_ERROR) then
		return 0
	end
	
	return value
end

function Task:setPlayerKillsCount(monsterPos, value)
	setPlayerStorageValue(self.cid, monsterPos, value)
end

function Task:sendKillMessage(str)
	doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_ORANGE, str)
end

function Task:setStarted()
	setPlayerStorageValue(self.cid, self.taskid, taskStats.STARTED)
	setPlayerStorageValue(self.cid, sid.TASK_STARTED, self.taskid)
end

function Task:setCompleted(cid, taskid)
	setPlayerStorageValue(self.cid, self.taskid, taskStats.COMPLETED)
	setPlayerStorageValue(self.cid, sid.TASK_STARTED, -1)
end

function Task:getState()
	return getPlayerStorageValue(self.cid, self.taskid)
end

function Task:doPlayerAddReward()

	local reward = tasksList[self.taskid].reward
	
	if(reward.paladinDistTo ~= nil and isPaladin(self.cid)) then
	
		local count = reward.paladinDistTo - getPlayerSkill(self.cid, LEVEL_SKILL_DISTANCE)
		local oldskill = getPlayerSkill(self.cid, LEVEL_SKILL_DISTANCE)
		if(count > 0) then
			doPlayerAddSkill(self.cid, LEVEL_SKILL_DISTANCE, count)
			doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você avançou de distance skill " .. oldskill .. " para " .. reward.paladinDistTo .. ".")
		end
		
		if(reward.paladinShieldTo ~= nil and isPaladin(self.cid)) then
			local count = reward.paladinShieldTo - getPlayerSkill(self.cid, LEVEL_SKILL_SHIELDING)
			local oldskill = getPlayerSkill(self.cid, LEVEL_SKILL_SHIELDING)
			if(count > 0) then
				doPlayerAddSkill(self.cid, LEVEL_SKILL_SHIELDING, count)
				doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você avançou de shield skill " .. oldskill .. " para " .. reward.paladinShieldTo .. ".")
			end
		end
	elseif(reward.knightSkillTo ~= nil and isKnight(self.cid)) then
	
		local skillid = getPlayerHighMelee(self.cid)
	
		local count = reward.knightSkillTo - getPlayerSkill(self.cid, skillid)
		local oldskill = getPlayerSkill(self.cid, skillid)
		if(count > 0) then
			doPlayerAddSkill(self.cid, skillid, count)
			doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você avançou de seu melhor melee skill " .. oldskill .. " para " .. reward.knightSkillTo .. ".")
		end
		
		local count = reward.knightSkillTo - getPlayerSkill(self.cid, LEVEL_SKILL_SHIELDING)
		local oldskill = getPlayerSkill(self.cid, LEVEL_SKILL_SHIELDING)
		if(count > 0) then
			doPlayerAddSkill(self.cid, LEVEL_SKILL_SHIELDING, count)
			doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você avançou de shield skill " .. oldskill .. " para " .. reward.knightSkillTo .. ".")
		end
	elseif(reward.magicLevelTo ~= nil and (isSorcerer(self.cid) or isDruid(self.cid))) then
	
		local count = reward.magicLevelTo - getPlayerMagLevel(self.cid)
		local oldml = getPlayerMagLevel(self.cid)
		if(count > 0) then
			doPlayerAddMagLevel(self.cid, count)
			doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você avançou de magic level " .. oldml .. " para " .. reward.magicLevelTo .. ".")
		end
	end
	
	if(reward.exp ~= nil) then
		doPlayerAddExp(self.cid, reward.exp)
		doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você adquiriu " .. reward.exp .. " pontos de experiencia por concluir a tarefa.")
	end
	
	if(reward.money ~= nil) then
		doPlayerAddMoney(self.cid, reward.money)
		doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você adquiriu " .. reward.money .. " gold coins por concluir a tarefa.")
	end	
end

function Task:doPlayerAddRewardItems()
	
	self:resetItemString()
	
	local container = tasksList[self.taskid].reward.container
	
	if(container == nil) then
		return
	end
	
	local _container = nil
	
	if(container.id ~= nil) then
		_container = doCreateItemEx(container.id, 1)
	else
		print("[WARNING] Task:doPlayerAddRewardItems :: Container id not found")
	end
	
	for ck, cv in pairs(container) do
		if(ck == "id") then
			-- nada a fazer
		elseif(ck == "isSorcerer") then
			if(isSorcerer(self.cid)) then
				self:parseVocationItems(cv, _container)
			end
		elseif(ck == "isDruid") then	
			if(isDruid(self.cid)) then
				self:parseVocationItems(cv, _container)
			end		
		elseif(ck == "isPaladin") then	
			if(isPaladin(self.cid)) then
				self:parseVocationItems(cv, _container)
			end			
		elseif(ck == "isKnight") then	
			if(isKnight(self.cid)) then
				self:parseVocationItems(cv, _container)
			end			
		else
			doAddContainerItem(_container, cv)
			self:addItemToString(cv)
		end
	end
	
	if(self.itemsStr ~= "") then
		doPlayerAddItemEx(self.cid, _container, FALSE)
		self.itemsStr = self.itemsStr .. "."
		doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, self.itemsStr)
	end
end

function Task:parseVocationItems(node, container)
	for key, value in pairs(node) do
		if(key == "container") then
			-- container = { id = items.brown_backpack, inside = { items.mana_potion, amount = 20}}
			local internalContainer = nil
			if(value.id ~= nil) then
				internalContainer = doCreateItemEx(value.id, 1)
			else
				print("[WARNING] Task:parseVocationItems :: Internal id to container not found")
			end
		
			self:parseInternalContainer(value, internalContainer)
			if(doAddContainerItemEx(container, internalContainer) == LUA_ERROR) then
				print("[ERROR] Task:parseVocationItems :: Can not add internal container to main container. Internal container details:")
			end
		elseif(key == "meleeOptions") then
			self:parseMeleeWeapon(value, container)
		else
			doAddContainerItem(container, value)
			self:addItemToString(value)
		end
	end
end

function Task:parseInternalContainer(node, internalContainer)

	local itemid = node.inside[1]
	local amount = node.inside.amount
	
	self:addItemToString(itemid, true)
	
	for i = 1, amount, 1 do
		local itemEx = doCreateItemEx(itemid)
		if(doAddContainerItemEx(internalContainer, itemEx) == LUA_ERROR) then
			print("[ERROR] Task:parseInternalContainer :: Can not add a item to internal container: {itemid=" .. itemid .. ", amount=" .. amount .. ", posError=" .. i .. "}")
		end
	end
end

function Task:parseMeleeWeapon(node, container)

	local skillid = getPlayerHighMelee(self.cid)

	for key,value in pairs(node) do
		if(key == "club" and skillid == LEVEL_SKILL_CLUB) then	
			doAddContainerItem(container, value)
			self:addItemToString(value)
		elseif(key == "axe" and killid == LEVEL_SKILL_AXE) then	
			doAddContainerItem(container, value)
			self:addItemToString(value)
		elseif(key == "sword" and skillid == LEVEL_SKILL_SWORD) then	
			doAddContainerItem(container, value)
			self:addItemToString(value)
		end
	end
end

function Task:resetItemString()
	self.itemsStrFirst = true
end

function Task:addItemToString(item, isBackpack)

	if(self.itemsStrFirst) then
		self.itemsStr = "Items adquiridos na recompensa: " .. getItemName(item)
		self.itemsStrFirst = false
	else
		if(isBackpack == nil) then
			isBackpack = false
		end
		
		if(isBackpack) then
			self.itemsStr = self.itemsStr .. ", " .. "backpack de " .. getItemName(item)
		else
			self.itemsStr = self.itemsStr .. ", " .. getItemName(item)
		end
	end
end

function Task:checkPlayerRequirements()
	local requiredTask = tasksList[self.taskid].requiredTask
	
	if(getPlayerStorageValue(self.cid, requiredTask) == taskStats.COMPLETED) then	
		return true
	end
	
	return false
end

function Task:removeRequiredItems()
	
	-- requireItems = { { items.golden_goblet} },
	local items = tasksList[self.taskid].requireItems
	
	if(items == nil) then
		return true
	end
	
	for k,v in pairs(items) do	
		local item = v
		local amount = 1
		
		if(item["amount"] ~= nil) then
			amount = item["amount"]
		end
		
		if(getPlayerItemCount(self.cid, item[1]) < amount) then
			return false
		end
	end
	
	for k,v in pairs(items) do	
		local item = v
		local amount = 1
		
		if(item["amount"] ~= nil) then
			amount = item["amount"]
		end		
		
		if(doPlayerRemoveItem(self.cid, item[1], amount) ~= TRUE ) then
			-- apesar do player possuir o item nÃ£o foi possivel remover-lo
			return false
		end
	end	
	
	return true
end