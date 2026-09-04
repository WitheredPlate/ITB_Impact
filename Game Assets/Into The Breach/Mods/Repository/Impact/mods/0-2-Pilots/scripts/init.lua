local mod = {
	id = "ffrg_impact_pilots",
	name = "",
	description = "-- Pilots --\n\nIntroduces new Pilots that can be encountered during runs.\n\nPilots:\n [Unique]\n  - Evelyn Moore\n  - Averruncus\n [Alien]\n  - Turzil\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."pilots")
	modApi:addPilotDrop{id = "ffrg_Pilot_Composed", pod = "advanced" }
	modApi:addPilotDrop{id = "ffrg_Pilot_Martyr", pod = "advanced" }
	modApi:addPilotDrop{id = "ffrg_Pilot_Engi", pod = false, ftl = true }
end

return mod
