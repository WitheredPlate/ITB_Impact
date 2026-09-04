--////////////////////////////////--
--//   (Impact) Weapon Balance  //--
--////////////////////////////////--

--== Prime ==--
-- Prism Laser (++~)

--== Support ==--
-- Repair Drop (+)

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "effects/ffrg_laser2_hit_a2.png",
    "effects/ffrg_laser2_hit_a3.png",
    "effects/ffrg_laser2_hit_a4.png",
    "effects/ffrg_laser2_hit_a5.png",
    "effects/ffrg_shotdown_slab.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--Clean up the Prism Laser visuals a bit, it used to have large opaque sprites that just abruptly disappeared.

ANIMS.laser2_hit_a2.Image = "effects/ffrg_laser2_hit_a2.png"
ANIMS.laser2_hit_a2.NumFrames = 2
ANIMS.laser2_hit_a2.Time = nil
ANIMS.laser2_hit_a2.Lengths = {0.55,0.05}

ANIMS.laser2_hit_a3.Image = "effects/ffrg_laser2_hit_a3.png"
ANIMS.laser2_hit_a3.NumFrames = 3
ANIMS.laser2_hit_a3.Time = nil
ANIMS.laser2_hit_a3.Lengths = {0.6,0.05,0.05}

ANIMS.laser2_hit_a4.Image = "effects/ffrg_laser2_hit_a4.png"
ANIMS.laser2_hit_a4.NumFrames = 4
ANIMS.laser2_hit_a4.Time = nil
ANIMS.laser2_hit_a4.Lengths = {0.65,0.05,0.05,0.05}

ANIMS.laser2_hit_a5.Image = "effects/ffrg_laser2_hit_a5.png"
ANIMS.laser2_hit_a5.NumFrames = 5
ANIMS.laser2_hit_a5.Time = nil
ANIMS.laser2_hit_a5.Lengths = {0.7,0.05,0.05,0.05,0.05}

--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--

-----------------
-- Prism Laser --
-----------------

Prime_PrismLaser = LaserDefault:new{
    Class = "Prime",
    Icon = "advanced/weapons/Prime_PrismLaser.png",
    LaunchSound = "/weapons/prism_beam",
    LaserArt = "effects/laser2",
    Damage = 1,
    PowerCost = 0,
    MinDamage = 1,
    MaxDamage = 7,
    FriendlyDamage = true,
    BuildingDamage = true,
    Upgrades = 2,
    UpgradeCost = { 2, 2 },
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(2,0),
        Friendly = Point(2,2),
        Target = Point(2,2),
    }
}

function Prime_PrismLaser:EnemyDamage(p1,point,damage)

    local tempDamage = damage

    if Board:IsPawnSpace(point) then
        if Board:IsPawnTeam(point, TEAM_ENEMY) then
            local target = Board:GetPawn(point)
            if Board:GetPawn(p1):IsBoosted() then
                tempDamage = tempDamage+1
            end
            if target:IsAcid() then
                tempDamage = tempDamage*2
            elseif target:IsArmor() then
                tempDamage = tempDamage-1
            end
            if target:IsFrozen() or target:IsShield() then
                tempDamage = 0
            end
            return tempDamage
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

Prime_PrismLaser_A = Prime_PrismLaser:new{
    Damage = 2,
    MinDamage = 2,
    MaxDamage = 8,
}
Prime_PrismLaser_B = Prime_PrismLaser:new{
    BuildingDamage = false,
    TipImage = {
        Unit = Point(2,4),
        Building = Point(2,0),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Friendly = Point(2,3),
        Target = Point(2,2),
    }
}
Prime_PrismLaser_AB = Prime_PrismLaser:new{
    Damage = 2,
    MinDamage = 2,
    MaxDamage = 8,
    BuildingDamage = false,
    TipImage = {
        Unit = Point(2,4),
        Building = Point(2,0),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Friendly = Point(2,3),
        Target = Point(2,2),
    }
}

modApi:setText("Prime_PrismLaser_A_UpgradeDescription", "Beam starts at +1 damage.")
modApi:setText("Prime_PrismLaser_B_UpgradeDescription", "Buildings will not take damage from this attack.")
modApi:setText("Prime_PrismLaser_Upgrade1", "+1 Damage")
modApi:setText("Prime_PrismLaser_Upgrade2", "Buildings Immune")


-----------------
-- Repair Drop --
-----------------

Support_Repair = ffrg_CoordinatedStrike:new{
    Icon = "weapons/support_repair.png",
    PowerCost = 0,
    Limited = 1,
    Upgrades = 2,
    UpgradeCost = {2,2},
    ZoneTargeting = ZONE_ALL,
    CustomTipImage = "Support_Repair_Tooltip",
    AircraftArt = "units/mission/drone_1.png",
    AircraftSound = "weapons/airstrike",
    Repair = 10,
    Supply = false
}

Support_Repair.GetSkillEffect = ffrg_CoordinatedStrike.GetSkillEffect

Support_Repair_Tooltip = SelfTarget:new{
	Amount = -1,
	Name = "TBD",
	Description = "TBD",
    Upgrades = 2,
    Supply = false,
	UpgradeCost = {2,2},
	TipImage = {
		Unit_Damaged = Point(2,3),
		Target = Point(2,3),
		Friendly_Damaged = Point(1,1),
		Friendly2_Damaged = Point(2,1),
		Length = 5,
	}
}
Support_Repair_Tooltip_A = Support_Repair_Tooltip:new{
    Supply = true,
}

function Support_Repair_Tooltip:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local damage = SpaceDamage(Point(2,3),-10)
	damage.iFire = EFFECT_REMOVE
	ret:AddDamage(damage)
    if self.Supply then
        ffrg_Supply.Supply(Point(2,3),Point(2,3),ret,{repair = true, repairAmount = 10, callerPrevent = "Support_Repair"})
    end

	damage = SpaceDamage(Point(1,1),-10)
	damage.iFire = EFFECT_REMOVE
	ret:AddDamage(damage)
    if self.Supply then
        ffrg_Supply.Supply(Point(2,3),Point(1,1),ret,{repair = true, repairAmount = 10})
    end

	damage = SpaceDamage(Point(2,1),-10)
	damage.iFire = EFFECT_REMOVE
	ret:AddDamage(damage)
    if self.Supply then
        ffrg_Supply.Supply(Point(2,3),Point(2,1),ret,{repair = true, repairAmount = 10})
    end

	return ret
end

Support_Repair_A = Support_Repair:new{
    Supply = true,
    CustomTipImage = "Support_Repair_Tooltip_A",
}

Support_Repair_B = Support_Repair:new{
    Limited = 2,
}

Support_Repair_AB = Support_Repair:new{
    Limited = 2,
    Supply = true,
    CustomTipImage = "Support_Repair_Tooltip_A",
}

Weapon_Texts.Support_Repair_A_UpgradeDescription = "Supplies all targeted Mechs."
Weapon_Texts.Support_Repair_Upgrade1 = "Add Supply"

Weapon_Texts.Support_Repair_B_UpgradeDescription = "Increases uses per battle by 1."
Weapon_Texts.Support_Repair_Upgrade2 = "+1 Use"


----------------------
-- Rock Accelerator --
----------------------

Ranged_Rockthrow.Upgrades = 2
Ranged_Rockthrow.Slab = false
Ranged_Rockthrow.UpgradeCost = {2,1}

Ranged_Rockthrow_A = Ranged_Rockthrow:new{
    Damage = 3,
    BounceAmount = 2,
}
Ranged_Rockthrow_B = Ranged_Rockthrow:new{
    Slab = true,
    BounceAmount = 3,
}
Ranged_Rockthrow_AB = Ranged_Rockthrow:new{
    Slab = true,
    Damage = 3,
    BounceAmount = 4,
}

modApi:setText("Ranged_Rockthrow_B_UpgradeDescription", "Throw a Slab instead of a Boulder.")
modApi:setText("Ranged_Rockthrow_Upgrade2", "Slab")

function Ranged_Rockthrow:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local dir = GetDirection(p2 - p1)
	local damage = SpaceDamage(p2, self.Damage)
    local blocked = false

	if Board:IsValid(p2) and not Board:IsBlocked(p2,PATH_PROJECTILE) then
        if self.Slab then
            damage.sPawn = "ffrg_Slab1_Thrown"
        else
            damage.sPawn = "RockThrown"
        end
		damage.sAnimation = ""
		damage.iDamage = 0
	else
        blocked = true
        if self.Slab then
            damage.sAnimation = "ffrg_barrier1d"
        else
            damage.sAnimation = "rock1d"
        end
	end

	ret:AddBounce(p1, 1)
    local damage0 = SpaceDamage(p2, 0)
    if self.Slab then
        local damage1 = SpaceDamage(p2 + Point(-24,0), 0)
        damage1.bHide = true
        ret:AddArtillery(damage0, "effects/ffrg_nil.png", NO_DELAY)
        ret:AddArtillery( p1 + Point(-24,0), damage1, "effects/ffrg_shotdown_slab.png", FULL_DELAY)
        ret:AddBoardShake(0.30)
    else
        ret:AddArtillery(damage0, "effects/shotdown_rock.png")

        ret:AddBoardShake(0.15)
    end
    if not blocked then
        ret:AddBurst(p2,"Emitter_Burst_$tile",DIR_NONE)
    end
    ret:AddDamage(damage)
	ret:AddBounce(p2, self.BounceAmount)

	local damagepush = SpaceDamage(p2 + DIR_VECTORS[(dir+1)%4], 0, (dir+1)%4)
	damagepush.sAnimation = "airpush_"..((dir+1)%4)
	ret:AddDamage(damagepush)
	damagepush = SpaceDamage(p2 + DIR_VECTORS[(dir-1)%4], 0, (dir-1)%4)
	damagepush.sAnimation = "airpush_"..((dir-1)%4)
	ret:AddDamage(damagepush)

	return ret
end


--////////////////////////////////--

