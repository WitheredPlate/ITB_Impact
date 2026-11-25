ffrg_impact_version = "1.1.2"

local mod = {
    id = "ffrg_impact",
    name = "",
    description = "-- Impact --\n\nA content pack that implements Multihit Attacks and Supplying.\n\nBy WitheredPlate\n",
    version = ffrg_impact_version,
    modApiVersion = "2.9.7",
    gameVersion = "1.2.83",
    icon = "img/icons/mod_version.png",
    dependencies = {
        memedit = "1.2.3",
        modApiExt = "1.25",
    },
    submodFolders = {"mods/"},
    load = function() end
}
local libs = {

    -- Other's Technicals
    "worldConstants",
    "artilleryArc",
    "weaponPreview",
    "replaceRepair/replaceRepair",

    -- My Technicals
    "tipTracker",
    "queuedPreview",
    "seriousDamage/seriousDamage",
    "customProjectile/customProjectile",
    "spawnController",

    -- My Features
    "multihit/multihit",
    "supply/supply",

    -- My Helpers
    "pilotFactory",
    "platedAssets/platedAssets"

}
local templates = {
    "coordinatedStrike",
    "deployable"
}

function mod:init(options)
	local path = self.scriptPath
	self.libs = {}
	self.templates = {}
	for _, libId in ipairs(libs) do
		self.libs[libId] = require(path.."libs/"..libId)
	end
	for _, templateId in ipairs(templates) do
		self.templates[templateId] = require(path.."templates/"..templateId)
	end
	require(self.scriptPath .."weapons")
    require(self.scriptPath .."tutorials")

end

return mod
