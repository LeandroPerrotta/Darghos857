--[[
 * Contem todas constantes referentes ao Darghos, podem estar divididas por Arrays!
]]--


	-->> Posi��es de area para checagem ao login {creaturescripts/login.lua} (expulsa jogadores free de area premium)
	areaCheck = 
	{
		ARACURA_START = {x=2627 ,y=1043 ,z=7},
		ARACURA_END = {x=3097 ,y=1411 ,z=7},

		NORTHREND_START = {x=1677 ,y=1026 ,z=7},
		NORTHREND_END = {x=2103 ,y=1526 ,z=7},

		SALAZART_START = {x=1952 ,y=2299 ,z=7},
		SALAZART_END = {x=2773 ,y=2660 ,z=7}
	}
	
	towns =
	{
		ISLAND_OF_PEACE = 6
	}
	
	-->> Posi��es dos templos

		QUENDOR = {x=2020 ,y=1903, z=7}
		THORN = {x=2383 ,y=1856, z=7}
		SALAZART = {x=2271 ,y=2686, z=7}
		ARACURA = {x=2897 ,y=1185, z=7}
		ISLAND_PEACE = {x=1234 ,y=2234 ,z=7}

	QUESTLOG = {
	
		ARIADNE = {
		
			LAIR 			= 3600,
			GHAZRAN_WING 	= 3601,
			CULTISTS_WING 	= 3602
		},

		DIVINE_ANKH = {
			COURSE_CHURCH	= 3610,
			CHAMBER_TEMPTATION = 3611
		},
		
		MISSION_BONARTES = {
			KILL_DEMONS	= 3613,
			KILL_HEROS = 3612,
			KILL_BEHEMOTHS = 3614
		}		
	}
	
	KILL_MISSIONS = {
		BONARTES_HERO = 8457,
		BONARTES_BEHEMOTH = 3731,
		BONARTES_DEMON = 1209	
	}
	
	ACTION_ID_RANGES = {
	
		MIN_FIELD_DAMAGE = 8300,
		MAX_FIELD_DAMAGE = 8499
	}
	
	CUSTOM_ITEMS = {
	
		DURIN_HELMET			= 11736,
		DURIN_ARMOR				= 11737,
		DURIN_LEGS				= 11738,
		DURIN_SHIELD			= 11739,
		
		TASHI_AHARON_HELMET		= 11740,
		TASHI_AHARON_ARMOR		= 11741,
		TASHI_AHARON_LEGS		= 11742,
		TASHI_AHARON_BOOTS		= 11743,
		
		WARDEN_HELMET			= 11744,
		WARDEN_ARMOR			= 11745,
		WARDEN_LEGS				= 11746,
		WARDEN_BOOTS			= 11747,
		
		DEATHFACE_HELMET		= 11748,
		DEATHFACE_ARMOR			= 11749,
		DEATHFACE_LEGS			= 11750,
		DEATHFACE_BOOTS			= 11751,
		
		DARK_DUST				= 11752,
		UNHOLY_SWORD			= 11753
	}
