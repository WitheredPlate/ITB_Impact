local mod = {
	id = "ffrg_impact_squads",
	name = "",
	description = "-- Squads --\n\nIntroduces new playable Squads, in addition to their accompanying pieces of Equipment.\n\nSquads:\n - Architects\n - Seismic Colossi\n - Frenzy\n\nEquipment:\n [Prime]\n  - Boulder Flail\n  - Myriad Appendages\n [Brute]\n  - Rotary Cannon\n  - Scything Blades\n [Ranged]\n  - Bastion Dispensary\n  - Mainentance Mortar\n [Science]\n  - Mass Processor\n  - Long-Range Teleport\n  - Invasive Warp\n  - Upheaval Rail\n [Passive]\n  - Contingency Cache\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png"
}

function mod:init()
	require(self.scriptPath .."achievements")
	require(self.scriptPath .."weapons")
	require(self.scriptPath .."pawns")
	modApi:addWeaponDrop{id = "ffrg_Prime_BoulderFlail", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Prime_TC_MultiToss", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_Rotary", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_SawCharge", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_DeployBastion", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_TC_Maintenance", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_KO_Shred", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_TC_LongTele", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_KO_Telefrag", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_TC_Upheaval", pod = false, shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Passive_Phoenix", pod = false, shop = "advanced"}
end

function mod:load(options, version)
	modApi:addSquad(
		{
			id = "ffrg_Architects",
			"Architects",				-- title
			"ffrg_PrismMech",			-- mech #1
			"ffrg_BulwarkMech",			-- mech #2
			"ffrg_DisassemblyMech"		-- mech #3
		},
		"Architects",
		"With limited-use weaponry and industrial harvesting equipment, these Mechs flood the battlefield with units.",
		self.resourcePath .."img/icons/architects.png"
	)
	modApi:addSquad(
		{
			id = "ffrg_SeismicColossi",
			"Seismic Colossi",			-- title
			"ffrg_BruiserMech",			-- mech #1
			"ffrg_StrafeMech",			-- mech #2
			"ffrg_UpheavalMech"			-- mech #3
		},
		"Seismic Colossi",
		"Engineered with Detritus excavation technology, these industrial Mechs can reshape earth to their will.",
		self.resourcePath .."img/icons/seismic_colossi.png"
	)
	modApi:addSquad(
		{
			id = "ffrg_Frenzy",
			"Frenzy",					-- title
			"ffrg_ManifoldMech",		-- mech #1
			"ffrg_RazorMech",			-- mech #2
			"ffrg_MaintenanceMech"		-- mech #3
		},
		"Frenzy",
		"These Mechs eschew all titan-class safety protocols in favor of a greater degree of inflicted violence.",
		self.resourcePath .."img/icons/frenzy.png"
	)
end

return mod

-- Hey if ur reading this u a bitch
