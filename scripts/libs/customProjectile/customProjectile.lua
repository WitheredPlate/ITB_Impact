--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--    Custom Projectile Library   --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "2.0.0"

--## Template


------------------
-- Dependencies --
------------------

--## tipTracker.lua 1.0.1


---------------------------
-- Optional Dependencies --
---------------------------

--## worldConstants.lua (Modified, just grab the one from Arsenal or Impact)
    -- Required for preventing timing misalignment for damaging "Projectile" wisps.
    -- I don't reccomend you use damaging wisps anyways so ideally just leave this.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_CustomProjectile.Add
-- ( point [Point],  animation [String],  config [Table] )
-- Adds a custom animated 'wisp' to the board that starts, unless altered via maps, at the specified point with the specified animation and specified config options, explained below.

-- style [String] indicates how, of a few presets, the wisp should physically behave.
    -- "Standard" applies no specific behavior.
    -- "Projectile" behaves like a projectile that travels directly to the target.
    -- "Artillery" behaves like an artillery that arcs through the air towards the target.
-- ret [SkillEffect] indicates the SkillEffect to add the wisp to. If not specified, the wisp is instead instantly added to the Board.
-- duration [Float] indicates the duration in seconds the wisp should exist for before expiring.
    -- For wisps of "Projectile" style, this is calculated automatically when left unspecified.
    -- For wisps of "Artillery" style, this defaults to 0.75, the same duration as a normal artillery.
-- direction [Integer] indicates what direction the wisp should consider itself as facing for the purposes of other options.
    -- If unspecified while a target is specified, the direction is inferred from the direction between the origin and target of the wisp.

-- map_x [String] indicates a string reference to a function that appends to the x coordinate of the wisp.
-- map_y [String] indicates a string reference to a function that appends to the y coordinate of the wisp.
-- map_z [String] indicates a string reference to a function that appends to the y coordinate of the wisp, but does not alter the y coordinate of any custom shadow animation.
    -- All 3 coordinate maps are added in addition to the linear motion from traveling between origin and target, but the z map will replace the natural vertical arc of "Artillery" style wisps.
    -- All 3 coordinate maps output a number value which is added to the coordinate position in pixels.
    -- All 3 coordinate maps take a single input 'portion' that indicates what proportion of the wisp's lifetime has expired.
-- map_distance [String] indicates a string reference to a function that modifies the linear travel between an origin and target.
    -- The distance map takes the inputs 'portion' that indicates what proportion of the wisp's lifetime has expired and 'distance' that indicates the distance the linear motion travels, in tiles.
    -- The distance map outputs a revised 'portion' value, which most typically ranges from 0 to 1 but can be any Float.

-- target [Point] indicates a target point that the wisp should linearly travel to across its lifespan in addition to the behavior of its other maps.
    -- This point also informs much of the behavior of non-standard styles of wisp and must be specified for those to function properly.
    -- The following config options only function when a target is specified and the wisp is of a non-standard style:
    -- damage [SpaceDamage] indicates the SpaceDamage the wisp should deal upon expiring.
        -- WARNING This is a semi-unsupported legacy feature that will be mistimed with artilleries that have non-standard durations.
    -- path [Boolean] indicates whether or not a path should be previewed on the board for the wisp. The default value is true if damage specified and false otherwise.
    -- shadow [Boolean] only functions for "Artillery" styles, and indicates whether the small standard shadow should be displayed below as the wisp travels. The default value is false if a custom shadow is specified and true otherwise.
    -- trail [String] only functions for "Artillery" styles with a standard y-map, and indicates what emitter trail, of the hardcoded vanilla options, should be used for the artillery.
        -- "missile" creates a trail of white smoke particles that fade mid-air.
        -- "fireball" creates a trail of black smoke particles that fade mid-air. A vanilla bug causes the normal ground shadow of artilleries with this trail to be slightly misaligned.
        -- "shotup_acid" creates a trail of green cloud particles that fall towards the ground.
-- directional [Boolean] indicates whether the animation should be considered as directional and have a "_#" appended that indicates the direction. The default value is true.

-- animation_shadow [String] indicates a shadow animation that should be displayed on the ground below the wisp as it travels.

-- animation_trail [String] indicates the animation for a trail particle that should be repeatedly spawned behind the wisp as it travels.
-- map_trail [Function] is an alternative that overrides animation_trail, instead taking a function that should return an animation dynamically.
    -- The trail map takes a single input 'portion' that indicates what proportion of the wisp's lifetime has expired.
-- frequency_trail [Float] indicates the delay between each time the trail animation should be played, in seconds.
    -- Defaults to 0.25 seconds, minimum of 0.1 seconds for performance reasons.
-- spacing_trail [Float] indicates a certain amount of spacing, in pixels to force as a minimum between any two spawning trail particles



--## ffrg_CustomProjectile.AddProjectile
-- ( p1 [Point],  p2 [Point],  animation [String],  config [Table] )
-- An alternative shorthand for 'Add' that automatically adds a wisp of type "Projectile" and differs slightly in inputs.
-- p1 is analagous to and functions as the above function input 'point,' and p2 is analagous to and functions as the above config option 'target.'


--## ffrg_CustomProjectile.AddArtillery
-- ( p1 [Point],  p2 [Point],  animation [String],  config [Table] )
-- An alternative shorthand for 'Add' that automatically adds a wisp of type "Artillery" and differs slightly in inputs.
-- p1 is analagous to and functions as the above function input 'point,' and p2 is analagous to and functions as the above config option 'target.'


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = GetParentPath(...)

modApi:appendAsset("img/effects/ffrg_nil.png", path.."img/effects/ffrg_nil.png")
modApi:appendAsset("img/effects/ffrg_nil_shotup_acid.png", path.."img/effects/ffrg_nil_shotup_acid.png")
modApi:appendAsset("img/effects/ffrg_nil_missile.png", path.."img/effects/ffrg_nil_missile.png")
modApi:appendAsset("img/effects/ffrg_nil_fireball.png", path.."img/effects/ffrg_nil_fireball.png")


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function ffrg_GetFrame(anim, timer)
    if not anim.Lengths then
        local anim_duration
        if anim.Frames then
            anim_duration = anim.Time * #anim.Frames
        else
            anim_duration = anim.Time * anim.NumFrames
        end
        local time_mod = timer % anim_duration
        return math.ceil(time_mod / anim.Time)
    else
        local anim_duration = 0
        for _, length in ipairs(anim.Lengths) do
            anim_duration = anim_duration + length
        end
        local time_mod = timer % anim_duration
        if anim.Frames then
            for i, length in ipairs(anim.Lengths) do
                local frame = anim.Frames[i]
                time_mod = time_mod - length
                if time_mod <= 0 then return frame end
            end
        else
            for frame, length in ipairs(anim.Lengths) do
                time_mod = time_mod - length
                if time_mod <= 0 then return frame end
            end
        end
        return 0 -- should never trigger
    end
end

local function ttrg_TableToString(table)
    if table == nil then return "{}" end
    if type(table) ~= "table" then return tostring(table) end
    local result = "{"
    for k, v in pairs(table) do
        local key = type(k) == "string" and string.format("[%q]", k) or "["..k.."]"
        local value
        if type(v) == "userdata" and v.GetString and type(v.GetString) == "function" then -- fo points
            value = v:GetString()
        elseif type(v) == "table" then
            value = ttrg_TableToString(v)
        elseif type(v) == "string" then
            value = string.format("%q", v)
        elseif type(v) == "userdata" then
            value = ""
        else
            value = tostring(v)
        end
        if value ~= "" then
            result = result .. key .. "=" .. value .. ","
        end
    end
    return result .. "}"
end

local function ffrg_GetPointOffset(p1, p2)
    local xdif = p1.x-p2.x
    local ydif = p1.y-p2.y
    return Point(-28*(xdif-ydif),21*(xdif+ydif))
end

local function ffrg_GetXDirection(dir)
    if dir == 1 then return 1
    elseif dir == 2 then return -1
    elseif dir == 3 then return -1
    else return 1 end
end

local function ffrg_GetYDirection(dir)
    if dir == 1 then return 1
    elseif dir == 2 then return 1
    elseif dir == 3 then return -1
    else return -1 end
end

local function ttrg_StringSplit(str, sep)
    sep = sep or "%s"
    local result = {}
    for match in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(result, match)
    end
    return result
end

local function ffrg_StringToReference(input)
    local data = ttrg_StringSplit(input,"%.")
    local reference = _G
    for _, entry in ipairs(data) do
        reference = reference[entry]
    end
    return reference
end

local function ttrg_GetGridDistance(p1, p2)
    local xdif = p1.x-p2.x
    local ydif = p1.y-p2.y
    return math.sqrt(xdif^2+ydif^2)
end

local function ttrg_GetGridDirection(p1, p2)
    local xdif = p2.x-p1.x
    local ydif = p2.y-p1.y
    if xdif ~= 0 or ydif ~= 0 then
        if math.abs(xdif) > math.abs(ydif) then
            if xdif > 0 then return 1 else return 3 end
        else
            if ydif > 0 then return 2 else return 0 end
        end
    else return 0 end
end

local function ttrg_Standard_Map_Z(portion)
    return (1-(((2*portion)-1)^2))*54
end

local function ttrg_Standard_Map_Distance(portion, distance)
    return portion
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ttrg_InsertWisp(point, animation, config, tip)
    config = config or {}
    if not config.duration or config.duration == 0 then return end

    local direction = config.direction and config.direction or config.target and config.target ~= point and ttrg_GetGridDirection(point, config.target) or nil
    local directional = config.directional == nil and true or config.directional
    if direction and directional then
        animation = animation..direction
    end

    local map_x
    local map_y
    if config.target and config.target ~= point then
        local distance_function = config.map_distance and ffrg_StringToReference(config.map_distance) or ttrg_Standard_Map_Distance
        local distance = ttrg_GetGridDistance(point, config.target)
        local offset = ffrg_GetPointOffset(point, config.target)
        if config.map_x then
            local map_function = ffrg_StringToReference(config.map_x)
            map_x = function(portion)
                return ((offset.x)*distance_function(portion, distance)) + map_function(portion)
            end
        else
            map_x = function(portion)
                return (offset.x)*distance_function(portion, distance)
            end
        end
        if config.map_y and config.map_z then
            local map_function1 = ffrg_StringToReference(config.map_y)
            local map_function2 = ffrg_StringToReference(config.map_z)
            map_y = function(portion)
                return ((offset.y)*distance_function(portion, distance)) + map_function1(portion) + map_function2(portion)
            end
        elseif config.map_y or config.map_z then
            local map_function = ffrg_StringToReference(config.map_y or config.map_z)
            map_y = function(portion)
                return ((offset.y)*distance_function(portion, distance)) + map_function(portion)
            end
        else
            map_y = function(portion)
                return (offset.y)*distance_function(portion, distance)
            end
        end
    else
        if config.map_x then
            local map_function = ffrg_StringToReference(config.map_x)
            map_x = function(portion)
                return map_function(portion)
            end
        end
        if config.map_y and config.map_z then
            local map_function1 = ffrg_StringToReference(config.map_y)
            local map_function2 = ffrg_StringToReference(config.map_z)
            map_y = function(portion)
                return map_function1(portion) + map_function2(portion)
            end
        elseif config.map_y or config.map_z then
            local map_function = ffrg_StringToReference(config.map_y or config.map_z)
            map_y = function(portion)
                return map_function(portion)
            end
        end
    end

    local trail_data
    if ( config.animation_trail and config.animation_trail ~= "" ) or config.map_trail then
        trail_data = {}
        trail_data.variation = config.variation_trail or 0
        trail_data.frequency = config.frequency_trail and math.max(config.frequency_trail, 0.1) or 0.25
        if config.spacing_trail then
            trail_data.spacing = config.spacing_trail
        end
        trail_data.timer = trail_data.frequency/2
        if config.map_trail then
            trail_data.map = ffrg_StringToReference(config.map_trail)
        else
            trail_data.map = function(portion)
                return config.animation_trail
            end
        end
    end

    local wisp = {
        duration = config.duration,
        point = point,
        animation = animation,
        trail_data = trail_data,
        map_x = map_x,
        map_y = map_y,
        x = 0,
        y = 0,
        finished = false,
        timer = 0
    }

    if Board and not tip then
        if not Board.ffrg_Wisps then
            Board.ffrg_Wisps = {}
        end
        table.insert(Board.ffrg_Wisps, wisp)
    elseif tip then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard then
            if not TipImageBoard.ffrg_Wisps then
                TipImageBoard.ffrg_Wisps = {}
            end
            table.insert(TipImageBoard.ffrg_Wisps, wisp)
        end
    end
end

local function ffrg_AddWisp(point, animation, config)

    config = config or {}

    local tip = Board and Board:IsTipImage() and true or false

    config.style = config.style or "Standard"
    if config.style == "Projectile" and not config.speed then config.speed = 12 end
    if config.style == "Projectile" and not config.duration and config.target and config.target ~= point then
        config.duration = ttrg_GetGridDistance(point, config.target) / config.speed
    end
    if config.style == "Artillery" and not config.map_z then config.map_z = "ttrg_CustomProjectile.Standard_Map_Z" end
    if config.style == "Artillery" and not config.duration then config.duration = 0.75 end

    local trail = config.style == "Artillery" and config.trail and ( not config.map_z or ffrg_StringToReference(config.map_z) == ttrg_Standard_Map_Z ) and true or false
    local shadow = config.style == "Artillery" and config.shadow and true or false
    local apply = config.target and (config.style == "Projectile" or config.style == "Artillery") and ( config.damage or config.path or shadow or trail ) and true or false

    local damage
    local art_art = ""
    if apply then
        damage = config.damage and config.damage:Clone() or SpaceDamage(config.target,0)
        if config.path == nil then
            if config.damage then damage.bHidePath = false else damage.bHidePath = true end
        else
            if config.path then damage.bHidePath = false else damage.bHidePath = true end
        end
        if trail then
            art_art = "effects/ffrg_nil_"..config.trail..".png"
        elseif shadow then
            art_art = "effects/ffrg_nil.png"
        end
    end

    if config.ret then
        config.ret:AddScript("ttrg_CustomProjectile.Insert("..point:GetString()..",\""..animation.."\","..ttrg_TableToString(config)..","..tostring(tip)..")")
        if apply then
            if config.style == "Projectile" then
                if config.speed ~= 12 and ffrg_WorldConstants then ffrg_WorldConstants:setSpeed(config.ret, (config.speed/16)) end
                config.ret:AddProjectile(point, damage, "", NO_DELAY)
                if config.speed ~= 12 and ffrg_WorldConstants then ffrg_WorldConstants:resetSpeed(config.ret) end
            elseif config.style == "Artillery" then
                config.ret:AddArtillery(point, damage, art_art, NO_DELAY)
            end
        end
        if config.animation_shadow then
            local config2 = shallow_copy(config)
            config2.map_z = nil
            config2.animation_trail = nil
            config2.map_trail = nil
            config.ret:AddScript("ttrg_CustomProjectile.Insert("..point:GetString()..",\""..config.animation_shadow.."\","..ttrg_TableToString(config2)..","..tostring(tip)..")")
        end
    else
        ttrg_InsertWisp(point, animation, config, tip)
        if apply then
            local ret = SkillEffect()
            if config.style == "Projectile" then
                if config.speed ~= 12 and ffrg_WorldConstants then ffrg_WorldConstants:setSpeed(ret, (config.speed/16)) end
                ret:AddProjectile(point, damage, "", NO_DELAY)
                if config.speed ~= 12 and ffrg_WorldConstants then ffrg_WorldConstants:resetSpeed(ret) end
            elseif config.style == "Artillery" then
                ret:AddArtillery(point, damage, art_art, NO_DELAY)
            end
            Board:AddEffect(ret)
        end
        if config.animation_shadow then
            local config2 = shallow_copy(config)
            config2.map_z = nil
            config2.animation_trail = nil
            config2.map_trail = nil
            ttrg_InsertWisp(point, config.animation_shadow, config2, tip)
        end
    end
end

local function ffrg_AddProjectile(p1, p2, animation, config)
    config.target = p2
    config.style = "Projectile"
    ffrg_AddWisp(p1, animation, config)
end

local function ffrg_AddArtillery(p1, p2, animation, config)
    config.target = p2
    config.style = "Artillery"
    if config.height_map and not config.map_z then
        config.map_z = config.height_map
    end
    if config.custom_shadow and not config.animation_shadow then
        config.animation_shadow = config.custom_shadow
    end
    ffrg_AddWisp(p1, animation, config)
end


local time_past = 0
local time_delta = 0

local function ProjectileProgress(boardTemp)
    local clear_required = false
    for _, wisp in ipairs(boardTemp.ffrg_Wisps) do
        if wisp.timer and wisp.timer >= wisp.duration then
            wisp.finished = true
            clear_required = true
        else
            wisp.timer = ( wisp.timer or 0 ) + time_delta
            local anim_base = ANIMS[wisp.animation]
            if anim_base then
                local frame = ffrg_GetFrame(anim_base, wisp.timer)
                local anim_new_id = "ffrg_CustomProjectile_"..wisp.animation.."_"..frame.."_"..math.ceil(wisp.x).."_"..math.ceil(wisp.y)
                ANIMS[anim_new_id] = {}
                ANIMS[anim_new_id].Image = anim_base.Image
                ANIMS[anim_new_id].NumFrames = anim_base.NumFrames
                ANIMS[anim_new_id].Layer = anim_base.Layer
                ANIMS[anim_new_id].Frames = { frame }
                ANIMS[anim_new_id].Lengths = nil
                ANIMS[anim_new_id].Loop = false
                ANIMS[anim_new_id].Time = 0
                ANIMS[anim_new_id].PosX = anim_base.PosX + math.ceil(wisp.x)
                ANIMS[anim_new_id].PosY = anim_base.PosY - math.ceil(wisp.y)
                boardTemp:AddAnimation(wisp.point, anim_new_id, 1)
                ANIMS[anim_new_id] = nil
            end
            local portion = wisp.timer/wisp.duration
            if wisp.trail_data then
                wisp.trail_data.timer = ( wisp.trail_data.timer or 0 ) + time_delta
                if wisp.trail_data.timer >= wisp.trail_data.frequency then
                    local cont = true
                    if wisp.trail_data.spacing then
                        local wisp_pt = Point(wisp.x, wisp.y)
                        if not wisp.trail_data.spacing_last or wisp.trail_data.spacing <= ttrg_GetGridDistance(wisp.trail_data.spacing_last,wisp_pt) then
                            wisp.trail_data.spacing_last = wisp_pt
                        else
                            cont = false
                        end
                    end
                    if cont then
                        wisp.trail_data.timer = wisp.trail_data.timer%wisp.trail_data.timer
                        local anim_mapped = wisp.trail_data.map(portion)
                        local anim_base = ANIMS[anim_mapped]
                        if anim_base then
                            local anim_new_id = "ffrg_CustomProjectileTrail_"..anim_mapped.."_"..math.ceil(wisp.x).."_"..math.ceil(wisp.y)
                            ANIMS[anim_new_id] = anim_base:new{
                                PosX = anim_base.PosX + math.ceil(wisp.x),
                                PosY = anim_base.PosY - math.ceil(wisp.y)
                            }
                            boardTemp:AddAnimation(wisp.point, anim_new_id, 1)
                            ANIMS[anim_new_id] = nil
                        end
                    end
                end
            end
            wisp.x = wisp.map_x and wisp.map_x(portion) or 0
            wisp.y = wisp.map_y and wisp.map_y(portion) or 0
        end
    end
    if clear_required then
        local size = #boardTemp.ffrg_Wisps
        for i = 1, size do
            local index = size-i+1
            local wisp = boardTemp.ffrg_Wisps[index]
            if wisp.finished then
                table.remove(boardTemp.ffrg_Wisps,index)
            end
        end
    end
end

local function ffrg_onMissionUpdate(mission)
    if Board.ffrg_Wisps and #Board.ffrg_Wisps ~= 0 then
        ProjectileProgress(Board)
    end
end

local function ffrg_onFrameDrawStart()
    local time_now = os.clock()
    time_delta = time_now - time_past
    time_past = time_now
    if ffrg_TipTracker.GetTipBoard() then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard.ffrg_Wisps and #TipImageBoard.ffrg_Wisps ~= 0 then
            ProjectileProgress(TipImageBoard)
        end
    end
end

--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


if not ffrg_CustomProjectile or ( modApi:isVersion(ffrg_CustomProjectile.version, VERSION) and ffrg_CustomProjectile.version ~= VERSION ) then

 --[[     Library    ]] ffrg_CustomProjectile = ffrg_CustomProjectile or {}
 --[[     Version    ]] ffrg_CustomProjectile.version = VERSION
 --[[ Initialization ]] ffrg_CustomProjectile.initialized = false

end
local function ffrg_onModsInitialized()
if ffrg_CustomProjectile.version == VERSION and not ffrg_CustomProjectile.initialized then

 --[[     Library    ]] ttrg_CustomProjectile = ttrg_CustomProjectile or {}
 --[[ Initialization ]] ffrg_CustomProjectile.initialized = true

 --[[     Global     ]] ffrg_CustomProjectile.Add = ffrg_AddWisp
 --[[     Global     ]] ffrg_CustomProjectile.AddProjectile = ffrg_AddProjectile
 --[[     Global     ]] ffrg_CustomProjectile.AddArtillery = ffrg_AddArtillery
 --[[    Technical   ]] ttrg_CustomProjectile.Insert = ttrg_InsertWisp
 --[[    Technical   ]] ttrg_CustomProjectile.Standard_Map_Z = ttrg_Standard_Map_Z
 --[[    Technical   ]] ttrg_CustomProjectile.Standard_Map_Distance = ttrg_Standard_Map_Distance

 --[[  Compatibility ]] ffrg_CustomProjectile.AddCustomProjectile = ffrg_AddProjectile
 --[[  Compatibility ]] ffrg_CustomProjectile.AddCustomArtillery = ffrg_AddArtillery
 --[[  Compatibility ]] ttrg_CustomProjectile_StandardHeightMap = ttrg_Standard_Map_Z

 --[[  Subscription  ]] modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
 --[[  Subscription  ]] modApi.events.onFrameDrawStart:subscribe(ffrg_onFrameDrawStart)

end end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
return ffrg_CustomProjectile


--////////////////////////////////--
