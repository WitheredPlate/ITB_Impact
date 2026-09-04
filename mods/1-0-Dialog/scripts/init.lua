local mod = {
	id = "ffrg_impact_dialog",
	name = "",
	description = "-- Dialog --\n\nAdds new Dialog Events to both Vanilla and Impact Pilots to highlight new features.\nDialog Setting may require a game restart to function properly.\n\nEvents:\n - Heal\n - Boost\n - Supply\n - Deplete\n - Self-Damage\n",
	modApiVersion = "2.8.3",
	version = ffrg_impact_version,
	gameVersion = "1.2.83",
	icon = "img/icons/mod.png"
}

local option_dialog_setting = {
	"dialog_setting",
	"Dialog Setting",
	"Determines which dialog events can and cannot play",
	{
		values = { "impact", "limited", "full"},
		strings = { "Impact Only", "Limited", "Full" },
		tooltips = { "Only dialog specific to gameplay explored in Impact.", "Excludes dialogs with moderate to high frequency.", "Implements all dialog events." },
		value = "full"
	}
}

function mod:metadata()
	modApi:addGenerationOption(unpack(option_dialog_setting))
end

function mod:init()
end

function mod:load(options, version)
	ffrg_impact_dialog_setting = options.dialog_setting.value
	require(self.scriptPath .."dialogEvents")
end

return mod
