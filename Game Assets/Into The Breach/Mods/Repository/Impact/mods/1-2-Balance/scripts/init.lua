local mod = {
	id = "ffrg_impact_balance",
	name = "",
	description = "-- Balance --\n\nBalances Equipment, Pilots, Enemies, et cetera to better align with the content from or use features from Impact.\n\nEquipment:\n [Buff]\n  - Rock Accelerator\n  - Repair Drop\n [Rework]\n  - Prism Laser\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
end

return mod
