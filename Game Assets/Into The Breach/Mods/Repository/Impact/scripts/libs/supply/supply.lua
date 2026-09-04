--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--         Supply Library         --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.2.2"

--## A library of functions largely for the Supply status, which refills a use of all limited use weapons on the target, with an accompanying visual and auditory cue.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_Supply.Supply
-- ( callerPoint [Point],  point [Point],  ret [SkillEffect],  config [Table] )
-- Applies the Supply status in the specified SkillEffect to the specified target point from the specified caller point with the specified config options, explained below.
    -- returnDamage [Boolean], when true, returns the Supply SpaceDamage instead of adding it to the SkillEffect. When true, the specified SkillEffect can safely be left as nil.
    -- hideIcon [Boolean], when true, hides the Supply Icon from the SkillEffect preview.
    -- repair [Integer] indicates that the supply is accompanied by a quantity of repairing equal to the specified value. This DOES NOT add the repairs to the SpaceDamage, merely alters the visuals of the Supply.
    -- callerPrevent [String] indicates a weapon ID, that when present, does not have uses restored to it. This is intended for use with weapons that cause Supply and have limited uses themselves, to prevent them from perpetually sustaining themselves.

--## ffrg_Supply.SupplyIndex
-- ( callerPoint [Point],  point [Point],  callerPrevent [String] )
-- Calculates and returns the supply index for the pawn at the specified point from the specified callerPoint with the specified callerPrevent (with the same function as the supply config option).
    -- An index of 0 indicates that either there is no valid pawn to Supply at the specified point or the pawn has no weapons eligible to be Supplied
    -- An index of 1 indicates that the pawn has a valid weapon to Supply in equipment slot 1.
    -- An index of 2 indicates that the pawn has a valid weapon to Supply in equipment slot 2.
    -- An index of 3 indicates that the pawn has valid weapons to Supply in equipment slots 1 and 2.

--## ffrg_Supply.events.onPawnSupplied
-- (mission [Mission], pawn [Pawn], index [Integer])
-- An event that triggers whenever a pawn is Supplied.
-- Provides the current mission, the pawn that is supplied, and the index that was used for the supply.

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = GetParentPath(...)

local files = {
    "img/combat/icons/icon_supply_glow.png",
    "img/combat/icons/icon_supply_miss.png",
    "img/combat/icons/icon_heal_supply_1.png",
    "img/combat/icons/icon_heal_supply_2.png",
    "img/combat/icons/icon_heal_supply_3.png",
    "img/combat/icons/icon_heal_supply_4.png",
    "img/combat/icons/icon_heal_supply_5.png",
    "img/combat/icons/icon_heal_supply_6.png",
    "img/combat/icons/icon_heal_supply_7.png",
    "img/combat/icons/icon_heal_supply_8.png",
    "img/combat/icons/icon_heal_supply_9.png",
    "img/combat/icons/icon_heal_supply_10.png",
    "img/combat/icons/icon_heal_supply_11.png",
    "img/combat/icons/icon_heal_supply_12.png",
    "img/effects/supply.png",
}

for _, file in ipairs(files) do
    modApi:appendAsset(file, path .. file)
end

Location["combat/icons/icon_supply_glow.png"] = Point(-10,9)
Location["combat/icons/icon_supply_miss.png"] = Point(-10,9)
Location["combat/icons/icon_heal_supply_1.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_2.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_3.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_4.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_5.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_6.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_7.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_8.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_9.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_10.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_11.png"] = Point(-20,8)
Location["combat/icons/icon_heal_supply_12.png"] = Point(-20,8)

ANIMS.ffrg_UseSupply = Animation:new{
    Image = "effects/supply.png",
    NumFrames = 32,
    Time = 0.03,
    PosX = -20,
    PosY = -30
}


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function AddUses(point,index,uses,repair)
    local pawn = Board:GetPawn(point)
    if not Board:IsTipImage() and GetCurrentMission() ~= Mission_Test then
        if index == 1 then
            pawn:SetWeaponLimitedRemaining(1,pawn:GetWeaponLimitedRemaining(1)+uses)
        end
        if index == 2 then
            pawn:SetWeaponLimitedRemaining(2,pawn:GetWeaponLimitedRemaining(2)+uses)
        end
        if index == 3 then
            pawn:SetWeaponLimitedRemaining(1,pawn:GetWeaponLimitedRemaining(1)+uses)
            pawn:SetWeaponLimitedRemaining(2,pawn:GetWeaponLimitedRemaining(2)+uses)
        end
    end
    if repair == true then
        Board:Ping(point, GL_Color(210,240,20))
    else
        Board:Ping(point, GL_Color(255,206,41))
    end
    if not Board:IsTipImage() then
        ffrg_Supply.events.onPawnIsSupplied:dispatch(GetCurrentMission(), pawn, index)
    end
end

local function SupplyUtilities(point,ret,index,hideIcon,repair)
    damagek = SpaceDamage(point,0)
    if hideIcon == false then
        if repair > 0 then
            damagek.sImageMark = "combat/icons/icon_heal_supply_"..repair..".png"
        else
            damagek.sImageMark = "combat/icons/icon_supply_glow.png"
        end
    end
    damagek.sAnimation = "ffrg_UseSupply"
    damagek.sSound = "/ui/battle/pod_open"
    damagek.fDelay = 0
    if repair > 0 then
        damagek.sScript = "ffrg_Supply.AddUses("..point:GetString()..","..index..",1,true)"
    else
        damagek.sScript = "ffrg_Supply.AddUses("..point:GetString()..","..index..",1,false)"
    end
    ret:AddDamage(damagek)
end

local function SupplyUtilitiesDamage(point,index,hideIcon,repair)
    damagek = SpaceDamage(point,0)
    if hideIcon == false then
        if repair > 0 then
            damagek.sImageMark = "combat/icons/icon_heal_supply_"..repair..".png"
        else
            damagek.sImageMark = "combat/icons/icon_supply_glow.png"
        end
    end
    damagek.sAnimation = "ffrg_UseSupply"
    damagek.sSound = "/ui/battle/pod_open"
    damagek.fDelay = 0
    if repair > 0 then
        damagek.sScript = "ffrg_Supply.AddUses("..point:GetString()..","..index..",1,true)"
    else
        damagek.sScript = "ffrg_Supply.AddUses("..point:GetString()..","..index..",1,false)"
    end
    return damagek
end

local function SupplyRedundant(point,ret,repair)
    damagek = SpaceDamage(point,0)
    if repair > 0 then
        return
    else
        damagek.sImageMark = "combat/icons/icon_supply_miss.png"
    end
    ret:AddDamage(damagek)
end

local function SupplyRedundantDamage(point)
    damagek = SpaceDamage(point,0)
    damagek.sImageMark = "combat/icons/icon_supply_miss.png"
    return damagek
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function SupplyIndex(callerPoint,point,callerPrevent)
    local limitIndex = 0
    if Board and Board:IsPawnSpace(point) and Board:GetPawn(point):IsMech() then

        local count = Board:GetPawn(point):GetWeaponCount()

        if count > 0 then
            for h = 1, count do
                local powered = Board:GetPawn(point):IsWeaponPowered(Board:GetPawn(point):GetEquippedWeapons()[h])
                local uses = Board:GetPawn(point):GetWeaponLimitedUses(h)
                if uses > 0 and powered and (tostring(Board:GetPawn(point):GetEquippedWeapons()[h]) ~= callerPrevent or point ~= callerPoint) then
                    limitIndex = limitIndex + h
                end
            end
        end
    end
    return limitIndex
end

local function Supply(callerPoint,point,ret,config)
    config = config or {}
    config.returnDamage = config.returnDamage or false
    config.hideIcon = config.hideIcon or false
    config.repair = config.repair or 0
    config.callerPrevent = config.callerPrevent or ""

    local limitIndex = SupplyIndex(callerPoint,point,config.callerPrevent)

    if Board:GetPawn(callerPoint):IsBoosted() and config.repair > 0 then
        config.repair = config.repair + 1
    end

    if limitIndex > 0 and config.returnDamage == false then
        SupplyUtilities(point,ret,limitIndex,config.hideIcon,config.repair)
    elseif limitIndex == 0 and config.returnDamage == false and config.hideIcon == false then
        SupplyRedundant(point,ret,config.repair)
    end

    if not config.returnDamage then
        return limitIndex
    else
        if limitIndex and limitIndex > 0 then
            return SupplyUtilitiesDamage(point,limitIndex,config.hideIcon,config.repair)
        elseif config.hideIcon == false and config.repair == 0 then
            return SupplyRedundantDamage(point)
        else
            return SpaceDamage(point,0)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_Supply.Supply = Supply
    ffrg_Supply.SupplyIndex = SupplyIndex
    ffrg_Supply.AddUses = AddUses -- Technical but required global for scripting
    ffrg_Supply.Version = VERSION
    ffrg_Supply.events = {}
    ffrg_Supply.events.onPawnIsSupplied = Event()
end

if ffrg_Supply then
    if modApi:isVersion(ffrg_Supply.Version, VERSION) and ffrg_Supply.Version ~= VERSION then
        initialize()
    end
else
    ffrg_Supply = ffrg_Supply or {}
    initialize()
end

return ffrg_Supply


--////////////////////////////////--
