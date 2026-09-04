--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = mod_loader.mods[modApi.currentMod].resourcePath

local files = {
    "Squad_Architects_1.png",
    "Squad_Architects_2.png",
    "Squad_Architects_3.png",
    "Squad_Architects_1_Gray.png",
    "Squad_Architects_2_Gray.png",
    "Squad_Architects_3_Gray.png",
    "Squad_Frenzy_1.png",
    "Squad_Frenzy_2.png",
    "Squad_Frenzy_3.png",
    "Squad_Frenzy_1_Gray.png",
    "Squad_Frenzy_2_Gray.png",
    "Squad_Frenzy_3_Gray.png",
    "Squad_Colossi_1.png",
    "Squad_Colossi_2.png",
    "Squad_Colossi_3.png",
    "Squad_Colossi_1_Gray.png",
    "Squad_Colossi_2_Gray.png",
    "Squad_Colossi_3_Gray.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/achievements/".. file, path .."img/achievements/".. file)
end


--////////////////////////////////--





--////////////////////////////////--
--//        Achievements        //--
--////////////////////////////////--


local achievements = {
    ffrg_Bottomless_Munitions = modApi.achievements:add{
        id = "ffrg_Bottomless_Munitions",
        name = "Bottomless Munitions",
        tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission.",
        image = path.."img/achievements/Squad_Architects_1.png",
        objective = 1,
        squad = "ffrg_Architects",
    },
    ffrg_The_Sun = modApi.achievements:add{
        id = "ffrg_The_Sun",
        name = "The Sun",
        tooltip = "Deal at least 14 damage to Enemy Units with one shot of the Prism Laser.",
        image = path.."img/achievements/Squad_Architects_2.png",
        objective = 1,
        squad = "ffrg_Architects",
    },
    ffrg_A_Veritable_Army = modApi.achievements:add{
        id = "ffrg_A_Veritable_Army",
        name = "A Veritable Army",
        tooltip = "Have 9 or more Allied, Controllable Units on the field at once.",
        image = path.."img/achievements/Squad_Architects_3.png",
        objective = 1,
        squad = "ffrg_Architects",
    },
    ffrg_Ceaseless = modApi.achievements:add{
        id = "ffrg_Ceaseless",
        name = "Ceaseless",
        tooltip = "Revive Mechs from destruction 15 times in one Island.",
        image = path.."img/achievements/Squad_Frenzy_1.png",
        objective = 1,
        squad = "ffrg_Frenzy",
    },
    ffrg_A_Light_Tan = modApi.achievements:add{
        id = "ffrg_A_Light_Tan",
        name = "A Light Tan",
        tooltip = "Take 6 Fire Damage to Mechs in one Mission.",
        image = path.."img/achievements/Squad_Frenzy_2.png",
        objective = 1,
        squad = "ffrg_Frenzy",
    },
    ffrg_Herculean_Toss = modApi.achievements:add{
        id = "ffrg_Herculean_Toss",
        name = "Herculean Toss",
        tooltip = "Toss 3 Enemy Units at once with Myriad Appendages.",
        image = path.."img/achievements/Squad_Frenzy_3.png",
        objective = 1,
        squad = "ffrg_Frenzy",
    },
    ffrg_Diffusion = modApi.achievements:add{
        id = "ffrg_Diffusion",
        name = "Diffusion",
        tooltip = "Deal 12 instances of damage to Enemies in a single turn.",
        image = path.."img/achievements/Squad_Colossi_1.png",
        objective = 1,
        squad = "ffrg_SeismicColossi",
    },
    ffrg_Imprisoned = modApi.achievements:add{
        id = "ffrg_Imprisoned",
        name = "Imprisoned",
        tooltip = "Competely immobilize an Enemy Unit on its turn using only terrain and Inanimate Units.",
        image = path.."img/achievements/Squad_Colossi_2.png",
        objective = 1,
        squad = "ffrg_SeismicColossi",
    },
    ffrg_A_Friend_Inside_You = modApi.achievements:add{
        id = "ffrg_A_Friend_Inside_You",
        name = "A Friend Inside You",
        tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game.",
        image = path.."img/achievements/Squad_Colossi_3.png",
        objective = 1,
        squad = "ffrg_SeismicColossi",
    }
}


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function isGame()
    return true
        and Game ~= nil
        and GAME ~= nil
end

local function isMission()
    local mission = GetCurrentMission()
    return true
        and isGame()
        and mission ~= nil
        and mission ~= Mission_Test
end

local function isMissionBoard()
    return true
        and isMission()
        and Board ~= nil
        and Board:IsTipImage() == false
end

function ffrg_Architects_SunGet()
    if not isMissionBoard() then
        return
    end

    if not GAME.additionalSquadData.squad == "ffrg_Architects" then
        return
    end

    if achievements.ffrg_The_Sun:isComplete() then
        return
    end

    achievements.ffrg_The_Sun:addProgress(1)
end

function ffrg_Frenzy_HerculeanGet()
    if not isMissionBoard() then
        return
    end

    if not GAME.additionalSquadData.squad == "ffrg_Frenzy" then
        return
    end

    if achievements.ffrg_Herculean_Toss:isComplete() then
        return
    end

    achievements.ffrg_Herculean_Toss:addProgress(1)
end

function ffrg_Colossi_TelefragAdd()
    if not isMissionBoard() then
        return
    end

    if not GAME.additionalSquadData.squad == "ffrg_SeismicColossi" then
        return
    end

    if achievements.ffrg_A_Friend_Inside_You:isComplete() then
        return
    end

    GAME.ffrg_TelefragCount = (GAME.ffrg_TelefragCount or 0) + 1
    if GAME.ffrg_TelefragCount >= 3 then
        achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game."
        achievements.ffrg_A_Friend_Inside_You:addProgress(1)
        GAME.ffrg_TelefragCount = nil
    else
        achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game.\n\nProgress: "..GAME.ffrg_TelefragCount.."/3"
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_onPostStartGame()
    GAME.ffrg_FireDamageCount = nil
    GAME.ffrg_RevivalCount = nil
    GAME.ffrg_AlliedUnitCount = nil
    GAME.ffrg_LimitedCount = nil
    GAME.ffrg_EnemyDealtDamageCount = nil
    GAME.ffrg_TelefragCount = nil
end


------------------
--  Architects  --
------------------

local function ffrg_AlliedUnitTally(mission)
    if isMissionBoard() and not achievements.ffrg_A_Veritable_Army:isComplete() then
        local ffrg_AlliedTally = 0
        for i = 0, 7 do
            for j = 0, 7  do
                local point = Point(i,j)
                if Board:IsPawnSpace(point) and Board:IsPawnTeam(point, TEAM_PLAYER) and Board:GetPawn(point):IsPowered() and not Board:GetPawn(point):IsDead() and not Board:GetPawn(point):IsNeutral() then
                    ffrg_AlliedTally = ffrg_AlliedTally + 1
                end
            end
        end
        GAME.ffrg_AlliedUnitCount = ffrg_AlliedTally
        if GAME.ffrg_AlliedUnitCount >= 9 then
            achievements.ffrg_A_Veritable_Army:addProgress(1)
            achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once."
            GAME.ffrg_AlliedUnitCount = nil
        else
            achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once.\n\nCurrent: "..GAME.ffrg_AlliedUnitCount.."/9"
        end
    end
end

local function ffrg_LimitedTest(mission, pawn, weaponId, skillEffect)
    if skillEffect.effect ~= nil and isMissionBoard() and not achievements.ffrg_Bottomless_Munitions:isComplete() and pawn then
        if pawn:IsMech() and pawn:IsWeaponPowered(weaponId) and pawn:GetWeaponCount() > 0 then
            for i = 1, pawn:GetWeaponCount() do
                if pawn:GetWeaponLimitedUses(i) > 0 and pawn:GetWeaponType(i) == weaponId then
                    skillEffect:AddScript([[
                        if GAME.ffrg_LimitedCount then
                            GAME.ffrg_LimitedCount = GAME.ffrg_LimitedCount + 1
                        else
                            GAME.ffrg_LimitedCount = 1
                        end
                    ]])
                end
            end
        end
    end
end

local function ffrg_LimitedRefresh(mission)
    if not achievements.ffrg_Bottomless_Munitions:isComplete() then
        if GAME.ffrg_LimitedCount and GAME.ffrg_LimitedCount >= 7 then
            achievements.ffrg_Bottomless_Munitions:addProgress(1)
            achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission."
            GAME.ffrg_LimitedCount = nil
        elseif GAME.ffrg_LimitedCount then
            achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission.\n\nProgress: "..GAME.ffrg_LimitedCount.."/7"
        end
    end
end

local function ffrg_onMissionEnd(mission)
    if not achievements.ffrg_A_Veritable_Army:isComplete() then
        GAME.ffrg_AlliedUnitCount = nil
        achievements.ffrg_A_Veritable_Army.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission."
    end
    if not achievements.ffrg_Bottomless_Munitions:isComplete() then
        GAME.ffrg_LimitedCount = nil
        achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission."
    end
end

local function ffrg_onMissionStart(mission)
    if not achievements.ffrg_Bottomless_Munitions:isComplete() then
        achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission.\n\nProgress: 0/7"
        GAME.ffrg_LimitedCount = 0
    end
    if not achievements.ffrg_A_Veritable_Army:isComplete() then
        achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once.\n\nCurrent: 3/9"
        GAME.ffrg_AlliedUnitCount = 3
    end
end


local ffrg_onResetTurn = function(mission)
    if not achievements.ffrg_Bottomless_Munitions:isComplete() then
        achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission.\n\nProgress: "..GAME.ffrg_LimitedCount or (0).."/7"
    end
    if not achievements.ffrg_A_Veritable_Army:isComplete() then
        achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once.\n\nCurrent: "..GAME.ffrg_AlliedUnitCount or (3).."/9"
    end
end

local ffrg_onSkillEnd = function(mission, pawn, weaponId, p1, p2)
    ffrg_AlliedUnitTally(mission)
    ffrg_LimitedRefresh(mission)
end

local ffrg_onQueuedSkillEnd = function(mission, pawn, weaponId, p1, p2)
    ffrg_AlliedUnitTally(mission)
    ffrg_LimitedRefresh(mission)
end

local ffrg_onFinalEffectEnd = function(mission, pawn, weaponId, p1, p2, p3)
    ffrg_AlliedUnitTally(mission)
    ffrg_LimitedRefresh(mission)
end

local ffrg_onQueuedFinalEffectEnd = function(mission, pawn, weaponId, p1, p2, p3)
    ffrg_AlliedUnitTally(mission)
    ffrg_LimitedRefresh(mission)
end

local ffrg_onSkillBuild = function(mission, pawn, weaponId, p1, p2, skillEffect)
    ffrg_LimitedTest(mission, pawn, weaponId, skillEffect)
end

local ffrg_onFinalEffectBuild = function(mission, pawn, weaponId, p1, p2, p3, skillEffect)
    ffrg_LimitedTest(mission, pawn, weaponId, skillEffect)
end


--------------
--  Frenzy  --
--------------

local function ffrg_onMissionEnd2(mission)
    if not achievements.ffrg_A_Light_Tan:isComplete() then
        GAME.ffrg_FireDamageCount = nil
        achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission."
    end
    if mission.BossPawn then
        if not achievements.ffrg_Ceaseless:isComplete() then
            GAME.ffrg_RevivalCount = nil
            achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one island"
        end
    end
end

local function ffrg_onMissionStart2(mission)
    if not achievements.ffrg_A_Light_Tan:isComplete() then
        GAME.ffrg_FireDamageCount = 0
        achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission.\n\nProgress: 0/7"
    end
    if mission.MapTags and #mission.MapTags > 0 and mission.MapTags[1] ~= "final_island" and not achievements.ffrg_Ceaseless:isComplete() then
        GAME.ffrg_RevivalCount = 0
        achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island.\n\nProgress: "..GAME.ffrg_RevivalCount.."/15"
    end
end

local function ffrg_onPostIslandSelection()
    if not achievements.ffrg_Ceaseless:isComplete() then
        GAME.ffrg_RevivalCount = 0
        achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island.\n\nProgress: "..GAME.ffrg_RevivalCount.."/15"
    end
end


local ffrg_onResetTurn2 = function(mission)
    if not achievements.ffrg_A_Light_Tan:isComplete() then
        achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission.\n\nProgress: "..GAME.ffrg_FireDamageCount or (0).."/6"
    end
    if not achievements.ffrg_Ceaseless:isComplete() then
        achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island.\n\nProgress: "..( achievements.ffrg_Ceaseless:getProgress() + GAME.ffrg_RevivalCount or 0 ).."/15"
    end
end

local function ffrg_onPawnRevived(mission, pawn)
    if pawn and pawn:IsMech() and isMissionBoard() and not achievements.ffrg_Ceaseless:isComplete() then
        GAME.ffrg_RevivalCount = GAME.ffrg_RevivalCount + 1
        local progress = achievements.ffrg_Ceaseless:getProgress()
        if progress + GAME.ffrg_RevivalCount < 15 then
            achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island.\n\nProgress: "..GAME.ffrg_RevivalCount.."/15"
        else
            achievements.ffrg_Ceaseless:addProgress(1)
            achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island."
            GAME.ffrg_RevivalCount = nil
        end
    end
end

local ffrg_ignitedUnits = {
    false,
    false,
    false
}

local function ffrg_onPawnDamaged(mission, pawn, damageTaken)
    local id = pawn:GetId()
    if damageTaken ~= 1 or id > 2 then return end
    if ffrg_ignitedUnits[id] == true then
        ffrg_ignitedUnits[id] = false
        GAME.ffrg_FireDamageCount = ( GAME.ffrg_FireDamageCount or 0 ) + 1
        if GAME.ffrg_FireDamageCount >= 6 then
            achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission."
            achievements.ffrg_A_Light_Tan:addProgress(1)
            GAME.ffrg_FireDamageCount = nil
        else
            achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission.\n\nProgress: "..GAME.ffrg_FireDamageCount.."/6"
        end
    end
end

local function ffrg_TallyFire()
    if isMissionBoard() and not achievements.ffrg_A_Light_Tan:isComplete() then
        for id = 0,2 do
            if Board:GetPawn(id) and Board:GetPawn(id):IsFire() then
                ffrg_ignitedUnits[id] = true
            end
        end
    end
end


-----------------------
--  Seismic Colossi  --
-----------------------

function ffrg_onPawnDamaged2(mission, pawn, damageTaken)
    if isMissionBoard() and not achievements.ffrg_Diffusion:isComplete() and Game:GetTeamTurn() == TEAM_PLAYER and damageTaken > 0 and pawn:GetTeam() == TEAM_ENEMY then
        GAME.ffrg_EnemyDealtDamageCount = ( GAME.ffrg_EnemyDealtDamageCount or 0 ) + 1
        if GAME.ffrg_EnemyDealtDamageCount >= 12 then
            achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn."
            achievements.ffrg_Diffusion:addProgress(1)
            GAME.ffrg_EnemyDealtDamageCount = nil
        else
            achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn.\n\nProgress: "..GAME.ffrg_EnemyDealtDamageCount.."/12"
        end
    end
end

local function ffrg_onMissionEnd3(mission)
    if not achievements.ffrg_Diffusion:isComplete() then
        GAME.ffrg_EnemyDealtDamageCount = nil
        achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn."
    end
end

local function ffrg_onMissionStart3(mission)
    if not achievements.ffrg_Diffusion:isComplete() then
        GAME.ffrg_EnemyDealtDamageCount = 0
        achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn.\n\nProgress: 0/12"
    end
end

local actedIds = {}

local function ffrg_onNextTurn(mission)
    if not achievements.ffrg_Imprisoned:isComplete() then
        actedIds = {}
    end
    if not achievements.ffrg_Diffusion:isComplete() and Game:GetTeamTurn() == TEAM_PLAYER then
        GAME.ffrg_EnemyDealtDamageCount = 0
        achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn.\n\nProgress: 0/12"
    end
end

local function getEnemyPawnByType(pawnType)
    if isMissionBoard() then
        local pawns = Board:GetPawns(TEAM_ENEMY)
        local matches = {}
        if pawns:size() > 0 then
            for i = 1, pawns:size() do
                local id = pawns:index(i)
                local pawn = Board:GetPawn(id)
                if _G[pawn:GetType()] == pawnType then
                    table.insert(matches, pawn)
                end
            end
            local oldestPawn
            for _, pawn in ipairs(matches) do
                local id = pawn:GetId()
                local found = false
                for _, actedId in ipairs(actedIds) do
                    if actedId == id then
                        found = true
                    end
                end
                if not found then
                    if not oldestPawn then
                        oldestPawn = pawn
                    elseif id < oldestPawn:GetId() then
                        oldestPawn = pawn
                    end
                end
            end
            if oldestPawn then
                table.insert(actedIds, oldestPawn:GetId())
                return oldestPawn
            end
        end
    end
end

local function ffrg_onPawnFocused(pawnType)
    if isMissionBoard() and not achievements.ffrg_Imprisoned:isComplete() and Game:GetTeamTurn() == TEAM_ENEMY and not modApi.deployment.isDeploymentPhase() and pawnType.DefaultTeam == TEAM_ENEMY then
        local pawn = getEnemyPawnByType(pawnType)
        if pawn and pawn:GetTeam() == TEAM_ENEMY then
--             LOG("Fired for pawn "..pawn:GetMechName().." with "..pawn:GetHealth().." health at "..pawn:GetSpace():GetString())
--             Board:Ping(pawn:GetSpace(),GL_Color(255,255,255))
            local base = pawn:GetSpace()
            local imprisoned = true
            if base and not pawn:IsFlying() and not pawn:IsJumper() and not pawn:IsTeleporter() then
                for i = DIR_START, DIR_END do
                    local curr = base + DIR_VECTORS[i]
                    local terrain = Board:GetTerrain(curr)
                    local passable_terrain = true
                    local passable_unit = true
                    if terrain ~= TERRAIN_ROAD then -- performance boost
                        if ( terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA ) and not pawn:IsMassive() then
                            passable_terrain = false
                        elseif terrain == TERRAIN_HOLE then
                            passable_terrain = false
                        elseif ( terrain == TERRAIN_MOUNTAIN or ( Board:IsBuilding(curr) and Board:GetHealth(curr) > 0 ) ) and not pawn:IsBurrower() then
                            passable_terrain = false
                        end
                    end
                    if passable_terrain and Board:IsPawnSpace(curr) then
                        local other_pawn = Board:GetPawn(curr)
                        if other_pawn:IsNeutral() and not pawn:IsBurrower() then
                            passable_unit = false
                        end
                    end
                    if passable_terrain and passable_unit then
                        imprisoned = false
                        break
                    end
                end
                if imprisoned then
                    achievements.ffrg_Imprisoned:addProgress(1)
                end
            end
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


EXCL = {"GetAmbience", "GetBonusStatus", "BaseUpdate", "UpdateMission", "GetCustomTile", "GetDamage", "GetTurnLimit", "BaseObjectives", "UpdateObjectives",}

for i,v in pairs(Mission) do
    if type(v) == 'function' then
        local oldfn = v
        Mission[i] = function(...)
			if not list_contains(_G["EXCL"], i) then
                if i == "IsEnvironmentEffect" then
                    if Game and Game:GetSquad() == "Frenzy" then
                        ffrg_TallyFire()
                    end
				end
            end
            return oldfn(...)
        end
    end
end

local function ffrg_onSquadEnteredGame(squadId)
    if squadId == "ffrg_Architects" then
        modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)
        modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
        modapiext.events.onSkillEnd:subscribe(ffrg_onSkillEnd)
        modapiext.events.onQueuedSkillEnd:subscribe(ffrg_onQueuedSkillEnd)
        modapiext.events.onFinalEffectEnd:subscribe(ffrg_onFinalEffectEnd)
        modapiext.events.onQueuedFinalEffectEnd:subscribe(ffrg_onQueuedFinalEffectEnd)
        modapiext.events.onSkillBuild:subscribe(ffrg_onSkillBuild)
        modapiext.events.onFinalEffectBuild:subscribe(ffrg_onFinalEffectBuild)
        modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn)
        if GAME.ffrg_AlliedUnitCount then
            achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once.\n\nCurrent: "..GAME.ffrg_AlliedUnitCount.."/9"
        else
            achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once."
        end
        if GAME.ffrg_LimitedCount then
            achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission.\n\nProgress: "..GAME.ffrg_LimitedCount.."/7"
        else
            achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission."
        end
    elseif squadId == "ffrg_Frenzy" then
        modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd2)
        modApi.events.onMissionStart:subscribe(ffrg_onMissionStart2)
        modApi.events.onPostIslandSelection:subscribe(ffrg_onPostIslandSelection)
        modapiext.events.onResetTurn:subscribe(ffrg_onResetTurn2)
        modapiext.events.onPawnRevived:subscribe(ffrg_onPawnRevived)
        modapiext.events.onPawnDamaged:subscribe(ffrg_onPawnDamaged)
        if GAME.ffrg_FireDamageCount then
            achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission.\n\nProgress: "..GAME.ffrg_FireDamageCount.."/6"
        else
            achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission."
        end
        if GAME.ffrg_RevivalCount then
            achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island.\n\nProgress: "..GAME.ffrg_RevivalCount.."/15"
        else
            achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island."
        end
    elseif squadId == "ffrg_SeismicColossi" then
        modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd3)
        modApi.events.onMissionStart:subscribe(ffrg_onMissionStart3)
        modApi.events.onNextTurn:subscribe(ffrg_onNextTurn)
        modApi.events.onPawnFocused:subscribe(ffrg_onPawnFocused)
        modapiext.events.onPawnDamaged:subscribe(ffrg_onPawnDamaged2)
        if GAME.ffrg_EnemyDealtDamageCount then
            achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn.\n\nProgress: "..GAME.ffrg_EnemyDealtDamageCount.."/12"
        else
            achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn."
        end
        if GAME.ffrg_TelefragCount then
            achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game.\n\nProgress: "..GAME.ffrg_TelefragCount.."/3"
        else
            if achievements.ffrg_A_Friend_Inside_You:isComplete() then
                achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game."
            else
                achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game.\n\nProgress: 0/3"
            end
        end
    end
end

local function ffrg_onSquadExitedGame(squadId)
    if squadId == "ffrg_Architects" then
        modApi.events.onMissionEnd:unsubscribe(ffrg_onMissionEnd)
        modApi.events.onMissionStart:unsubscribe(ffrg_onMissionStart)
        modapiext.events.onSkillEnd:unsubscribe(ffrg_onSkillEnd)
        modapiext.events.onQueuedSkillEnd:unsubscribe(ffrg_onQueuedSkillEnd)
        modapiext.events.onFinalEffectEnd:unsubscribe(ffrg_onFinalEffectEnd)
        modapiext.events.onQueuedFinalEffectEnd:unsubscribe(ffrg_onQueuedFinalEffectEnd)
        modapiext.events.onSkillBuild:unsubscribe(ffrg_onSkillBuild)
        modapiext.events.onFinalEffectBuild:unsubscribe(ffrg_onFinalEffectBuild)
        modapiext.events.onResetTurn:unsubscribe(ffrg_onResetTurn)
        achievements.ffrg_A_Veritable_Army.tooltip = "Have 9 or more Allied, Controllable Units on the field at once."
        achievements.ffrg_Bottomless_Munitions.tooltip = "Use Mech Equipment that has limited uses 7 times within one Mission."
    elseif squadId == "ffrg_Frenzy" then
        modApi.events.onMissionEnd:unsubscribe(ffrg_onMissionEnd2)
        modApi.events.onMissionStart:unsubscribe(ffrg_onMissionStart2)
        modApi.events.onPostIslandSelection:unsubscribe(ffrg_onPostIslandSelection)
        modapiext.events.onResetTurn:unsubscribe(ffrg_onResetTurn2)
        modapiext.events.onPawnRevived:unsubscribe(ffrg_onPawnRevived)
        modapiext.events.onPawnDamaged:unsubscribe(ffrg_onPawnDamaged)
        achievements.ffrg_A_Light_Tan.tooltip = "Take 6 Fire Damage to Mechs in one Mission."
        achievements.ffrg_Ceaseless.tooltip = "Revive Mechs from destruction 15 times in one Island."
    elseif squadId == "ffrg_SeismicColossi" then
        modApi.events.onMissionEnd:unsubscribe(ffrg_onMissionEnd3)
        modApi.events.onMissionStart:unsubscribe(ffrg_onMissionStart3)
        modApi.events.onNextTurn:unsubscribe(ffrg_onNextTurn)
        modApi.events.onPawnFocused:unsubscribe(ffrg_onPawnFocused)
        modapiext.events.onPawnDamaged:unsubscribe(ffrg_onPawnDamaged2)
        achievements.ffrg_Diffusion.tooltip = "Deal 12 instances of damage to Enemies in a single turn."
        achievements.ffrg_A_Friend_Inside_You.tooltip = "Telefrag into Enemy Leaders with Invasive Warp 3 times within a game."
    end
end

modApi.events.onPostStartGame:subscribe(ffrg_onPostStartGame)
modApi.events.onSquadEnteredGame:subscribe(ffrg_onSquadEnteredGame)
modApi.events.onSquadExitedGame:subscribe(ffrg_onSquadExitedGame)


--////////////////////////////////--
