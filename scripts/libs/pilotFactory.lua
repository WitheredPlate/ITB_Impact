--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--     Pilot Creation Library     --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## This is a library of functions that allows for the creation of pilots with several preset types of abilities


-----------------------
-- Table of Contents --
-----------------------

--## Function
-- ( perameter [Type] )
--


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function Ability(config)
    if config.ability_type and config.ability_data then
        if config.ability_type == "starter" and type(config.ability_data) == "function" then
            ffrg_PilotFactory.events.onStarterTrigger:subscribe(function(pawn)
                if pawn:IsAbility(config.ability) then
                    config.ability_data(pawn)
                end
            end)
        elseif config.ability_type == "cyclical" and type(config.ability_data) == "function" then
            ffrg_PilotFactory.events.onCyclicalTrigger:subscribe(function(pawn)
                if pawn:IsAbility(config.ability) then
                    config.ability_data(pawn)
                end
            end)
        elseif config.ability_type == "patient" and type(config.ability_data) == "function" then
            ffrg_PilotFactory.events.onPatientTrigger:subscribe(function(pawn)
                if pawn:IsAbility(config.ability) then
                    config.ability_data(pawn)
                end
            end)
        elseif config.ability_type == "reset" and type(config.ability_data) == "function" then
            ffrg_PilotFactory.events.onResetTrigger:subscribe(function(pawn)
                if pawn:IsAbility(config.ability) then
                    config.ability_data(pawn)
                end
            end)
        elseif config.ability_type == "stats" and type(config.ability_data) == "table" then
            LOG("TODO")
        elseif config.ability_type == "repair" and type(config.ability_data) == "table" then
            if not ReplaceRepair then LOG("ERROR: PilotFactory repair ability specified, but ReplaceRepair is not initialized") return end
            if config.ability_data.weapon and config.ability_data.icon then
                ReplaceRepair:addSkill{
                    name = config.ability_title,
                    description = config.ability_description,
                    weapon = config.ability_data.weapon,
                    pilotSkill = config.ability,
                    icon = config.ability_data.icon,
                    iconFrozen = config.ability_data.icon_frozen or nil
                }
            else
                LOG("ERROR: PilotFactory repair ability specified with insufficient data for ReplaceRepair") return end
        elseif config.ability_type == "move" and type(config.ability_data) == "function" then
            LOG("TODO")
        else
            LOG("ERROR: PilotFactory ability data and trigger specified but incompatible or invalid")
            return
        end
    end
end

local function Fabricate(config)
    config = config or {}
    local viable = true

    if not config.identifier then viable = false LOG("ERROR: PilotFactory cannot fabricate a pilot without a pilot identifier") end
    if not config.path then viable = false LOG("ERROR: PilotFactory cannot fabricate a pilot without a file path") end
    if not config.name then viable = false LOG("ERROR: PilotFactory cannot fabricate a pilot without a pilot name") end
    if config.ability ~= false and config.ability ~= "" then
        if not config.ability_title then viable = false LOG("ERROR: PilotFactory cannot fabricate a pilot with an ability but no ability title") end
        if not config.ability_description then viable = false LOG("ERROR: PilotFactory cannot fabricate a pilot with an ability but no ability description") end
    end

    if not viable then return end

    config.prefix = config.prefix and config.prefix.."_" or ""
    config.portrait_folder = config.portrait_folder or "pilots"

    local default = config.prefix..config.identifier
    local identifier_full = config.prefix.."Pilot_"..config.identifier


    -- PORTRAIT --
    config.portrait = config.portrait or identifier_full
    local portrait_path_target = "img/portraits/"..config.portrait_folder.."/"
    local portrait_path_origin = config.path.."img/portraits/"..config.portrait_folder.."/"

    if modApi:fileExists(portrait_path_origin..config.portrait..".png") then modApi:appendAsset(portrait_path_target..config.portrait..".png", portrait_path_origin..config.portrait..".png") else
        LOG(portrait_path_origin..config.portrait..".png")
        LOG("ERROR: PilotFactory cannot find a pilot portrait asset") return end
    if modApi:fileExists(portrait_path_origin..config.portrait.."_2.png") then modApi:appendAsset(portrait_path_target..config.portrait.."_2.png", portrait_path_origin..config.portrait.."_2.png") else
        LOG("ERROR: PilotFactory cannot find a critical pilot portrait asset") return end
    if modApi:fileExists(portrait_path_origin..config.portrait.."_blink.png") then modApi:appendAsset(portrait_path_target..config.portrait.."_blink.png", portrait_path_origin..config.portrait.."_blink.png") else
        LOG("WARNING: PilotFactory cannot find a blinking pilot portrait asset") end
    if modApi:fileExists(portrait_path_origin..config.portrait.."_glare.png") then modApi:appendAsset(portrait_path_target..config.portrait.."_glare.png", portrait_path_origin..config.portrait.."_glare.png") end


    -- DIALOG --
    config.dialog_path = config.dialog_path or config.path.."scripts/dialogs/"
    config.dialog = config.dialog or "dialog_"..(config.identifier:lower())

    local dialog
    if modApi:fileExists(config.dialog_path..config.dialog..".lua") then dialog = require(config.dialog_path..config.dialog) else
        LOG(config.dialog_path..config.dialog..".lua")
        LOG("ERROR: PilotFactory cannot find a pilot dialog file") return end

    config.personality = config.personality and config.prefix..config.personality or default
    if not Personality[config.personality] then Personality[config.personality] = CreatePilotPersonality(config.personality) end
    Personality[config.personality]:AddDialogTable(dialog)


    -- ABILITY --
    if config.ability == nil then config.ability = default
    elseif config.ability == false then config.ability = ""
    else config.ability = config.ability end

    if config.ability ~= "" then
        modApi:setText("Pilot_"..config.ability.."_Title",config.ability_title)
        modApi:setText("Pilot_"..config.ability.."_Text",config.ability_description)
    end

    Ability(config)


    -- DATA --
    local data = {
        Id = identifier_full,
        Name = config.name,
        Personality = config.personality,
        Voice = config.voice and "/voice/"..config.voice or "/voice/ralph",
        Portrait = config.portrait_folder.."/"..config.portrait,
        Sex = config.sex or SEX_MALE,
        Rarity = config.rarity or 1,
        PowerCost = config.power_cost or 0,
        Cost = config.cost or 1,
        Skill = config.ability,
        Blacklist = config.blacklist or {},
    }
    CreatePilot(data)
end

local reset_charge = false
local function ffrg_onResetTurn(mission)
    reset_charge = true
end

local function ffrg_onFrameDrawn()
    if reset_charge and Board and GetCurrentMission() then
        for id = 0, 2 do
            if Board:GetPawn(id) then
                local pawn = Board:GetPawn(id)
                if not pawn:IsDead() then
                    ffrg_PilotFactory.events.onResetTrigger:dispatch(pawn)
                end
            end
        end
        reset_charge = false
    end
end

local function patientDispatch(pawn)
    modApi:conditionalHook(
        function()
            return not pawn:IsBusy()
        end,
        function()
            ffrg_PilotFactory.events.onPatientTrigger:dispatch(pawn)
        end
    )
end

local ffrg_onPawnMoveEnd = function(mission, pawn, p1, p2)
    if mission ~= Mission_Test then
        local id = pawn:GetId()
        if id >= 0 and id <= 2 then
            GAME.ffrg_MoveTracker = GAME.ffrg_MoveTracker or {0,0,0}
            GAME.ffrg_MoveTracker[id+1] = GAME.ffrg_MoveTracker[id+1] + 1
        end
    end
end

local ffrg_onPawnUndoMove = function(mission, pawn, point)
    if mission ~= Mission_Test then
        local id = pawn:GetId()
        if id >= 0 and id <= 2 then
            GAME.ffrg_MoveTracker = GAME.ffrg_MoveTracker or {0,0,0}
            GAME.ffrg_MoveTracker[id+1] = math.max(0, GAME.ffrg_MoveTracker[id+1] - 1)
        end
    end
end

local ffrg_onSkillStart = function(mission, pawn, weaponId, p1, p2)
    if weaponId ~= "Move" then
        local id = pawn:GetId()
        if mission == Mission_Test then
            patientDispatch(pawn)
        elseif id >= 0 and id <= 2 and GAME.ffrg_MoveTracker and GAME.ffrg_MoveTracker[id+1] == 0 then
            patientDispatch(pawn)
            GAME.ffrg_MoveTracker[id+1] = 1
        end
    end
end

local ffrg_onFinalEffectStart = function(mission, pawn, weaponId, p1, p2, p3)
    if weaponId ~= "Move" then
        local id = pawn:GetId()
        if mission == Mission_Test then
            patientDispatch(pawn)
        elseif id >= 0 and id <= 2 and GAME.ffrg_MoveTracker and GAME.ffrg_MoveTracker[id+1] == 0 then
            patientDispatch(pawn)
            GAME.ffrg_MoveTracker[id+1] = 1
        end
    end
end

local function PatientContingency()
    GAME.ffrg_MoveTracker = GAME.ffrg_MoveTracker or {0,0,0}
    for id = 0, 2 do
        if Board:GetPawn(id) then
            local pawn = Board:GetPawn(id)
            if GAME.ffrg_MoveTracker[id+1] == 0 and not pawn:IsDead() then
                patientDispatch(pawn)
            end
        end
    end
    GAME.ffrg_MoveTracker = {0,0,0}
end

EXCL = {"GetAmbience", "GetBonusStatus", "BaseUpdate", "UpdateMission", "GetCustomTile", "GetDamage", "GetTurnLimit", "BaseObjectives", "UpdateObjectives",}

local function ffrg_SubscribePreEnv()
    for i,v in pairs(Mission) do
        if type(v) == 'function' then
            local oldfn = v
            Mission[i] = function(...)
                if not list_contains(_G["EXCL"], i) then
                    if i == "IsEnvironmentEffect" and GAME.ffrg_MoveCycle then
                        PatientContingency()
                        GAME.ffrg_MoveCycle = false
                    end
                end
                return oldfn(...)
            end
        end
    end
end

local ffrg_onNextTurn = function(mission)
    if Game:GetTeamTurn() == TEAM_PLAYER then
        GAME.ffrg_MoveCycle = true
        GAME.ffrg_MoveTracker = {0,0,0}
        for id = 0, 2 do
            if Board:GetPawn(id) then
                local pawn = Board:GetPawn(id)
                if not pawn:IsDead() then
                    ffrg_PilotFactory.events.onCyclicalTrigger:dispatch(pawn)
                end
            end
        end
    end
end

local ffrg_onMissionStart = function(mission)
    GAME.ffrg_MoveCycle = false
    GAME.ffrg_MoveTracker = {1,1,1}
    for id = 0, 2 do
        if Board:GetPawn(id) then
            local pawn = Board:GetPawn(id)
            ffrg_PilotFactory.events.onStarterTrigger:dispatch(pawn)
            ffrg_PilotFactory.events.onCyclicalTrigger:dispatch(pawn)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_PilotFactory or ( modApi:isVersion(ffrg_PilotFactory.version, VERSION) and ffrg_PilotFactory.version ~= VERSION ) then

 --[[     Library    ]] ffrg_PilotFactory = ffrg_PilotFactory or {}
 --[[     Version    ]] ffrg_PilotFactory.version = VERSION
 --[[ Initialization ]] ffrg_PilotFactory.initialized = false

 --[[    Overseer    ]] ffrg_PilotFactory.events = {}
 --[[      Event     ]] ffrg_PilotFactory.events.onPatientTrigger = Event()
 --[[      Event     ]] ffrg_PilotFactory.events.onResetTrigger = Event()
 --[[      Event     ]] ffrg_PilotFactory.events.onStarterTrigger = Event()
 --[[      Event     ]] ffrg_PilotFactory.events.onCyclicalTrigger = Event()

 --[[     Global     ]] ffrg_PilotFactory.Fabricate = Fabricate
 --[[     Global     ]] ffrg_PilotFactory.Ability = Ability

end
local function ffrg_onModsInitialized()
if ffrg_PilotFactory.version == VERSION and not ffrg_PilotFactory.initialized then

 --[[     Library    ]] ttrg_PilotFactory = ttrg_PilotFactory or {}
 --[[ Initialization ]] ffrg_PilotFactory.initialized = true

 --[[  Subscription  ]] modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
 --[[  Subscription  ]] modapiext.events.onPawnMoveEnd:subscribe(ffrg_onPawnMoveEnd)
 --[[  Subscription  ]] modapiext.events.onPawnUndoMove:subscribe(ffrg_onPawnUndoMove)
 --[[  Subscription  ]] modapiext.events.onSkillStart:subscribe(ffrg_onSkillStart)
 --[[  Subscription  ]] modapiext.events.onFinalEffectStart:subscribe(ffrg_onFinalEffectStart)
 --[[  Subscription  ]] modApi.events.onFrameDrawn:subscribe(ffrg_onFrameDrawn)
 --[[  Subscription  ]] modApi.events.onNextTurn:subscribe(ffrg_onNextTurn)
 --[[  Subscription  ]] modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
 --[[  Subscription  ]] ffrg_SubscribePreEnv()

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_PilotFactory


--////////////////////////////////--
