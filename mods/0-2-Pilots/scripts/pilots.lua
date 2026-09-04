--////////////////////////////////--
--//       (Impact) Pilots      //--
--////////////////////////////////--

--== Unique ==--
-- Evelyn Moore
-- Averruncus

--== Alien ==--
-- Turzil

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "portraits/pilots/ffrg_Pilot_Composed.png",
    "portraits/pilots/ffrg_Pilot_Composed_2.png",
    "portraits/pilots/ffrg_Pilot_Composed_blink.png",
    "portraits/pilots/ffrg_Pilot_Martyr.png",
    "portraits/pilots/ffrg_Pilot_Martyr_2.png",
    "portraits/pilots/ffrg_Pilot_Martyr_blink.png",
    "portraits/pilots/ffrg_Pilot_Engi.png",
    "portraits/pilots/ffrg_Pilot_Engi_2.png",
    "portraits/pilots/ffrg_Pilot_Engi_blink.png",
    "effects/ffrg_confuse_cult.png",
    "weapons/ffrg_repair_engi.png",
    "weapons/ffrg_repair_engi_frozen.png",
    "combat/icons/ffrg_icon_repair_engi_10.png",
    "combat/icons/ffrg_icon_repair_engi_10_miss.png",
    "combat/icons/ffrg_icon_repair_engi_10_redundant.png",
    "combat/icons/ffrg_icon_repair_engi_10_redundant_miss.png",
    "combat/icons/ffrg_icon_repair_engi_11.png",
    "combat/icons/ffrg_icon_repair_engi_11_miss.png",
    "combat/icons/ffrg_icon_repair_engi_11_redundant.png",
    "combat/icons/ffrg_icon_repair_engi_11_redundant_miss.png"
}

Location["combat/icons/ffrg_icon_repair_engi_10.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_redundant.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_redundant_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_redundant.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_redundant_miss.png"] = Point(-28,-2)

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--////////////////////////////////--





--////////////////////////////////--
--//           Pilots           //--
--////////////////////////////////--


local tooltips = require(path .."scripts/libs/tooltip")
local replaceRepair = require(path.."scripts/replaceRepair/replaceRepair")


------------------
-- Evelyn Moore --
------------------

local dialog_composed = require(path .."scripts/dialogs/dialog_composed")

local pilot_composed = {
    Id = "ffrg_Pilot_Composed",
    Personality = "ffrg_Composed",
    Name = "Evelyn Moore",
    Voice = "/voice/bethany",
    Skill = "ffrg_Composed",
    Blacklist = {"Conservative","Pain","Move","Adrenaline"},
}

tooltips.Add(
    "ffrg_Composed",
    PilotSkill(
        "Composed",
        "Mech is Supplied if it does not move."
    )
)

if Personality["ffrg_Composed"] then
    Personality["ffrg_Composed"]:AddDialogTable(dialog_composed)
else
    local personality_composed = CreatePilotPersonality("ffrg_Composed")
    personality_composed:AddDialogTable(dialog_composed)
    Personality["ffrg_Composed"] = personality_composed
end

CreatePilot(pilot_composed)

local ffrg_onPawnMoveEnd = function(mission, pawn, p1, p2)
    if pawn and pawn:GetAbility() == pilot_composed.Skill then
        mission.ffrg_MooreMoveTracker = true
    end
end

local ffrg_onPawnUndoMove = function(mission, pawn, point)
    if pawn and pawn:GetAbility() == pilot_composed.Skill then
        mission.ffrg_MooreMoveTracker = false
    end
end

local ffrg_onSkillStart = function(mission, pawn, weaponId, p1, p2)
    if pawn and pawn:GetAbility() == pilot_composed.Skill and mission.ffrg_MooreMoveTracker == false and weaponId ~= "Move" then
        ffrg_MooreSupplyInstant(p1)
        mission.ffrg_MooreSupplyTracker = true
    end
end

local ffrg_onFinalEffectStart = function(mission, pawn, weaponId, p1, p2, p3)
    if pawn and pawn:GetAbility() == pilot_composed.Skill and mission.ffrg_MooreMoveTracker == false and weaponId ~= "Move" then
        ffrg_MooreSupplyInstant(p1)
        mission.ffrg_MooreSupplyTracker = true
    end
end

function ffrg_MooreSupplyInstant(point)
    local index = ffrg_Supply.SupplyIndex(point,point)
    if index > 0 then
        local damage = ffrg_Supply.Supply(point,point,nil,{returnDamage = true, hideIcon = true})
        damage.sAnimation = "nil"
        Board:DamageSpace(damage)
        Board:AddAnimation(point,"ffrg_UseSupply", 1)
    end
end

local Tracking = false

local ffrg_onNextTurn = function(mission)
    if Game:GetTeamTurn() == TEAM_PLAYER then
        if mission.ffrg_MooreSupplyTracker == false and mission.ffrg_MooreMoveTracker == false then
            for id = 0, 2 do
                if Board:GetPawn(id) and Board:GetPawn(id):GetAbility() == pilot_composed.Skill then
                    local pawn = Board:GetPawn(id)
                    local point = pawn:GetSpace()
                    if not pawn:IsDead() and not pawn:IsFrozen() and (not Board:IsSmoke(point) or pawn:IsIgnoreSmoke()) then
                        ffrg_MooreSupplyInstant(point)
                    end
                end
            end
        end
        mission.ffrg_MooreSupplyTracker = false
        mission.ffrg_MooreMoveTracker = false
    end
end

local function mooreTrackerStartup()
    if Board and Tracking == false then
        local HasPilotComposed = false
        for id = 0, 2 do
            if Board:GetPawn(id) and Board:GetPawn(id):GetAbility() == pilot_composed.Skill then
                HasPilotComposed = true
            end
        end
        if HasPilotComposed == true then
            Tracking = true
            modApi.events.onNextTurn:subscribe(ffrg_onNextTurn)
            modapiext.events.onPawnMoveEnd:subscribe(ffrg_onPawnMoveEnd)
            modapiext.events.onPawnUndoMove:subscribe(ffrg_onPawnUndoMove)
            modapiext.events.onSkillStart:subscribe(ffrg_onSkillStart)
            modapiext.events.onFinalEffectStart:subscribe(ffrg_onFinalEffectStart)
        end
    end
end

local function mooreTrackerConclude()
    if Tracking == true then
        Tracking = false
        modApi.events.onNextTurn:unsubscribe(ffrg_onNextTurn)
        modapiext.events.onPawnMoveEnd:unsubscribe(ffrg_onPawnMoveEnd)
        modapiext.events.onPawnUndoMove:unsubscribe(ffrg_onPawnUndoMove)
        modapiext.events.onSkillStart:unsubscribe(ffrg_onSkillStart)
        modapiext.events.onFinalEffectStart:unsubscribe(ffrg_onFinalEffectStart)
    end
end

local ffrg_onDeploymentPhaseEnd = function(mission)
    mooreTrackerStartup()
    GetCurrentMission().ffrg_MooreMoveTracker = true
    GetCurrentMission().ffrg_MooreSupplyTracker = true
end

local ffrg_onGameEntered = function()
    mooreTrackerStartup()
end

local ffrg_onMissionEnd = function(mission)
    if not mission.MapTags or #mission.MapTags == 0 or mission.MapTags[1] ~= "final_island" then
        mooreTrackerConclude()
    end
end

local ffrg_onPostStartGame = function(mission)
    mooreTrackerConclude()
end

modApi.events.onDeploymentPhaseEnd:subscribe(ffrg_onDeploymentPhaseEnd)
modApi.events.onPostStartGame:subscribe(ffrg_onPostStartGame)
modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
modApi.events.onGameEntered:subscribe(ffrg_onGameEntered)


----------------
-- Averruncus --
----------------

local dialog_martyr = require(path .."scripts/dialogs/dialog_martyr")

local pilot_martyr = {
    Id = "ffrg_Pilot_Martyr",
    Personality = "ffrg_Martyr",
    Name = "Averruncus",
    PowerCost = 2,
    Voice = "/voice/archimedes",
    Skill = "ffrg_Martyr"
}

tooltips.Add(
    "ffrg_Martyr",
    PilotSkill(
        "Salvation",
        "On Reset Turn, Flip all enemies."
    )
)

if Personality["ffrg_Martyr"] then
    Personality["ffrg_Martyr"]:AddDialogTable(dialog_martyr)
else
    local personality_martyr = CreatePilotPersonality("ffrg_Martyr")
    personality_martyr:AddDialogTable(dialog_martyr)
    Personality["ffrg_Martyr"] = personality_martyr
end

CreatePilot(pilot_martyr)


ffrg_Emitter_Confuse = Emitter_Confuse1:new{
    x = 0,
    y = 20,
    variance_x = 30,
    variance_y = 15,
    burst_count = 5,
    max_alpha = 0.6,
    speed = 0.6,
    lifespan = 2,
    image = "effects/ffrg_confuse_cult.png"
}

local resetCharge = false

local function BoardHasMartyr()
	for id = 0, 2 do
		if Board:GetPawn(id):IsAbility(pilot_martyr.Skill) then
			return true
		end
	end
end

local ffrg_onResetTurn = function(mission)
    if BoardHasMartyr() then resetCharge = true end
end

local ffrg_onFrameDrawn = function()
    if resetCharge and Board then
        resetCharge = false
        for i = 0, 7 do
            for j = 0, 7  do
                local point = Point(i,j)
                if Board:IsPawnSpace(point) and Board:GetPawn(point):GetTeam() == TEAM_ENEMY then
                    Board:AddBurst(point, "ffrg_Emitter_Confuse", DIR_NONE)
                    Board:DamageSpace(SpaceDamage(point,0,DIR_FLIP))
                end
            end
        end
    end
end

local oldTriggerVoiceEvent = TriggerVoiceEvent
function TriggerVoiceEvent(event, ...)
	if event.id == "Mission_ResetTurn" then
        for id = 0, 2 do
            if Board:GetPawn(id):IsAbility(pilot_martyr.Skill) then
                event = VoiceEvent("Mission_ResetTurn_Martyr",id,id)
            end
        end
    end
	oldTriggerVoiceEvent(event, ...)
end

modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
modApi.events.onFrameDrawn:subscribe(ffrg_onFrameDrawn)



------------
-- Turzil --
------------

local dialog_engi = require(path .."scripts/dialogs/dialog_engi")

local pilot_engi = {
    Id = "ffrg_Pilot_Engi",
    Personality = "ffrg_Engi",
    Name = "Turzil",
    PowerCost = 1,
    Voice = "/voice/gana",
    Skill = "ffrg_Engi"
}

if Personality["ffrg_Engi"] then
    Personality["ffrg_Engi"]:AddDialogTable(dialog_engi)
else
    local personality_engi = CreatePilotPersonality("ffrg_Engi")
    personality_engi:AddDialogTable(dialog_engi)
    Personality["ffrg_Engi"] = personality_engi
end

CreatePilot(pilot_engi)

ffrg_Repair_Engi = Skill_Repair:new{
    Name = "Flawless Repair",
    Description = "Repair 10 points of damage; remove Fire, Ice, and A.C.I.D; and apply Shield, Boost and Supply.",
    Amount = -10,
    LaunchSound = "/weapons/refrigerate",
    TipImage = {
        Unit = Point(2,2),
        Target = Point(2,2),
        Fire = Point(2,2),
        Second_Click = Point(3,2),
        Length = 6
    }
}

local ffrg_Engi_Supplyable = false

function ffrg_Repair_Engi:GetSkillEffect(p1,p2)
	local ret = SkillEffect()

    local damage = SpaceDamage(p2,0)
    local damageo = SpaceDamage(p2,-1)
    local damages = SpaceDamage(p2,self.Amount)
    local damageb = SpaceDamage(p2,0)
    local damager = SpaceDamage(p2,0)
    if not Board:IsTipImage() then
        damager = ffrg_Supply.Supply(p1,p2,nil,{returnDamage = true})
    elseif ffrg_Engi_Supplyable then
        damager.sAnimation = "ffrg_UseSupply"
    end

    damages.bHide = true
	damages.iFire = EFFECT_REMOVE
	damages.iAcid = EFFECT_REMOVE
	damageo.iFire = EFFECT_REMOVE
	damageo.iAcid = EFFECT_REMOVE
	damageb.iShield = EFFECT_CREATE

    local icon = "combat/icons/ffrg_icon_repair_engi_"
    local supply = true

    if Board:IsPawnSpace(p2) and Board:GetPawn(p2):IsBoosted() then
        icon = icon.."11"
    else
        icon = icon.."10"
    end
    if ( not Board:IsTipImage() and ffrg_Supply.SupplyIndex(p1,p2) == 0 ) or ( Board:IsTipImage() and not ffrg_Engi_Supplyable ) then
        supply = false
        icon = icon.."_redundant"
    end

    if Board:IsPawnSpace(p2) and Board:GetPawn(p2):IsShield() then
        icon = icon.."_miss"
    end

    icon = icon..".png"

    damage.sImageMark = icon

    ret:AddScript(string.format("ffrg_Repair_Engi:Boost(%s)", p2:GetString()))
    ret:AddDamage(damager)
    ret:AddDamage(damages)
    ret:AddDamage(damageb)
    ret:AddDamage(damage)

	if IsPassiveSkill("Mass_Repair") then
		local mechs = extract_table(Board:GetPawns(TEAM_MECH))
		for i,id in pairs(mechs) do
			if Board:GetPawnSpace(id) ~= p2 then
				damageo.loc = Board:GetPawnSpace(id)
				ret:AddDamage(damageo)
			end
		end
	end

	return ret
end

function ffrg_Repair_Engi:Boost(point)
    modApi:runLater(function()
        if Board:IsPawnSpace(point) then
            Board:GetPawn(point):SetBoosted(true)
        end
    end)
end

local function ffrg_Engi_SupplyableTester()
    ffrg_Engi_Supplyable = false
    for id = 0, 2 do
        if Board and Board:GetPawn(id) and Board:GetPawn(id):IsAbility(pilot_engi.Skill) then
            curr = Board:GetPawnSpace(id)
            if ffrg_Supply.SupplyIndex(curr,curr) > 0 then
                ffrg_Engi_Supplyable = true
            end
        end
    end
end

local function ffrg_Engi_SupplyableTesterDelayed()
    modApi:runLater(ffrg_Engi_SupplyableTester)
end

modApi.events.onGameEntered:subscribe(ffrg_Engi_SupplyableTester)
modApi.events.onDeploymentPhaseEnd:subscribe(ffrg_Engi_SupplyableTester)
modApi.events.onTestMechEntered:subscribe(ffrg_Engi_SupplyableTesterDelayed)

replaceRepair:addSkill{
    name = "Engi",
    description = "Repair fully heals, Shields, Boosts, and Supplies.",
    weapon = "ffrg_Repair_Engi",
    pilotSkill = "ffrg_Engi",
    icon = "img/weapons/ffrg_repair_engi",
    iconFrozen = "img/weapons/ffrg_repair_engi_frozen"
}
