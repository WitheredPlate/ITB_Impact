--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--    Spawning Control Library    --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.1.0"

--## A library of functions to control the vanilla data the game uses to control how, when, and how many different enemies appear.
--## Mostly dedicated towards controlling exclusions, which prevent enemies and other elements from appearing with other enemies and elements.


----------------------
-- Basic Exclusions --
----------------------

--## Basic exclusions are defined by a list of elements (with a minimum size of 2) that are all exclusive with each other.
--## In practice, this means that at maximum, only a single one of the elements in a basic exclusion can appear at once.
--## For example, due to the vanilla Summoners Exclusion, you can never find Spiders and Blobbers together on one island, or Spiders and Plasmodias. At worst, you will only see one of the 3.


-----------------------
-- Myriad Exclusions --
-----------------------

--## Myriad exclusions are defined by 2 lists of elements (with minimum sizes of 1) under which every element of one list is exclusive with every element of the other, but elements in the 2 lists are not made exclusive with other elements in the same list.
--## In practice, this is most often used to create exclusions to prevent a number of elements from appearing with a certain problematic element without otherwise interfering with the former elements.
--## For example (though technically it is a basic exclusion with exclusion tails), due to the vanilla Burrowers Exclusion, Burrowers can never be found with Blast Psions or A.C.I.D. Emergence missions, but the latter two can still be found with each other.
--## Technically, myriad exclusions can always be represented by multiple basic exclusions. However, doing so doesn't allow for cross-mod flexibility and can easily reach absurd numbers of exclusions.


---------------------
-- Exclusion Tails --
---------------------

--## Exclusion tails are an optional list of elements that can accompany exclusions. All elements in the list are exclusive with all elements of the parent exclusion
-- For basic exclusions, in practice, exclusion tails have an effect that's extremely similar to a myriad exclusion, except the elements of the basic exclusion are still exclusive with each other.
-- For example, were we to add a tail to the vanilla Webber exclusion, every element in the tail would never appear with any webbers, including those added later by other mods
-- For myriad exclusions, in practice, exclusion tails function as a tertiary category in addition to the two of the myriad exclusion, allowing for more precise exclusion manipulation.


--------------------------
-- Other Exclusion Info --
--------------------------

--## Please use a custom prefix for the identifier when adding your own sets to avoid accidental overlap. For example, mine is "ffrg_"
--## The exception to the above rule is if multiple individuals decide they wish to coordinate to create a new category that contains entities from across multiple mods.

--## Basic exclusions are stored as indentifier = index, where the index is that exclusion's index in the global exclusiveElements array.
--## Myriad exclusions are stored as indentifier = exclusion, where the exclusion is the entirety of that exclusion's data.
--## Because myriad exclusions are stored as data rather than a reference and are represented as multiple arrays in exclusiveElements rather than one, they cannot easily be altered through methods outside of this lib and can never cleanly have elements removed.

--## When creating myriad exclusions, the convention is to make the first list the one that contains the problematic elements or the elements that have something in common.
--## For example, were a myriad exclusion designed to prevent units with a certain trait from appearing with certain elements, the units with the trait would be in list 1.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_SpawnController.AppendSpawner
-- ( config [Table] )
-- Sets the spawning data on the enemy specified by string to the specified data, with each option explained below.
-- identifier [String] indicates the identifier of the pawn type(s) for which the data is being appended.
-- list [String] indicates which list to append the spawning to.
    -- "all" is the default choice, and will append the pawn to the lists for all 4 islands (but not the finale)
    -- "all_finale" will append the pawn to the lists for all 4 islands and the list for the finale
    -- "archive" is list for Archive Inc.
    -- "rst" is list for R.S.T. Terraforming.
    -- "pinnacle" is list for Pinnacle Robotics.
    -- "detritus" is list for Detritus Disposal.
    -- "finale" is list for the Vek Hive.
    -- Other lists may be chosen, though they will not be used by default.
    -- Any empty string will not append to any lists.
-- category [String] indicates what category the pawn should be added to for spawning.
    -- "Core" is the category of the 3 standard Vek that are chosen for each island.
    -- "Unique" is the category of the 1-2 special Vek that are chosen for island 2 onwards.
    -- "Leaders" is the category of the single Psion that is chosen for each island.
    -- "Bots" is the category of the bots that spawn on Pinnacle Robotics.
    -- Other categories may be chosen, though they have no function by default.
    -- Being unspecified will not append the non-leader variation of the pawn to any lists.
-- leader [Boolean] indicates whether spawning data should be appended for the leader version of the pawn. Defaults to false.
-- leader_override [String] indicates a nonstandard string identifer for the leader mission that should be used instead of the standard formulation.
-- weak [Boolean] indicates whether the pawn should be considered 'weak' for spawning purposes.
    -- In general, all Vek that are of the "Core" category are weak, and those of the "Unique" category are not.
    -- Defaults to true if the category is specified as "Core" and false if the category is specified as "Unique."
-- max_pawns [Integer] indicates how many pawns of this type should be allowed to spawn per mission.
    -- For pawns with the "Core" category, this limit will regularly be bypassed when all other pawn caps are reached.
    -- Defaults to 1 for pawns of category "Leaders"
-- max_level [Integer] indicates the maximum allowed level for the pawn, where standard is level 1 and alphas are level 2.
    -- In general, only used for Psions because "Alpha Psions" do not exist.
    -- Defaults to 1 for pawns of category "Leaders"
-- flying [Boolean] indicates whether the pawn should be prevented from appearing with other pawns with this specified as true.
    -- In general, only "Core" or "Unique" Vek that have Flying should have this set to true.
-- lock [Integer] prevents the pawn from spawning until the player has unlocked this amount of islands.
-- leader_lock [Integer] prevents the leader variant of the pawn from spawning until the player has unlocked this amount of islands.
-- boom [Boolean] indicates whether there is a boom variation of the pawn that should be added to the Boom Bot mission.
    -- Only works for pawns of category "Bots."

--## ffrg_SpawnController.AppendBasicExclusion
-- ( identifier [String],  exclusion [Array or String] )
-- Merges the specified exclusion data into the existing basic exclusion that has the specified identifier.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present.

--## ffrg_SpawnController.AddBasicExclusion
-- ( identifier [String],  exclusion [Array or String] )
-- Creates a new basic exclusion with the specified identifier that can be referenced or appended to later.
-- If a basic exclusion with the specified identifier already exists, defaults to the behavior of AppendBasicExclusion.
-- If a myriad exclusion with the specified identifier already exists, does nothing.
-- Optionally also appends the specified exclusion data immediately upon creation.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present in the event of a behavior defaulting.

--## ffrg_SpawnController.AppendMyriadExclusion
-- ( identifier [String],  exclusion1 [Array or String],  exclusion2 [Array or String] )
-- Merges the specified exclusion data into the existing myriad exclusion that has the specified identifier.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present.

--## ffrg_SpawnController.AddMyriadExclusion
-- ( identifier [String],  exclusion1 [Array or String],  exclusion2 [Array or String] )
-- Creates a new myriad exclusion with the specified identifier that can be referenced or appended to later.
-- If a myriad exclusion with the specified identifier already exists, defaults to the behavior of AppendMyriadExclusion.
-- If a basic exclusion with the specified identifier already exists, does nothing.
-- Optionally also appends the specified exclusion data immediately upon creation.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present in the event of a behavior defaulting.

--## ffrg_SpawnController.ExclusionTail
-- ( identifier [String],  exclusion [Array or String],  myriad [Boolean, optional] )
-- Creates a new exclusion tail or adds to an existing one for the specified identifier that can be referenced or appended to later.
-- If no exclusion with the specified identifier exists, creates an empty exclusion with the specified identifier.
-- The created exclusion is of myriad type if myriad is true, and of basic type otherwise.
-- Accepts both single elements as a string or an array of said elements and does not add elements that are already present if the tail already exists.

--## ffrg_SpawnController.ListExclusions
-- ( log [Boolean] )
-- Lists all exclusions manipulated by SpawnController, in addition to their tails, in a human-readable manner.
-- When log is set to false, the message is returned in array rather than logged in the console.


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


------------------------
-- Vanilla Exclusions --
------------------------

--## Use these names to reference the 5 vanilla exclusions, which are all basic exclusions.

local ffrg_ExclusionData = (ffrg_SpawnController and ffrg_SpawnController.ExclusionData) or {

  --        Identifier        = Index --                                  Description                                  --              Contents             --
  ------------------------------------------------------------------------------------------------------------------------------------------------------------
              webbers         =   1,  --  Vek that cast immobilizing webs. (Does not include Spiders. Honestly should) --       Scorpions and Leapers       --
             summoners        =   2,  --                       Non-Psion Vek that spawn more Vek.                      -- Spiders, Blobbers, and Plasmodias --
             arachnids        =   3,  --                          Vek that spawn spiderlings.                          --    Spiders and Arachnid Psions    --
             artillery        =   5,  --               Vek that fire arcing, damaging artillery attacks.               --     Scarabs, Crabs, and Moths     --
             burrowers        =   4   --     Vek that have the Stable trait and burrow through the ground to travel    --             Burrowers             --
}

local ffrg_ExclusionTails = (ffrg_SpawnController and ffrg_SpawnController.ExclusionTails) or {}

local ffrg_BoomBotsBank = (ffrg_SpawnController and ffrg_SpawnController.BoomBotsBank) or {}

local function ttrg_ListRummage(list, element)
    for _, entity in ipairs(list) do
        if entity == element then
            return true
        end
    end
    return false
end


local function ttrg_ExclusionDistribute(exclusion, element)
    for _, entity in ipairs(exclusion) do
        table.insert(exclusiveElements, {element, entity})
        -- I could add optimization to prevent duplicate sets. Could cause hangs on launch in extreme cases tho.
    end
end


local function ttrg_SearchExclusion(identifier)
    for id, exclusion in pairs(ffrg_ExclusionData) do
        if id == identifier then
            if type(exclusion) == "table" then
                return exclusion
            else
                return exclusiveElements[exclusion]
            end
        end
    end
end


local function ttrg_SearchExclusionTail(identifier)
    for id, tail in pairs(ffrg_ExclusionTails) do
        if id == identifier then
            return tail
        end
    end
end


local function ttrg_AddElement(exclusion, element, tail)
    table.insert(exclusion, element)
    if tail and tail ~= {} then
        ttrg_ExclusionDistribute(tail,element)
    end
end


local ffrg_NonStandardIslandLists = {
    "Meridia"
}


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_AppendSpawnerOld(identifier, weak, max_pawns, flying, max_level)
    if flying and flying == true then
        FlyingEnemies[identifier] = true
    end
    if weak and weak == true then
        WeakPawns[identifier] = true
    end
    if max_pawns and max_pawns > 0 then
        Spawner.max_pawns[identifier] = max_pawns
    end
    if max_level and max_level > 0 then
        Spawner.max_level[identifier] = max_level
    end
end


local function ffrg_AppendSpawner(config, ...)
    if type(config) == "string" then ffrg_AppendSpawnerOld(config, ...) return end
    config = config or {}
    if config.identifier == nil or config.identifier == "" then return end

    if config.weak == nil then
        if config.category and config.category == "Core" then config.weak = true end
        if config.category and config.category == "Unique" then config.weak = false end
    end
    WeakPawns[config.identifier] = config.weak
    if config.flying then
        FlyingEnemies[identifier] = true
    end
    if ( config.max_pawns and config.max_pawns > 0 ) or config.category and config.category == "Leaders" then
        Spawner.max_pawns[config.identifier] = config.max_pawns or 1
    end
    if ( config.max_level and config.max_level > 0 ) or config.category and config.category == "Leaders" then
        Spawner.max_level[config.identifier] = config.max_level or 1
    end

    config.list = config.list or "all"
    if config.list ~= "" then
        if config.category then
            if config.list == "all" or config.list == "all_finale" then
                for id, list in pairs(easyEdit.enemyList._children) do
                    if not list_contains(ffrg_NonStandardIslandLists, id) then
                        if id == "finale" then
                            if config.list == "all_finale" then
                                list:addEnemy(config.identifier, "Enemies")
                            end
                        else
                            list:addEnemy(config.identifier, config.category)
                        end
                    end
                end
            else
                local list = easyEdit.enemyList:get(config.list)
                list:addEnemy(config.identifier, config.category)
            end
            if config.lock then
                IslandLocks[config.identifier] = config.lock
            end
        end
        if config.leader then
            local mission_target = config.leader_override or "Mission_"..config.identifier.."Boss"
            if config.list == "all" or config.list == "all_finale" then
                for id, list in pairs(easyEdit.bossList._children) do
                    if not list_contains(ffrg_NonStandardIslandLists, id) then
                        if config.list == "all_finale" or ( id ~= "finale1" and id ~= "finale2" ) then
                            list:addBoss(mission_target)
                        end
                    end
                end
            else
                if config.list == "finale" then
                    local list1 = easyEdit.bossList:get("finale1")
                    list1:addBoss(mission_target)
                    local list2 = easyEdit.bossList:get("finale2")
                    list2:addBoss(mission_target)
                else
                    local list = easyEdit.bossList:get(config.list)
                    list:addBoss(mission_target)
                end
            end
            if config.leader_lock then
                IslandLocks[mission_target] = config.leaderLock
            end
            BossesList[config.identifier.."Boss"] = true
        end
    end

    if config.category and config.category == "Bots" and config.boom then
        ffrg_AppendBoomBots(config.identifier.."1_Boom")
    end
end


function ffrg_AppendBoomBots(data)
    if type(data) == "string" then
        if not ttrg_ListRummage(ffrg_BoomBotsBank,data) and data ~= "Snowtank1_Boom" and data ~= "Snowlaser1_Boom" and data ~= "Snowart1_Boom" then
            table.insert(ffrg_BoomBotsBank,data)
        end
    else
        for _, element in ipairs(data) do
            if not ttrg_ListRummage(ffrg_BoomBotsBank,element) and element ~= "Snowtank1_Boom" and element ~= "Snowlaser1_Boom" and element ~= "Snowart1_Boom" then
                table.insert(ffrg_BoomBotsBank,element)
            end
        end
    end
end


local function ffrg_AppendBasicExclusion(identifier, exclusion)
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    if set and ( set == {} or type(set[1]) == "string" ) then -- Checking that the target exclusion is of basic type
        if type(exclusion) == "string" then
            if not ttrg_ListRummage(set, exclusion) then
                ttrg_AddElement(set, exclusion, tail)
            end
        elseif type(exclusion) == "table" and exclusion ~= {} then
            for _, entity in ipairs(exclusion) do
                if not ttrg_ListRummage(set, entity) then
                    ttrg_AddElement(set, entity, tail)
                end
            end
        else
            return
        end
    end
end


local function ffrg_AddBasicExclusion(identifier, exclusion)
    exclusion = exclusion or {}
    if ttrg_SearchExclusion(identifier) then -- Defaulting behavior
        ffrg_AppendBasicExclusion(identifier,exclusion)
        return
    end
    if type(exclusion) == "table" then
        table.insert(exclusiveElements, exclusion)
    else
        table.insert(exclusiveElements, {exclusion})
    end
    ffrg_ExclusionData[identifier] = #exclusiveElements
end


local function ffrg_AppendMyriadExclusion(identifier, exclusion1, exclusion2)
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    if set and type(set[1]) == "table" then -- Checking that the target exclusion is of myriad type
        if exclusion1 then
            if type(exclusion1) == "string" then
                if not ttrg_ListRummage(set[1],exclusion1) then
                    ttrg_ExclusionDistribute(set[2],exclusion1)
                    ttrg_AddElement(set[1], exclusion1, tail)
                end
            elseif type(exclusion1) == "table" and exclusion1 ~= {} then
                for _, entity in ipairs(exclusion1) do
                    if not ttrg_ListRummage(set[1],entity) then
                        ttrg_ExclusionDistribute(set[2],entity)
                        ttrg_AddElement(set[1], entity, tail)
                    end
                end
            end
        end
        if exclusion2 then
            if type(exclusion2) == "string" then
                if not ttrg_ListRummage(set[2],exclusion2) then
                    ttrg_ExclusionDistribute(set[1],exclusion2)
                    ttrg_AddElement(set[2], exclusion2, tail)
                end
            elseif type(exclusion2) == "table" and exclusion2 ~= {} then
                for _, entity in ipairs(exclusion2) do
                    if not ttrg_ListRummage(set[2],entity) then
                        ttrg_ExclusionDistribute(set[1],entity)
                        ttrg_AddElement(set[2], entity, tail)
                    end
                end
            end
        end
    end
end


local function ffrg_AddMyriadExclusion(identifier, exclusion1, exclusion2)
    exclusion1 = exclusion1 or {}
    exclusion2 = exclusion2 or {}
    if ttrg_SearchExclusion(identifier) then -- Defaulting behavior
        ffrg_AppendMyriadExclusion(identifier,exclusion1, exclusion2)
        return
    end
    local exclusion = {}
    if type(exclusion1) == "table" then
        table.insert(exclusion, exclusion1)
    else
        table.insert(exclusion, {exclusion1})
    end
    if type(exclusion2) == "table" then
        table.insert(exclusion, exclusion2)
    else
        table.insert(exclusion, {exclusion2})
    end
    if exclusion ~= {{},{}} then
        for _, entity in ipairs(exclusion[1]) do
            ttrg_ExclusionDistribute(exclusion[2],entity)
        end
    end
    ffrg_ExclusionData[identifier] = exclusion
end


local function ffrg_ExclusionTail(identifier, exclusion, myriad)
    exclusion = exclusion or {}
    myriad = myriad or false
    local set = ttrg_SearchExclusion(identifier)
    local tail = ttrg_SearchExclusionTail(identifier)
    local content
    if type(exclusion) == "string" then
        content = {exclusion}
    else
        content = exclusion
    end
    if not set then -- Creating a new empty exclusion if none exists
        if myriad then
            ffrg_AddMyriadExclusion(identifier, nil, nil)
        else
            ffrg_AddBasicExclusion(identifier, nil)
        end
        set = ttrg_SearchExclusion(identifier)
    elseif type(set[1]) == "table" then -- Checking if the target exclusion is of myriad type
        myriad = true
    end
    local clear = false
    if set ~= {} and set ~= {{},{}} then clear = false end
    if tail then
        for _, entity in ipairs(content) do
            table.insert(tail, entity)
            if not clear then
                if myriad then
                    ttrg_ExclusionDistribute(set[1],entity)
                    ttrg_ExclusionDistribute(set[2],entity)
                else
                    ttrg_ExclusionDistribute(set,entity)
                end
            end
        end
    else
        ffrg_ExclusionTails[identifier] = content
        for _, entity in ipairs(content) do
            if not clear then
                if myriad then
                    ttrg_ExclusionDistribute(set[1],entity)
                    ttrg_ExclusionDistribute(set[2],entity)
                else
                    ttrg_ExclusionDistribute(set,entity)
                end
            end
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//      Boom Bot Control      //--
--////////////////////////////////--


--## Altering the "Destroy all Boom Bots" mission to allow custom boom bots to appear within it.

function Mission_BoomBots:StartMission()
	self.BoomBots = {}
	local potential_bots = {"Snowtank1_Boom", "Snowlaser1_Boom", "Snowart1_Boom"}

	for i,v in ipairs(ffrg_BoomBotsBank) do
        table.insert(potential_bots,v)
    end

	for i = 1, self.RobotStart do
		local loc = Board:AddPawn(random_element(potential_bots))
		self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
	end

	local loc = Board:AddPawn(random_element(potential_bots))
	Board:GetPawn(loc):SetFrozen(true)
	self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
	loc = Board:AddPawn(random_element(potential_bots))
	Board:GetPawn(loc):SetFrozen(true)
	self.BoomBots[#self.BoomBots + 1] = Board:GetPawn(loc):GetId()
end


--////////////////////////////////--





--////////////////////////////////--
--//        Debug Listing       //--
--////////////////////////////////--


local function ffrg_ListExclusions(log)
    log = log or true
    local array
    for identifier, i in pairs(ffrg_ExclusionData) do
        local form
        local data
        if type(i) == "table" then
            form = "myriad"
            data = i[1]
        else
            form = "basic"
            data = exclusiveElements[i]
        end
        local output = identifier.." - "..form.." :  ( "
        for j, element in ipairs(data) do
            if _G[element.."1"] then
                output = output.._G[element.."1"].Name
            else
                output = output.."Mission ("..element:gsub("Mission_","")..")"
            end
            if j ~= #data then
                output = output..", "
            end
        end
        output = output.." )"
        if form == "myriad" then
            output = output.."  vs  ( "
            for j, element in ipairs(i[2]) do
                if _G[element.."1"] then
                    output = output.._G[element.."1"].Name
                else
                    output = output.."Mission ("..element:gsub("Mission_","")..")"
                end
                if j ~= #i[2] then
                    output = output..", "
                end
            end
            output = output.." )"
        end
        if log then
            LOG(output)
        else
            table.insert(array, output)
        end
        tail = ttrg_SearchExclusionTail(identifier)
        if tail then
            local output2 = "       "..identifier.." - tail :  ( "
            for j, element in ipairs(tail) do
                if _G[element.."1"] then
                    output2 = output2.._G[element.."1"].Name
                else
                    output2 = output2.."Mission ("..element:gsub("Mission_","")..")"
                end
                if j ~= #tail then
                    output2 = output2..", "
                end
            end
            output2 = output2.." )"
            if log then
                LOG(output2)
            else
                table.insert(array, output2)
            end
        end
    end
    if not log then
        return array
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_SpawnController or ( modApi:isVersion(ffrg_SpawnController.version, VERSION) and ffrg_SpawnController.version ~= VERSION ) then

 --[[     Library    ]] ffrg_SpawnController = ffrg_SpawnController or {}
 --[[     Version    ]] ffrg_SpawnController.version = VERSION
 --[[ Initialization ]] ffrg_SpawnController.initialized = false

 --[[     Global     ]] ffrg_SpawnController.ExclusionData = ffrg_ExclusionData
 --[[     Global     ]] ffrg_SpawnController.ExclusionTails = ffrg_ExclusionTails
 --[[     Global     ]] ffrg_SpawnController.BoomBotsBank = ffrg_BoomBotsBank
 --[[     Global     ]] ffrg_SpawnController.AppendSpawner = ffrg_AppendSpawner
 --[[     Global     ]] ffrg_SpawnController.AppendBoomBots = ffrg_AppendBoomBots
 --[[     Global     ]] ffrg_SpawnController.AppendBasicExclusion = ffrg_AppendBasicExclusion
 --[[     Global     ]] ffrg_SpawnController.AddBasicExclusion = ffrg_AddBasicExclusion
 --[[     Global     ]] ffrg_SpawnController.AppendMyriadExclusion = ffrg_AppendMyriadExclusion
 --[[     Global     ]] ffrg_SpawnController.AddMyriadExclusion = ffrg_AddMyriadExclusion
 --[[     Global     ]] ffrg_SpawnController.ExclusionTail = ffrg_ExclusionTail
 --[[     Global     ]] ffrg_SpawnController.NonStandardIslandLists = ffrg_NonStandardIslandLists

end
local function ffrg_onModsInitialized()
if ffrg_SpawnController.version == VERSION and not ffrg_SpawnController.initialized then

 --[[     Library    ]] ttrg_SpawnController = ttrg_SpawnController or {}
 --[[ Initialization ]] ffrg_SpawnController.initialized = true

 --[[     Global     ]] ffrg_SpawnController.ListExclusions = ffrg_ListExclusions

 --[[   Alteration   ]] local temp_burrowers = {} for _, element in ipairs(exclusiveElements[4]) do if element ~= "Jelly_Explode" and element ~= "Mission_Acid" then table.insert(temp_burrowers, element) end end exclusiveElements[4] = temp_burrowers ffrg_ExclusionTail("burrowers", {"Jelly_Explode", "Mission_Acid"}, false)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_SpawnController


--////////////////////////////////--
