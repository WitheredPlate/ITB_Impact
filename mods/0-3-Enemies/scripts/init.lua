local mod = {
	id = "ffrg_impact_enemies",
	name = "",
	description = "-- Enemies --\n\nIntroduces new Vek and Bots that pose new and unique threats.\n\nVek:\n [Common]\n  - Bomberbug\n [Rare]\n  - Caterpillar\n\nBots:\n - Shredder-Bot\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	require(self.scriptPath .."pawns")
	require(self.scriptPath .."missions")
	require(self.scriptPath .."spawner")
end

return mod
