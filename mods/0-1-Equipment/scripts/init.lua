local mod = {
	id = "ffrg_impact_equipment",
	name = "",
	description = "-- Equipment --\n\nIntroduces new Equipment that can be encountered during runs.\n\nEquipment:\n [Prime]\n  - Gorgon Shredder\n  - Disintegrator\n  - Atlas Maul\n [Brute]\n  - Flechette Caster\n  - Hydra Cannonade\n [Ranged]\n  - Horus Drill\n  - Sekhmet Saw\n [Science]\n  - Gravity Manipulator\n  - Heavy Repulsor\n [Support]\n  - Loading Belt\n  - Mounted Armaments\n  - Cannon Turret\n  - Mortar Turret\n  - Flamer Turret\n [Passive]\n  - Hydrogen Fabricators\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}

function mod:init()
	require(self.scriptPath .."weapons")
	require(self.scriptPath .."pawns")
	modApi:addWeaponDrop{id = "ffrg_Prime_Shred", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Prime_Maul", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Prime_HeavyLaser", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_Cannonade", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Brute_Flechette", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_TC_Silica", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Ranged_Sawblade", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_TC_GravManipulator", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Science_HeavyRepulse", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_Supply", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_MountedArmaments", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_DeployCannonTurret", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_DeployMortarTurret", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Support_DeployFlamerTurret", pod = "advanced", shop = "advanced"}
	modApi:addWeaponDrop{id = "ffrg_Passive_IceSupply", pod = "advanced", shop = "advanced"}
end

return mod

-- Hey if ur reading this u a bitch
