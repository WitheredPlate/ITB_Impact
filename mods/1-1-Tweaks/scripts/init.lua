local mod = {
	id = "ffrg_impact_tweaks",
	name = "",
	description = "-- Tweaks --\n\nMakes adjustments to the behavior of the game to fix bugs, make different gameplay elements more coherent, or enhance interactions.\nSome Tweaks may require a game restart to function properly.\n\nTweaks:\n - Repair Adjustments\n - Charge Adjustments\n - Grid Adjustments\n - Spider Exclusion\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png",
	load = function() end
}


local option_charge_adjustments = {
	"charge_adjustments",
	"Charge Adjustments",
	"Makes the logic of what tiles can and cannot be charged through/onto consistent across all Vanilla charge attacks.",
	{enabled = true}
}

local option_repair_adjustments = {
	"repair_adjustments",
	"Repair Adjustments",
	"Allows all Vanilla and Impact Repair skills to target adjacent allies. Other modded Repair skills will either work correctly or be unaffected.",
	{enabled = true}
}

local option_grid_adjustments = {
	"grid_adjustments",
	"Grid Adjustments",
	"Increases Maximum Grid by 1 at the start of each island, but increases the quantity of Buildings that spawn per tile based on the current Sector and Difficulty.",
	{enabled = false}
}

local option_spider_exclusion = {
	"spider_exclusion",
	"Spider Exclusion",
	"Adds Spiders to the Webbers exclusion, preventing them from appearing with other units that cast Webs.",
	{enabled = true}
}

function mod:metadata()
	modApi:addGenerationOption(unpack(option_repair_adjustments))
	modApi:addGenerationOption(unpack(option_charge_adjustments))
	modApi:addGenerationOption(unpack(option_grid_adjustments))
	modApi:addGenerationOption(unpack(option_spider_exclusion))
end

function mod:init()
end

function mod:load(options, version)
	ffrg_impact_tweaks_charge_adjustments = options.charge_adjustments.enabled
	if options.charge_adjustments.enabled then
		require(self.scriptPath .."chargeAdjustments")
	end
	ffrg_impact_tweaks_repair_adjustments = options.repair_adjustments.enabled
	if options.repair_adjustments.enabled then
		require(self.scriptPath .."repairAdjustments")
	end
	ffrg_impact_tweaks_grid_adjustments = options.grid_adjustments.enabled
	if options.grid_adjustments.enabled then
		require(self.scriptPath .."gridAdjustments")
	end
	ffrg_impact_tweaks_spider_exclusion = options.spider_exclusion.enabled
	if options.spider_exclusion.enabled then
		ffrg_SpawnController.AppendBasicExclusion("webbers", "Spider")
	end
end

return mod
