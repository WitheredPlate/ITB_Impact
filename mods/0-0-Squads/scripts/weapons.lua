--////////////////////////////////--
--//   (Impact) Squad Weapons   //--
--////////////////////////////////--

--== Prime ==--
-- Slab Flail
-- Myriad Appendages

--== Brute ==--
-- Scything Blades
-- Rotary Cannon

--== Ranged ==--
-- Bastion Dispensary
-- Maintenance Mortar

--== Science ==--
-- Mass Processor
-- Long-Range Teleport
-- Invasive Warp
-- Upheaval Rail

--== Passive ==--
-- Contingency Cache

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "weapons/ffrg_prime_boulderflail.png",
    "weapons/ffrg_prime_TC_multitoss.png",
    "weapons/ffrg_brute_rotary.png",
    "weapons/ffrg_brute_sawcharge.png",
    "weapons/ffrg_ranged_deploybastion.png",
    "weapons/ffrg_ranged_TC_maintenance.png",
    "weapons/ffrg_science_shred.png",
    "weapons/ffrg_science_TC_longtele.png",
    "weapons/ffrg_science_telefrag.png",
    "weapons/ffrg_science_TC_upheaval.png",
    "weapons/ffrg_passive_phoenix.png",
    "effects/ffrg_shot_bullet_U.png",
    "effects/ffrg_shot_bullet_R.png",
    "effects/ffrg_shotup_bastion.png",
    "effects/ffrg_shotup_maintenance.png",
    "effects/ffrg_chain1_U.png",
    "effects/ffrg_chain1_R.png",
    "effects/ffrg_chain1_D.png",
    "effects/ffrg_chain1_L.png",
    "effects/ffrg_chain2_U.png",
    "effects/ffrg_chain2_R.png",
    "effects/ffrg_chain2_D.png",
    "effects/ffrg_chain2_L.png",
    "effects/ffrg_boulder_land_U.png",
    "effects/ffrg_boulder_land_R.png",
    "effects/ffrg_boulder_land_D.png",
    "effects/ffrg_boulder_land_L.png",
    "effects/ffrg_exploupheaval_U.png",
    "effects/ffrg_exploupheaval_R.png",
    "effects/ffrg_exploupheaval_D.png",
    "effects/ffrg_exploupheaval_L.png",
    "combat/icons/ffrg_icon_teleport_fail_glow.png",
    "combat/icons/ffrg_icon_teleport_cropped_glow.png",
    "combat/icons/ffrg_icon_telefrag_glow.png",
    "combat/ffrg_throw_universal.png",
    "combat/ffrg_throw_universal_off.png",
    "combat/ffrg_throw_universal_small.png",
    "combat/ffrg_throw_universal_small_off.png",
    "combat/icons/ffrg_icon_shield_heal_glow.png",
    "combat/icons/ffrg_icon_shield_heal_miss_glow.png",
}

Location["combat/icons/ffrg_icon_teleport_fail_glow.png"] = Point(-13,8)
Location["combat/icons/ffrg_icon_teleport_cropped_glow.png"] = Point(-13,6)
Location["combat/icons/ffrg_icon_telefrag_glow.png"] = Point(-11,0)
Location["combat/icons/ffrg_icon_shield_heal_glow.png"] = Point(-21,9)
Location["combat/icons/ffrg_icon_shield_heal_miss_glow.png"] = Point(-21,9)
local throw_loc = Point(-13,6)
Location["combat/ffrg_throw_universal.png"] = throw_loc
Location["combat/ffrg_throw_universal_off.png"] = throw_loc
Location["combat/ffrg_throw_universal_small.png"] = throw_loc
Location["combat/ffrg_throw_universal_small_off.png"] = throw_loc

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--== Slab Flail ==--

ANIMS.ffrg_Chain1_0 = Animation:new{
    Image = "effects/ffrg_chain1_U.png",
    NumFrames = 8,
    Time = 0.07,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_Chain1_1 = Animation:new{
    Image = "effects/ffrg_chain1_R.png",
    NumFrames = 8,
    Time = 0.07,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_Chain1_2 = Animation:new{
    Image = "effects/ffrg_chain1_D.png",
    NumFrames = 8,
    Time = 0.07,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_Chain1_3 = Animation:new{
    Image = "effects/ffrg_chain1_L.png",
    NumFrames = 8,
    Time = 0.07,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_Chain2_0 = Animation:new{
    Image = "effects/ffrg_chain2_U.png",
    NumFrames = 12,
    Time = 0.07,
    PosX = -28,
    PosY = -28
}
ANIMS.ffrg_Chain2_1 = Animation:new{
    Image = "effects/ffrg_chain2_R.png",
    NumFrames = 12,
    Time = 0.07,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_Chain2_2 = Animation:new{
    Image = "effects/ffrg_chain2_D.png",
    NumFrames = 12,
    Time = 0.07,
    PosX = -56,
    PosY = -9
}
ANIMS.ffrg_Chain2_3 = Animation:new{
    Image = "effects/ffrg_chain2_L.png",
    NumFrames = 12,
    Time = 0.07,
    PosX = -56,
    PosY = -28
}
ANIMS.ffrg_BoulderLand0_0 = Animation:new{
    Image = "effects/ffrg_boulder_land_U.png",
    NumFrames = 7,
    Lengths = {0.09,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand0_1 = Animation:new{
    Image = "effects/ffrg_boulder_land_R.png",
    NumFrames = 7,
    Lengths = {0.09,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand0_2 = Animation:new{
    Image = "effects/ffrg_boulder_land_D.png",
    NumFrames = 7,
    Lengths = {0.09,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand0_3 = Animation:new{
    Image = "effects/ffrg_boulder_land_L.png",
    NumFrames = 7,
    Lengths = {0.09,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand1_0 = Animation:new{
    Image = "effects/ffrg_boulder_land_U.png",
    NumFrames = 7,
    Lengths = {0.13,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand1_1 = Animation:new{
    Image = "effects/ffrg_boulder_land_R.png",
    NumFrames = 7,
    Lengths = {0.13,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand1_2 = Animation:new{
    Image = "effects/ffrg_boulder_land_D.png",
    NumFrames = 7,
    Lengths = {0.13,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand1_3 = Animation:new{
    Image = "effects/ffrg_boulder_land_L.png",
    NumFrames = 7,
    Lengths = {0.13,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand2_0 = Animation:new{
    Image = "effects/ffrg_boulder_land_U.png",
    NumFrames = 7,
    Lengths = {0.31,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand2_1 = Animation:new{
    Image = "effects/ffrg_boulder_land_R.png",
    NumFrames = 7,
    Lengths = {0.31,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand2_2 = Animation:new{
    Image = "effects/ffrg_boulder_land_D.png",
    NumFrames = 7,
    Lengths = {0.31,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}
ANIMS.ffrg_BoulderLand2_3 = Animation:new{
    Image = "effects/ffrg_boulder_land_L.png",
    NumFrames = 7,
    Lengths = {0.31,0.02,0.02,0.02,0.02,0.02,0.02},
    PosX = -32,
    PosY = -52
}

ANIMS.exploupheaval_0 = Animation:new{
    Image = "effects/ffrg_exploupheaval_U.png",
    NumFrames = 11,
    Lengths = {0.04,0.04,0.04,0.04,0.12,0.04,0.04,0.04,0.04,0.04,0.04},
    PosX = -16,
    PosY = 5
}
ANIMS.exploupheaval_1 = Animation:new{
    Image = "effects/ffrg_exploupheaval_R.png",
    NumFrames = 11,
    Lengths = {0.04,0.04,0.04,0.04,0.12,0.04,0.04,0.04,0.04,0.04,0.04},
    PosX = -19,
    PosY = 1
}
ANIMS.exploupheaval_2 = Animation:new{
    Image = "effects/ffrg_exploupheaval_D.png",
    NumFrames = 11,
    Lengths = {0.04,0.04,0.04,0.04,0.12,0.04,0.04,0.04,0.04,0.04,0.04},
    PosX = -20,
    PosY = 0
}
ANIMS.exploupheaval_3 = Animation:new{
    Image = "effects/ffrg_exploupheaval_L.png",
    NumFrames = 11,
    Lengths = {0.04,0.04,0.04,0.04,0.12,0.04,0.04,0.04,0.04,0.04,0.04},
    PosX = -20,
    PosY = 6
}


--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


----------------
-- Slab Flail --
----------------

ffrg_Prime_BoulderFlail = Skill:new{
    Name = "Boulder Flail",
    Description = "Bludgeon multiple tiles, slamming a Boulder onto and flipping the furthest hit tile.",
    Class = "Prime",
    Icon = "weapons/ffrg_prime_boulderflail.png",
    Explosion = "",
    PathSize = 3,
    StartSound = "weapons/boulder_throw",
    LinkSound = "",
    Sound = "/impact/dynamic/rock",
    Damage = 1,
    Upgrades = 2,
    UpgradeCost = {2,2},
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,1)
    }
}

ffrg_Prime_BoulderFlail_A = ffrg_Prime_BoulderFlail:new{
    UpgradeDescription = "Increases damage by 1.",
    Damage = 2,
}
ffrg_Prime_BoulderFlail_B = ffrg_Prime_BoulderFlail:new{
    UpgradeDescription = "Increases damage by 1.",
    Damage = 2,
}
ffrg_Prime_BoulderFlail_AB = ffrg_Prime_BoulderFlail:new{
    Damage = 3,
}

Weapon_Texts.ffrg_Prime_BoulderFlail_Upgrade1 = "+1 Damage"
Weapon_Texts.ffrg_Prime_BoulderFlail_Upgrade2 = "+1 Damage"


function ffrg_Prime_BoulderFlail:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, self.PathSize do
			local curr = DIR_VECTORS[i]*k + point
			ret:push_back(curr)
			if not Board:IsValid(curr) then
				break
			end
		end
	end

	return ret
end

function ffrg_Prime_BoulderFlail:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local timingData = {}

    ret:AddDamage(SoundEffect(p1,self.StartSound))

    if distance == 1 then
        timingData = {0.28}
    elseif distance == 2 then
        timingData = {0.11, 0.21}
    elseif distance == 3 then
        timingData = {0.11, 0.17, 0.21}
    end

    ret:AddAnimation(p2,"ffrg_BoulderLand"..(distance-1).."_"..direction, ANIM_NO_DELAY)
    if distance > 1 then
        ret:AddAnimation(p1+DIR_VECTORS[direction],"ffrg_Chain"..(distance-1).."_"..direction, ANIM_NO_DELAY)
    end
    --Attack animations other than the boulder getting shattered are handled independently

    for i = 1, distance do
        point = p1 + DIR_VECTORS[direction]*i
        ret:AddDelay(timingData[i])
        damage = SpaceDamage(point, self.Damage)
        if i == distance then
            if Board:IsValid(point) and not Board:IsBlocked(point,PATH_PROJECTILE) then
                damage.sPawn = "RockThrown"
                damage.iDamage = 0
                ret:AddBurst(point,"Emitter_Burst_$tile",DIR_NONE)
            else
                damage.sAnimation = "rock1d"
                damage.iPush = DIR_FLIP
            end
            damage.sSound = self.Sound
            ret:AddBounce(point, 4)
            ret:AddDamage(damage)
        else
            damage.sSound = self.LinkSound
            ret:AddBounce(point, 2)
            ret:AddDamage(damage)
            ret:AddBurst(point,"Emitter_Crack_Start2",DIR_NONE)
        end
    end

	return ret
end


-----------------------
-- Myriad Appendages --
-----------------------

ffrg_Prime_TC_MultiToss = Skill:new{
    Name = "Myriad Appendages",
    Description = "Throw all adjacent units in any direction and damage them. Damage self",
    Class = "Prime",
    Icon = "weapons/ffrg_prime_TC_multitoss.png",
    Explosion = "",
    PathSize = 1,
    Range = 3,
    Damage = 2,
    SelfDamage = 1,
    Sound = "/weapons/shift",
    FinalSound = "/weapons/shift",
    SelfSound = "/impact/generic/explosion_large",
    Rarity = 2,
    Upgrades = 2,
    Limited = 2,
    TwoClick = true,
    UpgradeCost = {1,1},
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,4),
        Enemy2 = Point(2,2),
        Enemy3 = Point(3,3),
        Target = Point(2,4),
        Second_Click = Point(2,2),
        Length = 5
    }
}

ffrg_Prime_TC_MultiToss_A = ffrg_Prime_TC_MultiToss:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 3
}
ffrg_Prime_TC_MultiToss_B = ffrg_Prime_TC_MultiToss:new{
    UpgradeDescription = "Increases damage to self and targets by 1.",
    Damage = 3,
    SelfDamage = 2
}
ffrg_Prime_TC_MultiToss_AB = ffrg_Prime_TC_MultiToss:new{
    Limited = 3,
    Damage = 3,
    SelfDamage = 2
}

Weapon_Texts.ffrg_Prime_TC_MultiToss_Upgrade1 = "+1 Use"
Weapon_Texts.ffrg_Prime_TC_MultiToss_Upgrade2 = "+1 Damage Each"

function ffrg_Prime_TC_MultiToss:GetTargetArea(point)
	local ret = PointList()
    for i = DIR_START, DIR_END do
        local curr = point + DIR_VECTORS[i]
        ret:push_back(curr)
    end
	return ret
end

function ffrg_Prime_TC_MultiToss:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    for i = DIR_START, DIR_END do
        local curr = p1 + DIR_VECTORS[i]
        local bigThrow = false
        if curr == p2 then bigThrow = true end

        if Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() then
            local freeSpaces = self.Range*4
            for j = DIR_START, DIR_END do
                for k = 1, self.Range do
                    local curr2 = curr + DIR_VECTORS[j]*k
                    if not Board:IsValid(curr2) or Board:IsBlocked(curr2, PATH_FLYER) then
                        if Board:IsValid(curr2) and Board:IsPawnSpace(curr2) and not Board:GetPawn(curr2):IsGuarding() and ( curr2 == p1 + Point(1,0) or curr2 == p1 + Point(-1,0) or curr2 == p1 + Point(0,1) or curr2 == p1 + Point(0,-1) ) then
                            curr3 = curr2 + DIR_VECTORS[j]*k
                            if not Board:IsValid(curr3) or Board:IsBlocked(curr3, PATH_FLYER) then
                                freeSpaces = freeSpaces - 1
                                if bigThrow then
                                    local block_image = SpaceDamage(curr2,0)
                                    block_image.sImageMark = "advanced/combat/icons/icon_throwblocked_glow.png"
                                    ret:AddDamage(block_image)
                                end
                            end
                        else
                            freeSpaces = freeSpaces - 1
                            if bigThrow then
                                local block_image = SpaceDamage(curr2,0)
                                block_image.sImageMark = "advanced/combat/icons/icon_throwblocked_glow.png"
                                ret:AddDamage(block_image)
                            end
                        end
                    end
                end
            end
            local damage = SpaceDamage(curr,0)
            if freeSpaces > 0 then
                if bigThrow then
                    damage.sImageMark = "combat/ffrg_throw_universal.png"
                else
                    damage.sImageMark = "combat/ffrg_throw_universal_small.png"
                end
            else
                if bigThrow then
                    damage.sImageMark = "combat/ffrg_throw_universal_off.png"
                else
                    damage.sImageMark = "combat/ffrg_throw_universal_small_off.png"
                end
            end
            ret:AddDamage(damage)
        else
            local damage = SpaceDamage(curr,0)
            if bigThrow then
                damage.sImageMark = "combat/ffrg_throw_universal_off.png"
            else
                damage.sImageMark = "combat/ffrg_throw_universal_small_off.png"
            end
            ret:AddDamage(damage)
        end
    end
	return ret
end

function ffrg_Prime_TC_MultiToss:GetSecondTargetArea(p1, p2)
	local ret = PointList()
	local offset = GetDirection(p2 - p1)

    if not Board:IsPawnSpace(p2) or Board:GetPawn(p2):IsGuarding() then
        return ret
	end

	for i = 1, self.Range do
        for j = DIR_START, DIR_END do
            local curr = p2 + DIR_VECTORS[j]*i
            if Board:IsValid(curr) and not Board:IsBlocked(curr, PATH_FLYER) then
                ret:push_back(curr)
            elseif Board:IsValid(curr) and Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() and ( curr == p1 + Point(1,0) or curr == p1 + Point(-1,0) or curr == p1 + Point(0,1) or curr == p1 + Point(0,-1) ) then
                curr2 = curr + DIR_VECTORS[j]*i
                if Board:IsValid(curr2) and not Board:IsBlocked(curr2, PATH_FLYER) then
                    ret:push_back(curr)
                end
            end
        end
	end

	return ret
end

function ffrg_Prime_TC_MultiToss:GetFinalEffect(p1, p2, p3)
    local ret = SkillEffect()
    local direction = GetDirection(p3 - p2)
    local distance = p2:Manhattan(p3)
    local throws = {
        front = false,
        sides = false,
        back = false
    }

    for i = DIR_START, DIR_END do
        local curr = p1 + DIR_VECTORS[i]
        local curr2 = curr + DIR_VECTORS[direction]*distance
        local damage = SpaceDamage(curr, 0)
        if Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() and Board:IsValid(curr2) and not Board:IsBlocked(curr2, PATH_FLYER) then
            damage.sImageMark = "advanced/combat/throw_"..direction..".png"
            if GetDirection(curr - p1) == direction then
                throws.front = true
            elseif GetDirection(p1 - curr) == direction then
                throws.back = true
            else
                throws.sides = true
            end
        elseif Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() and Board:IsValid(curr2) and Board:IsPawnSpace(curr2) and not Board:GetPawn(curr2):IsGuarding() and ( curr2 == p1 + Point(1,0) or curr2 == p1 + Point(-1,0) or curr2 == p1 + Point(0,1) or curr2 == p1 + Point(0,-1) ) then
            curr3 = curr2 + DIR_VECTORS[direction]*distance
            if Board:IsValid(curr3) and not Board:IsBlocked(curr3, PATH_FLYER) then
                damage.sImageMark = "advanced/combat/throw_"..direction..".png"
                if GetDirection(curr - p1) == direction then
                    throws.front = true
                elseif GetDirection(p1 - curr) == direction then
                    throws.back = true
                else
                    throws.sides = true
                end
            else
                damage.sImageMark = "advanced/combat/throw_"..direction.."_off.png"
            end
        else
            damage.sImageMark = "advanced/combat/throw_"..direction.."_off.png"
            if Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() then
                local block_image = SpaceDamage(curr2,0)
                block_image.sImageMark = "advanced/combat/icons/icon_x_glow.png"
                ret:AddDamage(block_image)
            end
        end
        ret:AddDamage(damage)
    end
    local tosses = 0
    local enemy_tosses = 0
    if throws.front == true then
        tosses = tosses + 1
    end
    if throws.sides == true then
        tosses = tosses + 1
    end
    if throws.back == true then
        tosses = tosses + 1
    end

    local impacts = {}
    local ignition = SpaceDamage(p1, self.SelfDamage)
    ignition.sAnimation = "ExploAir2"
    ignition.sSound = self.SelfSound
    ignition.fDelay = 0
    if throws.front == true then
        curr = p1 + DIR_VECTORS[direction]
        curr2 = curr + DIR_VECTORS[direction]*distance
        local damage = SpaceDamage(curr,0)
        ret:AddMelee(p1, damage, 0.15)
        table.insert(impacts,0.15)
        if tosses == 1 then
            ret:AddDamage(SoundEffect(p1,self.FinalSound))
        else
            ret:AddDamage(SoundEffect(p1,self.Sound))
        end
        ret:AddBounce(p1,3)
        ret:AddBounce(curr,-4)
        local move = PointList()
        move:push_back(curr)
        move:push_back(curr2)
        ret:AddLeap(move,NO_DELAY)
        if Board:GetPawnTeam(curr) == TEAM_ENEMY then
            enemy_tosses = enemy_tosses + 1
        end
        table.insert(impacts,curr2)
    end
    if throws.sides == true then
        local sideThrows = {}
        for i = DIR_START, DIR_END do
            local curr = p1 + DIR_VECTORS[i]
            if curr ~= p1 + DIR_VECTORS[direction] and curr ~= p1 - DIR_VECTORS[direction] then
                local curr2 = curr + DIR_VECTORS[direction]*distance
                if Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding() and Board:IsValid(curr2) and not Board:IsBlocked(curr2, PATH_FLYER) then
                    table.insert(sideThrows,curr)
                end
            end
        end
        if #sideThrows == 2 then
            ret:AddDelay(0.15)
            table.insert(impacts,0.15)
            if throws.back == false then
                ret:AddDamage(SoundEffect(p1,self.FinalSound))
            else
                ret:AddDamage(SoundEffect(p1,self.Sound))
            end
            ret:AddBounce(p1,6)
            for _, curr in ipairs(sideThrows) do
                local curr2 = curr + DIR_VECTORS[direction]*distance
                ret:AddBounce(curr,-4)
                local move = PointList()
                move:push_back(curr)
                move:push_back(curr2)
                ret:AddLeap(move,NO_DELAY)
                if Board:GetPawnTeam(curr) == TEAM_ENEMY then
                    enemy_tosses = enemy_tosses + 1
                end
                table.insert(impacts,curr2)
            end
        else
            local curr = sideThrows[1]
            local curr2 = curr + DIR_VECTORS[direction]*distance
            local damage = SpaceDamage(curr,0)
            ret:AddMelee(p1, damage, 0.15)
            table.insert(impacts,0.15)
            if throws.back == false then
                ret:AddDamage(SoundEffect(p1,self.FinalSound))
            else
                ret:AddDamage(SoundEffect(p1,self.Sound))
            end
            ret:AddBounce(p1,3)
            ret:AddBounce(curr,-4)
            local move = PointList()
            move:push_back(curr)
            move:push_back(curr2)
            ret:AddLeap(move,NO_DELAY)
            if Board:GetPawnTeam(curr) == TEAM_ENEMY then
                enemy_tosses = enemy_tosses + 1
            end
            table.insert(impacts,curr2)
        end
    end
    if throws.back == true then
        curr = p1 - DIR_VECTORS[direction]
        curr2 = curr + DIR_VECTORS[direction]*distance
        local damage = SpaceDamage(curr,0)
        ret:AddMelee(p1, damage, 0.15)
        table.insert(impacts,0.15)
        ret:AddDamage(SoundEffect(p1,self.FinalSound))
        ret:AddBounce(p1,3)
        ret:AddBounce(curr,-4)
        local move = PointList()
        move:push_back(curr)
        move:push_back(curr2)
        ret:AddLeap(move,NO_DELAY)
        if Board:GetPawnTeam(curr) == TEAM_ENEMY then
            enemy_tosses = enemy_tosses + 1
        end
        table.insert(impacts,curr2)
    end

    ret:AddDamage(ignition)

    if tosses == 1  then
        ret:AddDelay(0.6)
    elseif tosses == 2 then
        ret:AddDelay(0.45)
    elseif tosses == 3 then
        ret:AddDelay(0.3)
    end

    for _, curr in ipairs(impacts) do
        if type(curr) == "number" then
            ret:AddDelay(curr)
        else
            ret:AddDamage(SpaceDamage(curr,self.Damage))
            ret:AddBurst(curr,"Emitter_Crack_Start2",DIR_NONE)
            ret:AddBounce(curr,4)
        end
    end

    if enemy_tosses > 2 then
        ret:AddScript("ffrg_Frenzy_HerculeanGet()")
    end

	return ret
end


---------------------
-- Scything Blades --
---------------------

ffrg_Brute_SawCharge = Skill:new{
    Name = "Scything Blades",
    Description = "Charge forwards, damaging and flipping adjacent tiles. Ignite self.",
    Class = "Brute",
    Icon = "weapons/ffrg_brute_sawcharge.png",
    Damage = 1,
    OuterAnimation = "ffrg_Saw1",
    IgniteAnimation = "explo_fire1",
    BuildingDamage = true,
    ChargeSound = "weapons/charge",
    SawSound = "/support/shield/death",
    IgniteSound = "impact/generic/explosion",
    Upgrades = 2,
    UpgradeCost = {1,3},
    TipImage = {
        Unit = Point(2,3),
        Building = Point(3,1),
        Enemy = Point(3,2),
        Enemy2 = Point(1,1),
        Target = Point(2,0)
    }
}

ffrg_Brute_SawCharge_A = ffrg_Brute_SawCharge:new{
    UpgradeDescription = "Buildings will not take damage from this attack.",
    BuildingDamage = false,
}
ffrg_Brute_SawCharge_B = ffrg_Brute_SawCharge:new{
    UpgradeDescription = "Increases damage by 1.",
    Damage = 2,
}
ffrg_Brute_SawCharge_AB = ffrg_Brute_SawCharge:new{
    BuildingDamage = false,
    Damage = 2,
}

Weapon_Texts.ffrg_Brute_SawCharge_Upgrade1 = "Buildings Immune"
Weapon_Texts.ffrg_Brute_SawCharge_Upgrade2 = "+1 Damage"


function ffrg_Brute_SawCharge:GetTargetArea(point)
	local ret = PointList()

	for i = DIR_START, DIR_END do
		for k = 1, 8 do
			local curr = DIR_VECTORS[i]*k + point
			if Board:IsValid(curr) and not Board:IsBlocked(curr, Pawn:GetPathProf()) then
				ret:push_back(DIR_VECTORS[i]*k + point)
			else
				break
			end
		end
	end

	return ret
end

function ffrg_Brute_SawCharge:EvaluateBuildings(damage)
    if Board and Board:IsBuilding(damage.loc) and not self.BuildingDamage then
        damage.iDamage = DAMAGE_ZERO
        damage.iPush = 4
    else
        damage.iDamage = self.Damage
        damage.iPush = DIR_FLIP
    end
end

function ffrg_Brute_SawCharge:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local dir = GetDirection(p2 - p1)
    local append = ""
    if dir == 0 or dir == 1 then append = "_Main"
    else append = "_Alt" end

	local distance = p1:Manhattan(p2)
    local damage = SpaceDamage(p1, self.Damage, DIR_FLIP)
    local anim = SpaceDamage(p1, 0)
    anim.bHide = true
    anim.sAnimation = self.OuterAnimation..append

    local ignition = SpaceDamage(p1,0)
    ignition.iFire = 1
    ignition.sAnimation = self.IgniteAnimation
    ignition.sSound = self.IgniteSound
    ret:AddDamage(SoundEffect(p1,self.ChargeSound))
    ret:AddDamage(ignition)
	ret:AddCharge(Board:GetSimplePath(p1, p2), NO_DELAY)
    local counter = true

    for i = 0, distance do
        local curr = p1 + DIR_VECTORS[dir]*i
        if counter then
            ret:AddDamage(SoundEffect(p2,self.SawSound))
            counter = false
        else
            counter = true
        end
        anim.loc = curr + DIR_VECTORS[(dir+1)%4]
        ret:AddDamage(anim)
        anim.loc = curr + DIR_VECTORS[(dir-1)%4]
        ret:AddDamage(anim)
		ret:AddDelay(0.06)
        ret:AddBounce(curr, -3)
        damage.loc = curr + DIR_VECTORS[(dir+1)%4]
        self:EvaluateBuildings(damage)
        ret:AddDamage(damage)
        damage.loc = curr + DIR_VECTORS[(dir-1)%4]
        self:EvaluateBuildings(damage)
        ret:AddDamage(damage)
	end

	return ret
end


-------------------
-- Rotary Cannon --
-------------------

ffrg_Brute_Rotary = Skill:new{
    Name = "Rotary Cannon",
    Description = "Fire multiple damaging projectiles in sequence.",
    Class = "Brute",
    PowerCost = 1,
    PathSize = INT_MAX,
    Icon = "weapons/ffrg_brute_rotary.png",
    ProjectileArt = "effects/ffrg_shot_bullet",
    FireSound = "/weapons/modified_cannons",
    HitSound = "/impact/generic/explosion",
    Upgrades = 2,
    Animation = "explopush1_",
    UpgradeCost = {1,3},
    Projectiles = 3,
    Damage2 = 1,
    Backblast = false,
    TipDamageCustom = "1x3",
    Delay = 0.18,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(2,0),
        Target = Point(2,1),
        CustomEnemy = "Digger1",
        Length = 5
    }
}

ffrg_Brute_Rotary_A = ffrg_Brute_Rotary:new{
    UpgradeDescription = "Push the tile behind the user.",
    Backblast = true,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(2,0),
        Enemy3 = Point(2,4),
        Target = Point(2,1),
        CustomEnemy = "Digger1",
        Length = 5
    }
}

ffrg_Brute_Rotary_B = ffrg_Brute_Rotary:new{
    UpgradeDescription = "Increases number of fired projectiles by 2.",
    Projectiles = 5,
    TipDamageCustom = "1x5",
    Delay = 0.16,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(2,0),
        Target = Point(2,1),
        CustomEnemy = "Scorpion1",
        Length = 5
    }
}

ffrg_Brute_Rotary_AB = ffrg_Brute_Rotary:new{
    Backblast = true,
    Projectiles = 5,
    TipDamageCustom = "1x5",
    Delay = 0.16,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(2,0),
        Enemy3 = Point(2,4),
        Target = Point(2,1),
        CustomEnemy = "Scorpion1",
        Length = 5
    }
}

Weapon_Texts.ffrg_Brute_Rotary_Upgrade1 = "Backblast"
Weapon_Texts.ffrg_Brute_Rotary_Upgrade2 = "+2 Projectiles"

function ffrg_Brute_Rotary:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local dir = GetDirection(p2 - p1)
    local backDir = GetDirection(p1 - p2)
    if self.Backblast then
        -- Adding bonus damage for the push preview with Force Amp
        if IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") then
            local back = p1+DIR_VECTORS[backDir]
            local back2 = p1+(DIR_VECTORS[backDir]*2)
            if Board:IsPawnSpace(back) and Board:IsBlocked(back2,PATH_FLYER) then
                local pawn = Board:GetPawn(back)
                if pawn:IsPushable() then
                    if pawn:GetTeam() == TEAM_ENEMY and not pawn:IsFrozen() and not pawn:IsShield() then
                        ffrg_SeriousDamage.AppendSeriousDamage(ret, 1, back, {type = "stupid", preview = true})
                    end
                    if Board:IsPawnSpace(back2) then
                        local pawn2 = Board:GetPawn(back2)
                        if pawn2:GetTeam() == TEAM_ENEMY and not pawn2:IsFrozen() and not pawn2:IsShield() then
                            ffrg_SeriousDamage.AppendSeriousDamage(ret, 1, back2, {type = "stupid", preview = true})
                        end
                    end
                end
            end
        end

        local damage = SpaceDamage(p1+DIR_VECTORS[backDir], 0, backDir)
        damage.fDelay = 0
        damage.sAnimation = "airpush_"..backDir
        ret:AddDamage(damage)
    end

    ffrg_Multihit.MultihitProjectile(self.Damage2, self.Projectiles, p1, dir, {ret = ret, origin = p1, push = false, mode = "simple", delay = self.Delay, sfx_fire = self.FireSound, sfx_hit = self.HitSound, proj_art = self.ProjectileArt, anim = self.Animation, anim_directional = "forwards"})

    return ret
end


------------------------
-- Bastion Dispensary --
------------------------

ffrg_Ranged_DeployBastion = LineArtillery:new{
    Name = "Bastion Dispensary",
    Description = "Deploy a Bastion at range, pushing adjacent tiles.",
    Class = "Ranged",
    Icon = "weapons/ffrg_ranged_deploybastion.png",
    Explosion = "",
    OuterAnimation = "airpush_",
    LaunchSound = "/props/factory_launch",
    WhooshSound = "/props/boulder_fall",
    ImpactSound = "/impact/generic/mech",
    Deployed = "ffrg_Bastion",
    Projectile = "effects/ffrg_shotup_bastion.png",
    ArtilleryHeight = 24,
    Limited = 2,
    Push = 1,
    Upgrades = 2,
    UpgradeCost = {1,1},
    TipImage = {
        Unit = Point(2,3),
        Friendly = Point(1,1),
        Enemy = Point(3,1),
        Target = Point(2,1),
        Length = 5
    }
}

ffrg_Ranged_DeployBastion_A = ffrg_Ranged_DeployBastion:new{
    UpgradeDescription = "Increases deployed Bastions' move to 3.",
    Deployed = "ffrg_BastionA",
}
ffrg_Ranged_DeployBastion_B = ffrg_Ranged_DeployBastion:new{
    UpgradeDescription = "Grant deployed Bastions the Armored trait.",
    Deployed = "ffrg_BastionB",
}
ffrg_Ranged_DeployBastion_AB = ffrg_Ranged_DeployBastion:new{
    Deployed = "ffrg_BastionAB",
}

Weapon_Texts.ffrg_Ranged_DeployBastion_Upgrade1 = "+1 Move"
Weapon_Texts.ffrg_Ranged_DeployBastion_Upgrade2 = "Armored"


function ffrg_Ranged_DeployBastion:GetTargetArea(point)
	local ret = PointList()

	for dir = DIR_START, DIR_END do
		for i = 2, self.ArtillerySize do
			local curr = Point(point + DIR_VECTORS[dir] * i)
			if not Board:IsValid(curr) then
				break
			end

			if not Board:IsBlocked(curr, PATH_FLYER) then
				ret:push_back(curr)
			end

		end
	end

	return ret
end


function ffrg_Ranged_DeployBastion:GetSkillEffect(p1, p2)

    local ret = SkillEffect()
    local damage = SpaceDamage(p2,0)
    damage.sPawn = self.Deployed
    damage.sAnimation = "nil"
    ret:AddDamage(SoundEffect(p1,self.WhooshSound))
    ret:AddDelay(0.12)
    ret:AddBounce(p1, 2)
    ret:AddArtillery(damage,self.Projectile)
    ret:AddBounce(p2, 3)
    ret:AddBurst(p2,"Emitter_Burst_$tile",DIR_NONE)

    for dir = 0, 3 do
        point = p2 + DIR_VECTORS[dir]
        damage = SpaceDamage(point,0)
        damage.iPush = dir
        damage.sAnimation = self.OuterAnimation..dir
        ret:AddDamage(damage)
    end

    return ret
end


------------------------
-- Maintenance Mortar --
------------------------

ffrg_Ranged_TC_Maintenance = LineArtillery:new{
    Name = "Maintenance Mortar",
    Description = "Fire artilleries that push 4 tiles in a spiral and repair Allies.",
    Class = "Ranged",
    Icon = "weapons/ffrg_ranged_TC_maintenance.png",
    Animation = "airpush_",
    Explosion = "ExploArt0",
    FireSound = "/weapons/scatter_shot",
    ImpactSound = "/impact/generic/bombling_land",
    Projectile = "effects/ffrg_shotup_maintenance.png",
    Amount = -1,
    ShieldAlly = false,
    TwoClick = true,
    Push = 1,
    Upgrades = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,4),
        Friendly = Point(2,2),
        Enemy = Point(3,1),
        Enemy2 = Point(1,1),
        Target = Point(2,1),
        Second_Click = Point(3,3),
        Length = 5
    }
}

ffrg_Ranged_TC_Maintenance_A = ffrg_Ranged_TC_Maintenance:new{
    UpgradeDescription = "Increases the healing of the Repair by 1.",
    Amount = -2
}
ffrg_Ranged_TC_Maintenance_B = ffrg_Ranged_TC_Maintenance:new{
    UpgradeDescription = "Shield any Allied units affected by this skill.",
    ShieldAlly = true,
}
ffrg_Ranged_TC_Maintenance_AB = ffrg_Ranged_TC_Maintenance:new{
    Amount = -2,
    ShieldAlly = true,
}

Weapon_Texts.ffrg_Ranged_TC_Maintenance_Upgrade1 = "+1 Repair"
Weapon_Texts.ffrg_Ranged_TC_Maintenance_Upgrade2 = "Shield Ally"


function ffrg_Ranged_TC_Maintenance:GetSkillEffect(p1, p2)
    local ret = SkillEffect()

    for i = DIR_START, DIR_END do
        local curr = p2 + DIR_VECTORS[i]
        local damage = SpaceDamage(curr,0)
        damage.iPush = 5
        if Board:IsValid(curr) and Board:IsPawnTeam(curr,TEAM_PLAYER) then
            damage.iDamage = self.Amount
            if self.ShieldAlly then
                if Board:GetPawn(curr):IsShield() then
                    damage.sImageMark = "combat/icons/ffrg_icon_shield_heal_miss_glow.png"
                else
                    damage.sImageMark = "combat/icons/ffrg_icon_shield_heal_glow.png"
                end
            end
        end
        ret:AddDamage(damage)
    end

    local pdamage = SpaceDamage(p2,0)
    pdamage.sAnimation = "nil"
    ret:AddArtillery(pdamage, "", NO_DELAY)

    return ret
end

function ffrg_Ranged_TC_Maintenance:GetSecondTargetArea(p1, p2)
    local ret = PointList()

    for _, i in ipairs({Point(1,2), Point(1,-2), Point(-1,2), Point(-1,-2), Point(2,1), Point(2,-1), Point(-2,1), Point(-2,-1)}) do
        local curr = p2 + i
        if Board:IsValid(curr) then
            ret:push_back(curr)
        end
    end

    return ret
end

function ffrg_Ranged_TC_Maintenance:GetFinalEffect(p1, p2, p3)
    local ret = SkillEffect()
    local rot = 1
    if p3 - p2 == Point(1,2) or p3 - p2 == Point(-1,-2) or p3 - p2 == Point(2,-1) or p3 - p2 == Point(-2,1) then
        rot = -1
    end
    ret:AddDamage(SoundEffect(p1,self.FireSound))
    ret:AddBounce(p1, 3)
    local loops = 0
    for i = DIR_START, DIR_END do
        local curr = p2 + DIR_VECTORS[i]
        if Board:IsValid(curr) then
            local shield = false
            if loops ~= 0 then
                ret:AddDelay(0.1)
            end
            local damage = SpaceDamage(curr,0)
            if Board:IsPawnTeam(curr,TEAM_PLAYER) then
                damage.iDamage = self.Amount
                damage.iFire = EFFECT_REMOVE
                damage.iAcid = EFFECT_REMOVE
                if self.ShieldAlly then
                    if Board:GetPawn(curr):IsShield() then
                        damage.sImageMark = "combat/icons/ffrg_icon_shield_heal_miss_glow.png"
                    else
                        damage.sImageMark = "combat/icons/ffrg_icon_shield_heal_glow.png"
                    end
                    shield = true
                end
            end
            local j = i + rot
            if j == 4 then
                j = 0
            end
            if j == -1 then
                j = 3
            end
            damage.iPush = j
            damage.bHidePath = true
            damage.sAnimation = self.Animation..j
            ret:AddArtillery(damage, self.Projectile, NO_DELAY)
            loops = loops + 1
            if shield then
                local sdamage = SpaceDamage(curr,0)
                sdamage.iShield = 1
                sdamage.bHide = true
                sdamage.sAnimation = "nil"
                ret:AddArtillery(sdamage, "nil", NO_DELAY)
            end
        end
    end
    if loops > 0 then
        local pdamage = SpaceDamage(p2,0)
        pdamage.sAnimation = "nil"
        ret:AddArtillery(pdamage, "", NO_DELAY)
        ret:AddDelay(0.75)
    end

    return ret
end


--------------------
-- Mass Processor --
--------------------

ffrg_Science_KO_Shred = Skill:new{
    Name = "Mass Processor",
    Icon = "weapons/ffrg_science_shred.png",
    Description = "Damage an adjacent tile. If target is killed, Supply all Mechs.",
    Class = "Science",
    OnKill = "Supply all Mechs",
    PathSize = 1,
    Damage2 = 1,
    TipDamageCustom = "1",
    Attacks = 1,
    Sound = "/weapons/crack",
    Animation = "ffrg_Swipe2",
    AlternateAnimation = "ffrg_Swipe1",
    Upgrades = 1,
    UpgradeCost = {3},
    TipImage = {
        Unit = Point(3,2),
        Friendly = Point(1,2),
        Enemy = Point(3,1),
        Target = Point(3,1),
        CustomEnemy = "Leaper1",
        Length = 5,
    }
}

ffrg_Science_KO_Shred_A = ffrg_Science_KO_Shred:new{
    UpgradeDescription = "Damages the target an additional time.",
    Attacks = 2,
    TipDamageCustom = "1x2",
    TipImage = {
        Unit = Point(3,2),
        Friendly = Point(1,2),
        Enemy = Point(3,1),
        Target = Point(3,1),
        CustomEnemy = "Digger1",
        Length = 5,
    }
}

Weapon_Texts.ffrg_Science_KO_Shred_Upgrade1 = "+1 Attack"


function ffrg_Science_KO_Shred:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    if ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2, {mode = "ko", origin = p1, ret = ret, delay = 0.2, sfx = self.Sound, anim = self.Animation, anim_alt = self.AlternateAnimation}) then
        for i = 0, 7 do
            for j = 0, 7  do
                local point = Point(i,j)
                if Board:IsPawnSpace(point) and Board:GetPawn(point):IsMech() and ffrg_Supply.SupplyIndex(p1, point, tostring(self)) > 0 then
                    ret:AddDelay(0.2)
                    ffrg_Supply.Supply(p1,point,ret)
                end
            end
        end
    end
    return ret
end


-------------------------
-- Long-Range Teleport --
-------------------------

ffrg_Science_TC_LongTele = Skill:new{
    Name = "Long-Range Teleport",
    Class = "Science",
    Icon = "weapons/ffrg_science_TC_longtele.png",
    Description = "Teleport a unit within range to any open tile on the board.",
    LaunchSound = "/weapons/enhanced_tractor",
    ImpactSound = "/weapons/force_swap",
    TwoClick = true,
    Range = 2,
    Hurt = false,
    Damage = 0,
    Limited = 1,
    Upgrades = 2,
    Rarity = 2,
    UpgradeCost = { 1, 2 },
    TipImage = {
        Unit = Point(3,3),
        Target = Point(3,1),
        Enemy = Point(3,1),
        Water = Point(1,2),
        Second_Click = Point(1,2),
        Length = 5,
    }
}

ffrg_Science_TC_LongTele_A = ffrg_Science_TC_LongTele:new{
    UpgradeDescription = "Deals 2 damage to teleported enemies.",
    Hurt = true,
    Damage = 2,
    TipImage = {
        Unit = Point(3,3),
        Target = Point(3,1),
        Enemy = Point(3,1),
        Forest = Point(1,2),
        Second_Click = Point(1,2),
        Length = 5,
    }
}
ffrg_Science_TC_LongTele_B = ffrg_Science_TC_LongTele:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 2,
}
ffrg_Science_TC_LongTele_AB = ffrg_Science_TC_LongTele:new{
    Hurt = true,
    Damage = 2,
    Limited = 2,
    TipImage = {
        Unit = Point(3,3),
        Target = Point(3,1),
        Enemy = Point(3,1),
        Forest = Point(1,2),
        Second_Click = Point(1,2),
        Length = 5,
    }
}

Weapon_Texts.ffrg_Science_TC_LongTele_Upgrade1 = "+2 Damage Enemy"
Weapon_Texts.ffrg_Science_TC_LongTele_Upgrade2 = "+1 Use"

function ffrg_Science_TC_LongTele:GetTargetArea(point)
	local ret = PointList()
	for dir = DIR_START, DIR_END do
		for range = 1, self.Range do
			local curr = point + DIR_VECTORS[dir]*range
			--if (Board:IsPawnSpace(curr) and not Board:GetPawn(curr):IsGuarding())
				ret:push_back(curr)
			--end
		end
	end

	return ret
end

function ffrg_Science_TC_LongTele:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local damage = SpaceDamage(p2, 0)
	if not Board:IsPawnSpace(p2) then
		damage.sImageMark = "advanced/combat/icons/icon_x_glow.png"
	elseif Board:GetPawn(p2):IsGuarding() then
		damage.sImageMark = "combat/icons/icon_guard_glow.png"
	else
		damage.sImageMark = "advanced/combat/icons/icon_teleport_glow.png"
	end
	ret:AddDamage(damage)

	return ret
end

function ffrg_Science_TC_LongTele:GetSecondTargetArea(p1, p2)

	local ret = PointList()

	if (not Board:IsPawnSpace(p2) or Board:GetPawn(p2):IsGuarding()) then
		return ret
	end

	local board_size = Board:GetSize()
	for i = 0, 7 do
		for j = 0, 7  do
			local point = Point(i,j) -- DIR_LEFT
			if (not Board:IsPawnSpace(point) and not Board:IsBuilding(point) and Board:GetTerrain(point) ~= TERRAIN_MOUNTAIN) and point ~= p2 and point ~= p1 then
				ret:push_back(point)
			end
		end
	end

	return ret

end

function ffrg_Science_TC_LongTele:GetFinalEffect(p1, p2, p3)
    local ret = SkillEffect()

    ret:AddTeleport(p2,p3, FULL_DELAY)

    if self.Hurt and Board:GetPawnTeam(p2) ~= TEAM_PLAYER then
		ret:AddDamage(SpaceDamage(p3,self.Damage))
	end

	return ret
end


-------------------
-- Invasive Warp --
-------------------

ffrg_Science_KO_Telefrag = Skill:new{
    Name = "Invasive Warp",
    Description = "Attempt to teleport to an open or occupied tile. If the tile is occupied, damage target. On kill, push adjacent tiles.",
    Class = "Science",
    OnKill = "Push adjacent",
    Icon = "weapons/ffrg_science_telefrag.png",
    Explosion = "",
    TeleAnimation = "ExploRepulseSmall",
    FragAnimation = "ExploRepulse1",
    OuterAnimation = "airpush_",
    Range = 7,
    TeleSound = "/weapons/force_swap",
    FailSound = "/weapons/science_enrage_attack",
    FragSound = "/weapons/phase_shot",
    Crack = false,
    Damage = 1,
    Rarity = 2,
    Upgrades = 2,
    PowerCost = 0,
    UpgradeCost = {1,3},
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(3,1),
        Target = Point(2,1),
        CustomEnemy = "Leaper1",
        Length = 5
    }
}

ffrg_Science_KO_Telefrag_A = ffrg_Science_KO_Telefrag:new{
    UpgradeDescription = "Cracks any tile that is successfully teleported from.",
    Crack = true
}
ffrg_Science_KO_Telefrag_B = ffrg_Science_KO_Telefrag:new{
    UpgradeDescription = "Increases damage by 2.",
    Damage = 3,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(3,1),
        Target = Point(2,1),
        CustomEnemy = "Scorpion1",
        Length = 6
    }
}
ffrg_Science_KO_Telefrag_AB = ffrg_Science_KO_Telefrag:new{
    Crack = true,
    Damage = 3,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(3,1),
        Target = Point(2,1),
        CustomEnemy = "Scorpion1",
        Length = 6
    }
}

Weapon_Texts.ffrg_Science_KO_Telefrag_Upgrade1 = "Add Cracking"
Weapon_Texts.ffrg_Science_KO_Telefrag_Upgrade2 = "+2 Damage"

function ffrg_Science_KO_Telefrag:GetTargetArea(point)
	local ret = PointList()
	for dir = DIR_START, DIR_END do
		for range = 1, self.Range do
			local curr = DIR_VECTORS[dir]*range + point
			if Board:IsValid(curr) then
                if Board:IsPawnSpace(curr) or ( not Board:IsBuilding(curr) and Board:GetTerrain(curr) ~= TERRAIN_MOUNTAIN ) then
                    ret:push_back(curr)
                end
            else
                break
            end
		end
	end

	return ret
end

function ffrg_Science_KO_Telefrag:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local damage_self = SpaceDamage(p1, 0)
    local damage_space = SpaceDamage(p1, 0)
    local damage_space_preview = SpaceDamage(p1, 0)
    local damage = SpaceDamage(p2, self.Damage)
    local clear = 0
    local id
    if Pawn then id = Pawn:GetId() end

    if Board:IsPawnSpace(p2) then
        clear = 1
        local pawn = Board:GetPawn(p2)
        if not Board:IsDeadly(damage,Pawn) or pawn:IsCorpse() then
            clear = 2
        end
    end

    if self.Crack and clear ~= 2 then
        damage_space.iCrack = EFFECT_CREATE
    end

    if clear == 0 then
        damage_self.sSound = self.TeleSound
        if self.Crack then
            damage_space.sImageMark = "combat/icons/ffrg_icon_teleport_cropped_glow.png"
        else
            damage_space.sImageMark = "advanced/combat/icons/icon_teleport_glow.png"
        end
        ret:AddDamage(damage_self)
        ret:AddTeleport(p1,p2,0)
        ret:AddDelay(0.4)
        ret:AddDamage(damage_space)
        if self.Crack then
            ret:AddBounce(p1,-1)
            ret:AddBoardShake(0.08)
        end
        ret:AddDelay(0.6)
    elseif clear == 1 then
        if Board:IsPawnSpace(p2) then
            local pawn = Board:GetPawn(p2)
            local pawnType = _G[pawn:GetType()]
            if pawnType.Tier and pawnType.Tier == TIER_BOSS then
                ret:AddScript("ffrg_Colossi_TelefragAdd()")
            end
        end

        if self.Crack and clear ~= 2 then
            damage_space_preview.iCrack = EFFECT_CREATE
        end
        damage.sAnimation = self.FragAnimation
        damage.sSound = self.FragSound
        if self.Crack then
            damage_space_preview.sImageMark = "combat/icons/ffrg_icon_teleport_cropped_glow.png"
        else
            damage_space_preview.sImageMark = "advanced/combat/icons/icon_teleport_glow.png"
        end
        damage_space.bHide = true
        damage.bKO_Effect = true
        damage.sImageMark = "combat/icons/ffrg_icon_telefrag_glow.png"
        damage_self.sSound = self.TeleSound
        ret:AddDamage(damage_self)
        ret:AddScript(string.format("ffrg_Science_KO_Telefrag:TeleportHidden(%s,%s)", p1:GetString(), p2:GetString()))
        ret:AddDelay(0.4)
        ret:AddDamage(damage_space)
        if self.Crack then
            ret:AddBounce(p1,-1)
            ret:AddBoardShake(0.08)
        end
        ret:AddDelay(0.25)
        if id then
            ret:AddScript("Board:GetPawn("..id.."):SetSpace("..p1:GetString()..")")
        end
        ret:AddDamage(damage)
        if id then
            ret:AddScript("Board:GetPawn("..id.."):SetSpace("..p2:GetString()..")")
        end
        for dir = 0, 3 do
            point = p2 + DIR_VECTORS[dir]
            local damage_outer = SpaceDamage(point,0)
            damage_outer.sAnimation = self.OuterAnimation..dir
            if point ~= p1 then
                damage_outer.iPush = dir
            end
            ret:AddDamage(damage_outer)
        end
        ret:AddDelay(0.25)
        ret:AddTeleport(p1,p1,0)
        ret:AddDamage(damage_space_preview)
        ret:AddDelay(0.75)
    else
        damage_self.sImageMark = "combat/icons/ffrg_icon_teleport_fail_glow.png"
        damage.sAnimation = self.TeleAnimation
        damage.sSound = self.FailSound
        ret:AddDamage(damage)
        ret:AddDamage(damage_self)
    end

	return ret
end

function ffrg_Science_KO_Telefrag:TeleportHidden(p1,p2)
    local ret = SkillEffect()
    ret:AddTeleport(p1,p2,0)
    Board:AddEffect(ret)
end


-------------------
-- Upheaval Rail --
-------------------

ffrg_Science_TC_Upheaval = Skill:new{
    Name = "Upheaval Rail",
    Description = "Send a subterranean pulse that raises a wall of Slabs or pushes to either side.",
    Class = "Science",
    Icon = "weapons/ffrg_science_TC_upheaval.png",
    Explosion = "",
    Range = 3,
    TwoClick = true,
    StartSound = "mech/distance/bombling_mech/death",
    LaunchSound = "/props/ground_break_line",
    ShiftSound = "/impact/dynamic/rock",
    Limited = 1,
    Rarity = 2,
    Upgrades = 1,
    PowerCost = 0,
    UpgradeCost = {2},
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Target = Point(2,1),
        Second_Click = Point(3,2),
        Length = 6
    }
}

ffrg_Science_TC_Upheaval_A = ffrg_Science_TC_Upheaval:new{
    UpgradeDescription = "Removes the restriction on range.",
    Range = 7,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,0),
        Second_Click = Point(3,1),
        Length = 6
    }
}

Weapon_Texts.ffrg_Science_TC_Upheaval_Upgrade1 = "Unlimited Range"

local function direction_rotate(dir, rev)
    if rev then
        if dir ~= 3 then return dir + 1
        else return 0
        end
    else
        if dir ~= 0 then return dir - 1
        else return 3
        end
    end
end

function ffrg_Science_TC_Upheaval:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + point
			if not Board:IsValid(curr) then break end
			local terrain = Board:GetTerrain(curr)
            if terrain == TERRAIN_HOLE or terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA then break end
            ret:push_back(curr)
		end
	end

	return ret
end

function ffrg_Science_TC_Upheaval:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local bonus = 0

    for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + p1
			if not Board:IsValid(curr) then break end
			local terrain = Board:GetTerrain(curr)
            if terrain == TERRAIN_HOLE or terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA then
                local icon = SpaceDamage(curr,0)
                icon.sAnimation = ""
                icon.sImageMark = "combat/icons/ffrg_icon_burrow_central_miss.png"
                ret:AddDamage(icon)
                break
            end
		end
	end

    ret:AddBounce(p1, 6)
    ret:AddBoardShake(0.12)
    ret:AddDamage(SoundEffect(p1,self.StartSound))
    ret:AddBurst(p1,"Emitter_Crack_Start2",DIR_NONE)

    for i = 1, distance do
        local point = p1 + DIR_VECTORS[direction]*i
        local damage = SpaceDamage(point, 0)
        if Board:IsValid(point) then
            if not Board:IsBlocked(point,PATH_FLYER) then
                damage.sPawn = "ffrg_Slab1"
                damage.sAnimation = ""
                ret:AddDamage(damage)
            else
                damage.iPush = 5
                ret:AddDamage(damage)
            end
            ret:AddBurst(point,"Emitter_Crack_Start",DIR_NONE)
            ret:AddBounce(point, -2-(bonus*2))
            ret:AddBoardShake(0.15+(i*0.03))
            ret:AddDelay(0.90/(i+2))
        end
        bonus = bonus + 1
    end

	return ret
end

function ffrg_Science_TC_Upheaval:IsTwoClickException(p1,p2)
    local second_area = self:GetSecondTargetArea(p1,p2)
	if second_area:size() == 0 then
		return true
	end
	return false
end

function ffrg_Science_TC_Upheaval:GetSecondTargetArea(p1,p2)
    local ret = PointList()
    local direction = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local side = direction_rotate(direction)

    for i = 1, distance do
        local curr = p1 + ( DIR_VECTORS[direction] * i )
        if Board:IsBlocked(curr,PATH_FLYER) then
            local offs1 = curr + DIR_VECTORS[side]
            local offs2 = curr - DIR_VECTORS[side]
            if Board:IsValid(offs1) then
                ret:push_back(offs1)
            else
                ret:push_back(curr)
            end
            if Board:IsValid(offs2) then
                ret:push_back(offs2)
            else
                ret:push_back(curr)
            end
        end
    end

	return ret
end

function ffrg_Science_TC_Upheaval:GetFinalEffect(p1,p2,p3)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local bonus = 0
    local rotated
    local failshift = false

    local sidevec = DIR_VECTORS[direction_rotate(direction)]
    for i = 1, distance do
        local curr = p1 + DIR_VECTORS[direction]*i
        if curr + sidevec == p3 or curr - sidevec == p3 then
            rotated = GetDirection(p3 - curr)
            break
        elseif curr == p3 then
            failshift = true
            if Board:IsValid(curr - sidevec) then
                rotated = GetDirection(sidevec)
                break
            else
                rotated = GetDirection(Point(0,0) - sidevec)
                break
            end
        end
    end

    for i = DIR_START, DIR_END do
		for k = 1, self.Range do
			local curr = DIR_VECTORS[i]*k + p1
			if not Board:IsValid(curr) then break end
			local terrain = Board:GetTerrain(curr)
            if terrain == TERRAIN_HOLE or terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA then
                local icon = SpaceDamage(curr,0)
                icon.sAnimation = ""
                icon.sImageMark = "combat/icons/ffrg_icon_burrow_central_miss.png"
                ret:AddDamage(icon)
                break
            end
		end
	end

    ret:AddBounce(p1, 6)
    ret:AddBoardShake(0.12)
    ret:AddDamage(SoundEffect(p1,self.StartSound))
    ret:AddBurst(p1,"Emitter_Crack_Start2",DIR_NONE)

    for i = 1, distance do
        local point = p1 + DIR_VECTORS[direction]*i
        local damage = SpaceDamage(point, 0)
        if Board:IsValid(point) then
            if not Board:IsBlocked(point,PATH_FLYER) then
                damage.sPawn = "ffrg_Slab1"
                damage.sAnimation = ""
                ret:AddDamage(damage)
            else
                damage.iPush = rotated
                if not failshift and Board:IsPawnSpace(point) and not Board:GetPawn(point):IsGuarding() then
                    damage.sAnimation = "exploupheaval_"..rotated
                    damage.sSound = self.ShiftSound
                end
                ret:AddDamage(damage)
            end
            ret:AddBurst(point,"Emitter_Crack_Start",DIR_NONE)
            ret:AddBounce(point, -2-(bonus*2))
            ret:AddBoardShake(0.15+(i*0.03))
            ret:AddDelay(0.90/(i+2))
        end
        bonus = bonus + 1
    end

	return ret

end


-----------------------
-- Contingency Cache --
-----------------------

ffrg_Passive_Phoenix = PassiveSkill:new{
    Name = "Contingency Cache",
    Description = "Mechs revived from destruction are Boosted and Supplied.\nAll Pilots will survive Mech destruction.",
    Class = "",
    Icon = "weapons/ffrg_passive_phoenix.png",
    Passive = "Passive_Medical_Phoenix",
    TipImage = {
        Unit = Point(2,3),
        Friendly = Point(2,1),
        Friendly2 = Point(3,2),
        Friendly3 = Point(1,2),
        Target = Point(2,2),
        Length = 7
    }
}

function ffrg_Passive_Phoenix:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
    local damage1 = SpaceDamage(Point(2,3),DAMAGE_DEATH)
    local damage2 = SpaceDamage(Point(2,1),DAMAGE_DEATH)
    local damage3 = SpaceDamage(Point(3,2),DAMAGE_DEATH)
    local damage4 = SpaceDamage(Point(1,2),DAMAGE_DEATH)
    damage1.bHide = true
    damage2.bHide = true
    damage3.bHide = true
    damage4.bHide = true
    local damage5 = SpaceDamage(Point(2,3),-1)
    local damage6 = SpaceDamage(Point(2,1),-1)
    local damage7 = SpaceDamage(Point(3,2),-1)
    local damage8 = SpaceDamage(Point(1,2),-1)
    damage5.bHide = true
    damage6.bHide = true
    damage7.bHide = true
    damage8.bHide = true
    ret:AddDamage(damage1)
    ret:AddDamage(damage2)
    ret:AddDamage(damage3)
    ret:AddDamage(damage4)
    ret:AddDelay(0.75)
    pawn1 = Board:GetPawn(Point(2,3))
    pawn2 = Board:GetPawn(Point(2,1))
    pawn3 = Board:GetPawn(Point(3,2))
    ret:AddDamage(damage5)
    ffrg_Supply.Supply(Point(2,3),Point(2,3),ret,{hideIcon = true})
    ret:AddScript("ffrg_Passive_Phoenix:Boost(Point(2,3))")
    ret:AddDelay(0.5)
    ret:AddDamage(damage6)
    ffrg_Supply.Supply(Point(2,3),Point(2,1),ret,{hideIcon = true})
    ret:AddScript("ffrg_Passive_Phoenix:Boost(Point(2,1))")
    ret:AddDelay(0.5)
    ret:AddDamage(damage7)
    ffrg_Supply.Supply(Point(2,3),Point(3,2),ret,{hideIcon = true})
    ret:AddScript("ffrg_Passive_Phoenix:Boost(Point(3,2))")
    ret:AddDelay(0.5)
    ret:AddDamage(damage8)
    ffrg_Supply.Supply(Point(2,3),Point(1,2),ret,{hideIcon = true})
    ret:AddScript("ffrg_Passive_Phoenix:Boost(Point(1,2))")
	return ret
end

function ffrg_Passive_Phoenix:Boost(point)
    Board:GetPawn(point):SetBoosted(true)
end

local function ffrg_onPawnRevived(mission, pawn)
    if IsPassiveSkill("Passive_Medical_Phoenix") and pawn:IsMech() then
        pawn:SetBoosted(true)
        local point = pawn:GetSpace()
        if point then
            local index = ffrg_Supply.SupplyIndex(point,point)
            if index > 0 then
                Board:DamageSpace(ffrg_Supply.Supply(point,point,nil,{returnDamage = true, hideIcon = true}))
            end
        end
    end
end

modapiext.events.onPawnRevived:subscribe(ffrg_onPawnRevived)

--////////////////////////////////--





--////////////////////////////////--
--//        Modifications       //--
--////////////////////////////////--

-----------------
-- Prism Laser --
-----------------

Prime_PrismLaser.BuildingDamage = true

function Prime_PrismLaser:EnemyDamage(p1,point,damage)

    local temp_damage = damage

    if Board:IsPawnSpace(point) then
        if Board:IsPawnTeam(point, TEAM_ENEMY) then
            local target = Board:GetPawn(point)
            if Board:GetPawn(p1):IsBoosted() then
                temp_damage = temp_damage+1
            end
            if target:IsAcid() then
                temp_damage = temp_damage*2
            elseif target:IsArmor() then
                temp_damage = temp_damage-1
            end
            if target:IsFrozen() or target:IsShield() then
                temp_damage = 0
            end
            return temp_damage
        else
            return 0
        end
    else
        return 0
    end
end

function Prime_PrismLaser:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local point = p1 + DIR_VECTORS[direction]
    local damage = self.Damage
    local start = point - DIR_VECTORS[direction]
    local hit_vek = self.Damage
    local enemy_damage = 0

    ret:AddBounce(p1,2)
    while Board:IsValid(point) do
        ret:AddBounce(point,2)
        damage = math.max(1,hit_vek)

        local temp_damage = damage

        if not self.FriendlyDamage and Board:IsPawnTeam(point, TEAM_PLAYER) then
            temp_damage = DAMAGE_ZERO
        end

        if not self.BuildingDamage and Board:IsBuilding(point) then
            temp_damage = DAMAGE_ZERO
        end

        local dam = SpaceDamage(point, temp_damage)

        if Board:IsPawnSpace(point) or Board:IsBuilding(point) or Board:GetTerrain(point) == TERRAIN_MOUNTAIN then
            dam.sAnimation = "laser2_hit_a"..math.min(5,hit_vek)
        end

        if forced_end == point or Board:IsBuilding(point) or Board:GetTerrain(point) == TERRAIN_MOUNTAIN or not Board:IsValid(point + DIR_VECTORS[direction]) then
            if queued then
                ret:AddQueuedProjectile(dam,self.LaserArt)
            else
                ret:AddProjectile(start,dam,self.LaserArt,FULL_DELAY)
            end
            break
        else
            ret:AddDamage(dam)
        end
        enemy_damage = enemy_damage + Prime_PrismLaser:EnemyDamage(p1,point,temp_damage)

        if Board:IsPawnSpace(point) and damage < self.MaxDamage then
            hit_vek = hit_vek + 1
        end

        point = point + DIR_VECTORS[direction]
    end

    if enemy_damage > 13 then
        ret:AddScript("ffrg_Architects_SunGet()")
    end

    return ret
end

--////////////////////////////////--
