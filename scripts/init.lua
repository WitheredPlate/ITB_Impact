ffrg_impact_version = "1.0.1"

local mod = {
    id = "ffrg_impact",
    name = "",
    description = "-- Impact --\n\nA content pack that implements Multihit Attacks and Supplying.\n\nBy WitheredPlate\n",
    version = ffrg_impact_version,
    modApiVersion = "2.8.3",
    gameVersion = "1.2.83",
    icon = "img/icons/mod_version.png",
    dependencies = {
        memedit = "1.2.0",
        modApiExt = "1.23",
    },
    submodFolders = {"mods/"},
    load = function() end
}
local libs = {
    "tipTracker",
    "queuedPreview",
    "weaponPreview",
    "worldConstants",
    "seriousDamage/seriousDamage",
    "customAnim",
    "customProjectile",
    --"customClass",
    "spawnController",
    "artilleryArc",
    "multihit/multihit",
    "supply/supply",
}
local templates = {
    "coordinatedStrike",
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
    require(self.scriptPath .."pawns")
end

return mod
