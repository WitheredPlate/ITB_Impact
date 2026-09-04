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

local VERSION = "1.0.1"

--## Template


------------------
-- Dependencies --
------------------

--## tipTracker.lua 1.0.1
--## worldConstants.lua


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_CustomProjectile.AddCustomProjectile
-- ( p1 [Point],  p2 [Point],  animation [String],  config [Table] )
-- Adds a custom projectile to the board going from the specified point to the specified point with the specified animation and the specified config options, explained below.
-- ret [SkillEffect] indicates the SkillEffect to add the projectile to. If not specified, the projectile is instead instantly added to the Board.
-- damage [SpaceDamage] indicates the SpaceDamage the custom projectile should deal on impact.
-- path [Boolean] indicates whether or not a path should be previewed on the board for the projectile. The default value is false if damage is not specified and true otherwise.
-- speed [Float] indicates how fast the projectile should move across the board, in tiles per second. The default value is 12.
-- directional [Boolean] indicates whether the animation should be considered as directional and have a "_#" appended that indicates the direction. The default value is true.


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function ffrg_GetFrame(anim, timer)
    if not anim.Lengths then
        local anim_duration = anim.Time * anim.NumFrames
        local time_mod = timer % anim_duration
        return math.ceil(time_mod / anim.Time)
    else
        local anim_duration = 0
        for _, length in ipairs(anim.Lengths) do
            anim_duration = anim_duration + length
        end
        local time_mod = timer % anim_duration
        for frame, length in ipairs(anim.Lengths) do
            time_mod = time_mod - length
            if time_mod <= 0 then return frame end
        end
        return 0 -- should never trigger
    end
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

--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--

local function ffrg_AddCustomProjectile(p1, p2, animation, config)
    config.speed = config.speed or 12
    if config.directional == nil then
        config.directional = true
    end
    if config.damage then
        if config.path == nil then
            config.path = true
        end
    else
        if config.path == nil then
            config.path = false
        end
    end
    local dir = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local tip = false
    if Board and Board:IsTipImage() then tip = true end
    if config.directional then
        animation = animation..dir
    end
    if ANIMS[animation] then
        anim = ANIMS[animation]
        if config.ret then
            if config.damage then
                if config.path then
                    config.damage.bHidePath = false
                else
                    config.damage.bHidePath = true
                end
                ffrg_WorldConstants:setSpeed(config.ret, (config.speed/15))
                config.ret:AddProjectile(p1, config.damage,"",NO_DELAY)
                ffrg_WorldConstants:resetSpeed(config.ret)
            elseif config.path then
                local path = SpaceDamage(p2, 0)
                path.sAnimation = "nil"
                config.ret:AddProjectile(p1, path,"",NO_DELAY)
            end
            config.ret:AddScript("ffrg_CustomProjectile.InsertCustomProjectile({duration = ("..distance.."*(1 / "..config.speed..")), point = "..p1:GetString()..", x = "..anim.PosX..", y = "..anim.PosY..", dir = "..dir..", animation = \""..animation.."\", speed = "..config.speed..", finished = false, instance = 0},"..tostring(tip)..")")
        else
            ffrg_InsertCustomProjectile({duration = (distance*(1 / config.speed)), point = p1, x = anim.PosX, y = anim.PosY, dir = dir, animation = animation, speed = config.speed, finished = false, instance = 0},tip)
            if config.damage then
                local ret = SkillEffect()
                ffrg_WorldConstants:setSpeed(ret, (config.speed/15))
                ret:AddProjectile(config.damage,"",NO_DELAY)
                ffrg_WorldConstants:resetSpeed(ret)
                Board:AddEffect(ret)
            end
        end
    end
end

local function ffrg_InsertCustomProjectile(projectile,tip)
    if Board and not tip then
        if not Board.ffrg_CustomProjectiles then
            Board.ffrg_CustomProjectiles = {}
        end
        table.insert(Board.ffrg_CustomProjectiles, projectile)
    elseif tip then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard then
            if not TipImageBoard.ffrg_CustomProjectiles then
                TipImageBoard.ffrg_CustomProjectiles = {}
            end
            table.insert(TipImageBoard.ffrg_CustomProjectiles, projectile)
        end
    end
end

local time_past = 0
local time_delta = 0

local function ffrg_onMissionUpdate(mission)
    if Board.ffrg_CustomProjectiles then
        for _, projectile in ipairs(Board.ffrg_CustomProjectiles) do
            if projectile.timer and projectile.timer >= projectile.duration then
                projectile.finished = true
            else
                projectile.instance = projectile.instance + 1
                projectile.timer = ( projectile.timer or 0 ) + time_delta
                local anim_old = ANIMS[projectile.animation]
                if anim_old then
                    local anim_new_id = "ffrg_CustomProjectile_"..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir
                    ANIMS[anim_new_id] = {
                        Layer = 0,
                        Image = anim_old.Image,
                        NumFrames = anim_old.NumFrames,
                        Frames = { ffrg_GetFrame(anim_old, projectile.timer) },
                        Lengths = nil,
                        Loop = false,
                        Time = 0,
                        PosX = math.ceil(projectile.x),
                        PosY = math.ceil(projectile.y)
                    }
                    Board:AddAnimation(projectile.point, anim_new_id, 1)
                end
                projectile.x = projectile.x + ((projectile.speed*28)*time_delta*ffrg_GetXDirection(projectile.dir))
                projectile.y = projectile.y + ((projectile.speed*28)*time_delta*0.75*ffrg_GetYDirection(projectile.dir))
            end
        end
        if #Board.ffrg_CustomProjectiles > 0 then
            for i = 1, #Board.ffrg_CustomProjectiles do
                local j = #Board.ffrg_CustomProjectiles + 1 - i
                local projectile = Board.ffrg_CustomProjectiles[j]
                if projectile and projectile.finished then
                    for i = 1, projectile.instance do
                        local anim_new_id = "ffrg_CustomProjectile_"..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir
                        if ANIMS[anim_new_id] then
                            ANIMS[anim_new_id] = nil -- Clearing finished ANIMS to reduce memory usage
                        end
                    end
                    table.remove(Board.ffrg_CustomProjectiles, j)
                end
            end
        end
    else
        Board.ffrg_CustomProjectiles = {}
    end
end

local function ffrg_onFrameDrawStart()
    local time_now = os.clock()
    time_delta = time_now - time_past
    time_past = time_now
    if ffrg_TipTracker.GetTipBoard() then
        local TipImageBoard = ffrg_TipTracker.GetTipBoard()
        if TipImageBoard.ffrg_CustomProjectiles then
            for _, projectile in ipairs(TipImageBoard.ffrg_CustomProjectiles) do
                if projectile.timer and projectile.timer >= projectile.duration then
                    projectile.finished = true
                else
                    projectile.instance = projectile.instance + 1
                    projectile.timer = ( projectile.timer or 0 ) + time_delta
                    local anim_old = ANIMS[projectile.animation]
                    if anim_old then
                        local anim_new_id = "ffrg_CustomProjectileTip_"..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir
                        ANIMS[anim_new_id] = {
                            Layer = 0,
                            Image = anim_old.Image,
                            NumFrames = anim_old.NumFrames,
                            Frames = { ffrg_GetFrame(anim_old, projectile.timer) },
                            Lengths = nil,
                            Loop = false,
                            Time = 0,
                            PosX = math.ceil(projectile.x),
                            PosY = math.ceil(projectile.y)
                        }
                        TipImageBoard:AddAnimation(projectile.point, anim_new_id, 1)
                    end
                    projectile.x = projectile.x + ((projectile.speed*28)*time_delta*ffrg_GetXDirection(projectile.dir))
                    projectile.y = projectile.y + ((projectile.speed*28)*time_delta*0.75*ffrg_GetYDirection(projectile.dir))
                end
            end
            if #TipImageBoard.ffrg_CustomProjectiles > 0 then
                for i = 1, #TipImageBoard.ffrg_CustomProjectiles do
                    local j = #TipImageBoard.ffrg_CustomProjectiles + 1 - i
                    local projectile = TipImageBoard.ffrg_CustomProjectiles[j]
                    if projectile and projectile.finished then
                        for i = 1, projectile.instance do
                            local anim_new_id = "ffrg_CustomProjectileTip_"..projectile.animation.."_"..projectile.instance.."_"..projectile.point:GetString().."_"..projectile.dir
                            if ANIMS[anim_new_id] then
                                ANIMS[anim_new_id] = nil -- Clearing finished ANIMS to reduce memory usage
                            end
                        end
                        table.remove(TipImageBoard.ffrg_CustomProjectiles, j)
                    end
                end
            end
        else
            TipImageBoard.ffrg_CustomProjectiles = {}
        end
    end
end

modApi.events.onMissionUpdate:subscribe(ffrg_onMissionUpdate)
modApi.events.onFrameDrawStart:subscribe(ffrg_onFrameDrawStart)

--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--

local function initialize()
    ffrg_CustomProjectile.AddCustomProjectile = ffrg_AddCustomProjectile
    ffrg_CustomProjectile.InsertCustomProjectile = ffrg_InsertCustomProjectile
    ffrg_CustomProjectile.Version = VERSION
end

if ffrg_CustomProjectile then
    if modApi:isVersion(ffrg_CustomProjectile.Version, VERSION) and ffrg_CustomProjectile.Version ~= VERSION then
        initialize()
    end
else
    ffrg_CustomProjectile = ffrg_CustomProjectile or {}
    initialize()
end

return ffrg_CustomProjectile

--////////////////////////////////--
