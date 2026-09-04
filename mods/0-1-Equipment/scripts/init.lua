local mod = {
	id = "ffrg_impact_equipment",
	name = "",
	description = "-- Equipment --\n\nIntroduces new Equipment that can be encountered during runs.\n\nEquipment:\n [Prime]\n  - Gorgon Shredder\n  - Atlas Maul\n [Brute]\n  - Flechette Caster\n  - Hydra Cannonade\n [Ranged]\n  - Horus Drill\n  - Sekhmet Saw\n [Science]\n  - Gravity Manipulator\n  - Heavy Repulsor\n [Support]\n  - Loading Belt\n  - Mounted Armaments\n [Passive]\n  - Hydrogen Fabricators\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	modApi:addWeaponDrop("ffrg_Prime_Shred")
	modApi:addWeaponDrop("ffrg_Prime_Maul")
	modApi:addWeaponDrop("ffrg_Brute_Cannonade")
	modApi:addWeaponDrop("ffrg_Brute_Flechette")
	modApi:addWeaponDrop("ffrg_Ranged_TC_Silica")
	modApi:addWeaponDrop("ffrg_Ranged_Sawblade")
	modApi:addWeaponDrop("ffrg_Science_TC_GravManipulator")
	modApi:addWeaponDrop("ffrg_Science_HeavyRepulse")
	modApi:addWeaponDrop("ffrg_Support_Supply")
	modApi:addWeaponDrop("ffrg_Support_MountedArmaments")
	modApi:addWeaponDrop("ffrg_Passive_IceSupply")
end

return mod

-- Hey if ur reading this u a bitch
