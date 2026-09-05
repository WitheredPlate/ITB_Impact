--////////////////////////////////--
--//    (Impact) Drop Weapons   //--
--////////////////////////////////--

--== Prime ==--
-- Gorgon Shredder
-- Atlas Maul

--== Ranged ==--
-- Hydra Cannonade
-- Flechette Caster

--== Ranged ==--
-- Horus Drill
-- Sekhmet Saw

--== Science ==--
-- Gravity Manipulator
-- Heavy Repulsor

--== Support ==--
-- Munitions Loader
-- Mounted Armaments

--== Passive ==--
-- Hydrogen Manufactories

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "weapons/ffrg_prime_shred.png",
    "weapons/ffrg_prime_maul.png",
    "weapons/ffrg_brute_cannonade.png",
    "weapons/ffrg_brute_flechette.png",
    "weapons/ffrg_ranged_silica.png",
    "weapons/ffrg_ranged_sawblade.png",
    "weapons/ffrg_science_TC_gravmanipulator.png",
    "weapons/ffrg_science_heavyrepulse.png",
    "weapons/ffrg_passive_icesupply.png",
    "weapons/ffrg_support_supply.png",
    "weapons/ffrg_support_mountedarmaments.png",
    "effects/ffrg_saw_shatter.png",
    "effects/ffrg_shot_sawfrag.png",
    "effects/ffrg_explo_hammer_U.png",
    "effects/ffrg_explo_hammer_R.png",
    "effects/ffrg_explo_hammer_D.png",
    "effects/ffrg_explo_hammer_L.png",
    "effects/ffrg_explo_flechette_U.png",
    "effects/ffrg_explo_flechette_R.png",
    "effects/ffrg_explo_flechette_D.png",
    "effects/ffrg_explo_flechette_L.png",
    "effects/ffrg_repulsepush1_U.png",
    "effects/ffrg_repulsepush1_R.png",
    "effects/ffrg_repulsepush1_D.png",
    "effects/ffrg_repulsepush1_L.png",
    "effects/ffrg_repulsepush3_U.png",
    "effects/ffrg_repulsepush3_R.png",
    "effects/ffrg_repulsepush3_D.png",
    "effects/ffrg_repulsepush3_L.png",
    "effects/ffrg_shot_flechette_U.png",
    "effects/ffrg_shot_flechette_R.png",
    "effects/ffrg_shot_push_vortex_U.png",
    "effects/ffrg_shot_push_vortex_R.png",
    "effects/ffrg_shot_push_vortex_D.png",
    "effects/ffrg_shot_push_vortex_L.png",
    "effects/ffrg_explo_push_vortex_U.png",
    "effects/ffrg_explo_push_vortex_R.png",
    "effects/ffrg_explo_push_vortex_D.png",
    "effects/ffrg_explo_push_vortex_L.png",
    "effects/ffrg_shotup_horusdrill.png",
    "effects/ffrg_shotup_sawblade.png",
    "effects/ffrg_burrow_drill.png",
    "effects/ffrg_burrow_drill_miss.png",
    "effects/ffrg_explo_horus_U.png",
    "effects/ffrg_explo_horus_L.png",
    "effects/ffrg_explo_horus_R.png",
    "effects/ffrg_explo_horus_D.png",
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end


--== Atlas Maul ==--
ANIMS.ffrg_Explo_Hammer_0 = Animation:new{
    Image = "effects/ffrg_explo_hammer_U.png",
    NumFrames = 12,
    Time = 0.06,
    Lengths = {0.08, 0.08, 0.08, 0.06, 0.06, 0.04, 0.04, 0.04, 0.06, 0.12, 0.12, 0.06},
    PosX = -45,
    PosY = -2
}
ANIMS.ffrg_Explo_Hammer_1 = Animation:new{
    Image = "effects/ffrg_explo_hammer_R.png",
    NumFrames = 12,
    Lengths = {0.08, 0.08, 0.08, 0.06, 0.06, 0.04, 0.04, 0.04, 0.06, 0.12, 0.12, 0.06},
    PosX = -44,
    PosY = -37
}
ANIMS.ffrg_Explo_Hammer_2 = Animation:new{
    Image = "effects/ffrg_explo_hammer_D.png",
    NumFrames = 12,
    Lengths = {0.08, 0.08, 0.08, 0.06, 0.06, 0.04, 0.04, 0.04, 0.06, 0.12, 0.12, 0.06},
    PosX = -8,
    PosY = -37
}
ANIMS.ffrg_Explo_Hammer_3 = Animation:new{
    Image = "effects/ffrg_explo_hammer_L.png",
    NumFrames = 12,
    Lengths = {0.08, 0.08, 0.08, 0.06, 0.06, 0.04, 0.04, 0.04, 0.06, 0.12, 0.12, 0.06},
    PosX = -8,
    PosY = -2
}

--== Flechette Accelerator ==--
ANIMS.ffrg_Explo_Flechette_0 = Animation:new{
    Image = "effects/ffrg_explo_flechette_U.png",
    NumFrames = 10,
    Time = 0.06,
    PosX = -11,
    PosY = 0
}
ANIMS.ffrg_Explo_Flechette_1 = Animation:new{
    Image = "effects/ffrg_explo_flechette_R.png",
    NumFrames = 10,
    Time = 0.06,
    PosX = -11,
    PosY = 9
}
ANIMS.ffrg_Explo_Flechette_2 = Animation:new{
    Image = "effects/ffrg_explo_flechette_D.png",
    NumFrames = 10,
    Time = 0.06,
    PosX = -19,
    PosY = 9
}
ANIMS.ffrg_Explo_Flechette_3 = Animation:new{
    Image = "effects/ffrg_explo_flechette_L.png",
    NumFrames = 10,
    Time = 0.06,
    PosX = -19,
    PosY = 0
}

--== Gravity Manipulator ==--
ANIMS.ffrg_RepulsePush1_0 = Animation:new{
    Image = "effects/ffrg_repulsepush1_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -28,
    PosY = -22
}
ANIMS.ffrg_RepulsePush1_1 = Animation:new{
    Image = "effects/ffrg_repulsepush1_R.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -28,
    PosY = -9
}
ANIMS.ffrg_RepulsePush1_2 = Animation:new{
    Image = "effects/ffrg_repulsepush1_D.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -44,
    PosY = -9
}
ANIMS.ffrg_RepulsePush1_3 = Animation:new{
    Image = "effects/ffrg_repulsepush1_L.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -44,
    PosY = -22
}

--== Sekhmet Saw ==--
ANIMS.ffrg_Saw_Shatter = Animation:new{
    Image = "effects/ffrg_saw_shatter.png",
    NumFrames = 12,
    Frames = {0,1,2,3,4,5,4,5,6,7,8,9,10,11},
    Lengths = {0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.08,0.08,0.08,0.04},
    PosX = -33,
    PosY = -7
}
ANIMS.ffrg_Shot_SawFrag = Animation:new{
    Image = "effects/ffrg_shot_sawfrag.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -9,
    PosY = 9
}

--== Heavy Repulsor ==--
ANIMS.ffrg_Shot_PushVortex_0 = Animation:new{
    Image = "effects/ffrg_shot_push_vortex_U.png",
    NumFrames = 10,
    Time = 0.03,
    PosX = -12,
    PosY = 3
}
ANIMS.ffrg_Shot_PushVortex_1 = Animation:new{
    Image = "effects/ffrg_shot_push_vortex_R.png",
    NumFrames = 10,
    Time = 0.03,
    PosX = -12,
    PosY = 3
}
ANIMS.ffrg_Shot_PushVortex_2 = Animation:new{
    Image = "effects/ffrg_shot_push_vortex_D.png",
    NumFrames = 10,
    Time = 0.03,
    PosX = -12,
    PosY = 3
}
ANIMS.ffrg_Shot_PushVortex_3 = Animation:new{
    Image = "effects/ffrg_shot_push_vortex_L.png",
    NumFrames = 10,
    Time = 0.03,
    PosX = -12,
    PosY = 3
}
ANIMS.ffrg_Explo_PushVortex_0 = Animation:new{
    Image = "effects/ffrg_explo_push_vortex_U.png",
    NumFrames = 5,
    Time = 0.08,
    PosX = -14,
    PosY = -7
}
ANIMS.ffrg_Explo_PushVortex_1 = Animation:new{
    Image = "effects/ffrg_explo_push_vortex_R.png",
    NumFrames = 5,
    Time = 0.08,
    PosX = -14,
    PosY = 1
}
ANIMS.ffrg_Explo_PushVortex_2 = Animation:new{
    Image = "effects/ffrg_explo_push_vortex_D.png",
    NumFrames = 5,
    Time = 0.08,
    PosX = -24,
    PosY = 1
}
ANIMS.ffrg_Explo_PushVortex_3 = Animation:new{
    Image = "effects/ffrg_explo_push_vortex_L.png",
    NumFrames = 5,
    Time = 0.08,
    PosX = -24,
    PosY = -7
}

--== Horus Drill ==--
ANIMS.explodrill2 = Animation:new{
    Image = "effects/ffrg_burrow_drill.png",
    NumFrames = 9,
    Time = 0.05,
    PosX = -20,
    PosY = -12
}
ANIMS.explodrill3 = Animation:new{
    Image = "effects/ffrg_burrow_drill_miss.png",
    NumFrames = 9,
    Time = 0.05,
    PosX = -20,
    PosY = -12
}
ANIMS.explohorus_0 = Animation:new{
    Image = "effects/ffrg_explo_horus_U.png",
    NumFrames = 8,
    Time = 0.04,
    PosX = -22,
    PosY = -56
}
ANIMS.explohorus_1 = Animation:new{
    Image = "effects/ffrg_explo_horus_R.png",
    NumFrames = 8,
    Time = 0.04,
    PosX = -23,
    PosY = 0
}
ANIMS.explohorus_2 = Animation:new{
    Image = "effects/ffrg_explo_horus_D.png",
    NumFrames = 8,
    Time = 0.04,
    PosX = -73,
    PosY = 0
}
ANIMS.explohorus_3 = Animation:new{
    Image = "effects/ffrg_explo_horus_L.png",
    NumFrames = 8,
    Time = 0.04,
    PosX = -74,
    PosY = -56
}

--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


---------------------
-- Medusa Shredder --
---------------------

ffrg_Prime_Shred = Skill:new{
    Name = "Gorgon Shredder",
    Icon = "weapons/ffrg_prime_shred.png",
    Description = "Damage an adjacent tile several times.",
    Class = "Prime",
    PathSize = 1,
    Damage2 = 1,
    TipDamageCustom = "1x4",
    Attacks = 4,
    StartSound = "/mech/prime/punch_mech/death",
    Sound = "/support/shield/death",
    StartAnimation = "ffrg_Saw4",
    Upgrades = 2,
    UpgradeCost = {1,3},
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        Length = 4.5,
    }
}

ffrg_Prime_Shred_A = ffrg_Prime_Shred:new{
    UpgradeDescription = "Damages the target an additional time.",
    Attacks = 5,
    TipDamageCustom = "1x5",
    StartAnimation = "ffrg_Saw5",
}

ffrg_Prime_Shred_B = ffrg_Prime_Shred:new{
    UpgradeDescription = "Extend the reach of the attack by 1 tile.",
    PathSize = 2,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,1),
        Length = 5,
    }
}

ffrg_Prime_Shred_AB = ffrg_Prime_Shred:new{
    Attacks = 5,
    TipDamageCustom = "1x5",
    StartAnimation = "ffrg_Saw5",
    PathSize = 2,
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        Length = 5,
    }
}

Weapon_Texts.ffrg_Prime_Shred_Upgrade1 = "+1 Attack"
Weapon_Texts.ffrg_Prime_Shred_Upgrade2 = "+1 Range"

function ffrg_Prime_Shred:GetTargetArea(point)
	local ret = PointList()
	for i = DIR_START, DIR_END do
		for k = 1, self.PathSize do
			local curr = DIR_VECTORS[i]*k + point
			ret:push_back(curr)
			if not Board:IsValid(curr) then --or Board:GetTerrain(curr) == TERRAIN_MOUNTAIN then
				break
			end
		end
	end

	return ret
end

function ffrg_Prime_Shred:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local distance = p1:Manhattan(p2)
    local start = SpaceDamage(p2,0)
    local append = ""
    if direction == 0 or direction == 1 then append = "_Main"
    else append = "_Alt" end
    start.bHide = true
    start.sSound = self.StartSound
    start.sAnimation = self.StartAnimation..append
    ret:AddDamage(start)
    if distance > 1 then
        start.sSound = ""
        start.loc = p2 - DIR_VECTORS[direction]
        ret:AddDamage(start)
    end
    ret:AddDelay(0.1)
    local multihit = ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2, {mode = "dissect", origin = p1, ret = ret, delay = 0.1, sfx = self.Sound})
    local multihit2
    if distance > 1 then
        multihit2 = ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2-DIR_VECTORS[direction], {mode = "dissect", origin = p1, ret = ret, delay = 0.1})
    end

    for i = 1, #multihit do
        if i%2 == 0 then
            ret:AddDelay(multihit[i])
        else
            if distance > 1 then
                ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkSmall_Saw"..append.."\",DIR_NONE)")
                ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkLarge_Saw"..append.."\",DIR_NONE)")
                ret:AddScript("Board:AddBurst("..(p2-DIR_VECTORS[direction]):GetString()..",\"ffrg_Emitter_SparkSmall_Saw"..append.."\",DIR_NONE)")
                ret:AddScript("Board:AddBurst("..(p2-DIR_VECTORS[direction]):GetString()..",\"ffrg_Emitter_SparkLarge_Saw"..append.."\",DIR_NONE)")
                if i%4 == 3 then
                    multihit[i].sSound = ""
                else
                    multihit[i].sSound = self.Sound
                end
                ret:AddDamage(multihit[i])
                ret:AddDamage(multihit2[i])
            else
                ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkSmall_Saw"..append.."\",DIR_NONE)")
                ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkLarge_Saw"..append.."\",DIR_NONE)")
                if i%4 == 3 then
                    multihit[i].sSound = ""
                else
                    multihit[i].sSound = self.Sound
                end
                ret:AddDamage(multihit[i])
            end
        end
    end
    return ret
end


----------------
-- Atlas Maul --
----------------

ffrg_Prime_Maul = Skill:new{
    Name = "Atlas Maul",
    Icon = "weapons/ffrg_prime_maul.png",
    Description = "Pulverize a tile, killing it and flipping adjacent tiles.",
    Class = "Prime",
    PathSize = 1,
    PowerCost = 1,
    Damage = DAMAGE_DEATH,
    LaunchSound = "/props/boulder_fall",
    LaunchSound2 = "/weapons/heavy_rocket",
    ImpactSound = "/props/airstrike_explosion",
    ImpactSound2 = "/mech/brute/doubletank_mech/death",
    Animation = "ffrg_Explo_Hammer_",
    Upgrades = 1,
    UpgradeCost = {3},
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Enemy2 = Point(3,1),
        Target = Point(2,1),
        Length = 5.5
    }
}

ffrg_Prime_Maul_A = ffrg_Prime_Maul:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Uses = 2
}

Weapon_Texts.ffrg_Prime_Maul_Upgrade1 = "+1 Use"

ffrg_Emitter_Crack_Hammer = Emitter_Crack_Start:new{
    max_alpha = 0.5,
    burst_count = 30,
    speed = 4.5,
    gravity = true,
    variance_x = 36,
    variance_y = 20,
    lifespan = 1.8,
    angle = 293,
    angle_variance = 46,
}

local wind_variance = 90
local wind_verticality = 0.5

ffrg_Emitter_Wind_Hammer_0 = Emitter:new{
    image = "combat/tiles_grass/particle.png",
    x = 0,
    y = 20,
    max_alpha = 0.15,
    burst_count = 50,
    angle = -36.25 - (wind_verticality*53.75) + (wind_variance/2),
    variance_x = 44,
    variance_y = 30,
    angle_variance = wind_variance,
    lifespan = 0.5,
    burst_count = 25,
    speed = 4.5,
    gravity = true,
    layer = LAYER_BACK
}
ffrg_Emitter_Wind_Hammer_1 = ffrg_Emitter_Wind_Hammer_0:new{
    angle = 36.25 - (wind_verticality*126.25) + (wind_variance/2)
}
ffrg_Emitter_Wind_Hammer_2 = ffrg_Emitter_Wind_Hammer_0:new{
    angle = 143.75 + (wind_verticality*126.25) + (wind_variance/2)
}
ffrg_Emitter_Wind_Hammer_3 = ffrg_Emitter_Wind_Hammer_0:new{
    angle = -143.75 + (wind_verticality*53.75) + (wind_variance/2)
}

function ffrg_Prime_Maul:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    ret:AddDamage(SoundEffect(p1,self.LaunchSound2))
    local direction = GetDirection(p2 - p1)
    local damage_anim = SpaceDamage(p2, 0)
    local damage = SpaceDamage(p2, self.Damage)
    damage_anim.sAnimation = self.Animation..direction
    damage.sSound = self.ImpactSound
    local damage_outer = SpaceDamage(p2, 0, DIR_FLIP)
    ret:AddDelay(0.55)
    ret:AddDamage(damage_anim)
    ret:AddDelay(0.35)
    ret:AddBounce(p1, -2)
    ret:AddDelay(0.10)
    ret:AddDamage(damage)
    ret:AddBoardShake(0.35)
    ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_Crack_Hammer\",DIR_NONE)")
    ret:AddBounce(p2, 6)
    ret:AddDamage(SoundEffect(p1,self.ImpactSound2))
    ret:AddDelay(0.25)
    for i = 0, 3 do
        curr = p2 + DIR_VECTORS[i]
        if Board:IsValid(curr) and curr ~= p1 then
            ret:AddBounce(curr, -2)
            local dir = GetDirection(curr - p2)
            ret:AddScript("Board:AddBurst("..curr:GetString()..",\"ffrg_Emitter_Wind_Hammer_"..dir.."\",DIR_NONE)")
            damage_outer.loc = curr
            ret:AddDamage(damage_outer)
        end
    end
    return ret
end


----------------------
-- Flechette Caster --
----------------------

ffrg_Brute_Flechette = Skill:new{
    Name = "Flechette Caster",
    Description = "Fire a piercing and pushing flechette that gets weaker with each pierce.",
    Class = "Brute",
    Limited = 2,
    PathSize = INT_MAX,
    Icon = "weapons/ffrg_brute_flechette.png",
    ProjectileArt = "effects/ffrg_shot_flechette",
    LaunchSound = "weapons/pierce_shot",
    HitSound = "impact/generic/ricochet",
    FinalHitSound = "weapons/brute_ko_combo",
    HitAnimation = "",
    FinalHitAnimation = "ffrg_Explo_Flechette_",
    BuildingImmune = false,
    ProjectileSpeed = 16,
    Upgrades = 2,
    UpgradeCost = {1,2},
    Damage = 2,
    MinDamage = 0,
    MaxDamage = 2,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,2),
        Length = 5
    }
}

ffrg_Brute_Flechette_A = ffrg_Brute_Flechette:new{
    UpgradeDescription = "Buildings will not take damage from this attack.",
    BuildingImmune = true,
    TipImage = {
        Unit = Point(2,4),
        Building = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,2),
        Length = 5
    }
}

ffrg_Brute_Flechette_B = ffrg_Brute_Flechette:new{
    UpgradeDescription = "Increases the starting damage by 1.",
    MaxDamage = 3,
    ProjectileSpeed = 20,
}

ffrg_Brute_Flechette_AB = ffrg_Brute_Flechette:new{
    MaxDamage = 3,
    ProjectileSpeed = 20,
    BuildingImmune = true,
    TipImage = {
        Unit = Point(2,4),
        Building = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,2),
        Length = 5
    }
}

Weapon_Texts.ffrg_Brute_Flechette_Upgrade1 = "Buildings Immune"
Weapon_Texts.ffrg_Brute_Flechette_Upgrade2 = "+1 Max Damage"

local function DirString(dir)
    if dir == 0 then return "up" end
    if dir == 1 then return "right" end
    if dir == 2 then return "down" end
    if dir == 3 then return "left" end
    return ""
end

local function GetPushXs(point)
    local terrain = Board:GetTerrain(point)
    if terrain == TERRAIN_ROAD then
        return ""
    elseif terrain == TERRAIN_ICE then
        return "_x"
    elseif terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA or terrain == TERRAIN_HOLE then
        return "_xx"
    end
    return ""
end

function ffrg_Brute_Flechette:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2 - p1)
    local timings = {}
    local remaining = self.MaxDamage
    local lastTile
    local projectileSpeedTemp = self.ProjectileSpeed

    for i = 1, 7 do
        local curr = p1 + DIR_VECTORS[direction]*i

        if Board:IsValid(curr) then
            timings[i] = {}
            if Board:IsBlocked(curr, PATH_FLYER) or not Board:IsValid(curr+DIR_VECTORS[direction]) then
                local cont = Board:IsValid(curr+DIR_VECTORS[direction])
                timings[i].hit = true
                timings[i].damage = remaining
                if self.BuildingImmune and Board:IsBuilding(curr) and remaining ~= 0 then
                    timings[i].damage = DAMAGE_ZERO
                end
                timings[i].pushValid = false
                timings[i].pushImpact = false
                timings[i].cleared = false
                if not Board:IsBlocked(curr, PATH_FLYER) then
                    timings[i].cleared = true
                end
                if Board:IsPawnSpace(curr) and Board:GetPawn(curr):IsPushable() and cont then
                    timings[i].pushValid = true
                end
                timings[i].pushDelay = 0
                remaining = remaining - 1
                lastTile = curr
                if not cont or remaining < 0 then
                    break
                end
            else
                timings[i].cleared = true
            end
        else
            break
        end
    end

    for i, timing in ipairs(timings) do
        if timing.pushValid then
            for j = 1, 7 do
                local index = i - j
                if index > 0 then
                    local offsetTiming = timings[index]
                    if offsetTiming and offsetTiming.pushValid then
                        offsetTiming.pushDelay = offsetTiming.pushDelay + 2
                    else
                        break
                    end
                else
                    break
                end
            end
        end
    end

    for i = 1, #timings do
        local index = #timings-i+1
        local timing = timings[index]
        if timing.pushValid then
            local offsetTiming = timings[index + 1]
            local curr = p1 + DIR_VECTORS[direction]*(index + 1)
            if ( not offsetTiming and Board:IsBlocked(curr, PATH_FLYER)) or ( offsetTiming and not offsetTiming.cleared ) then
                timing.pushImpact = true
            else
                timing.cleared = true
            end
        end
        if timing.damage and timing.damage > 0 and not timing.cleared then
            local curr = p1 + DIR_VECTORS[direction]*index
            if not Board:IsPawnSpace(curr) then
                if not Board:IsFrozen(curr) and not Board:IsShield(curr) then
                    if Board:GetTerrain(curr) == TERRAIN_MOUNTAIN and Board:GetHealth(curr) == 1 then timing.cleared = true end
                    if Board:IsBuilding(curr) and Board:GetHealth(curr) <= timing.damage and not self.BuildingImmune then timing.cleared = true end
                end
            end
        end
    end

    local distance = p1:Manhattan(lastTile)
    local delayedPushes = {}

    for i = 1, 10 do
        local timing = timings[i]
        local curr = p1 + DIR_VECTORS[direction]*i
        if i <= distance and ( i == 1 or (timings[i-1] and timings[i-1].hit)) then
            local hitSpace = p1 + DIR_VECTORS[direction]*(i-1)
            local nextHit
            for j = 1, 10 do
                if timings[i+j-1] and timings[i+j-1].hit then
                    nextHit = p1 + DIR_VECTORS[direction]*(i+j-1)
                    break
                end
            end
            if nextHit then
                local projectile = SpaceDamage(nextHit, 0)
                ffrg_WorldConstants:setSpeed(ret, (projectileSpeedTemp/18))
                ret:AddProjectile(hitSpace, projectile, self.ProjectileArt, NO_DELAY)
                ffrg_WorldConstants:resetSpeed(ret)
            end
        end
        ret:AddDelay(0.05*(20/projectileSpeedTemp))
        if #delayedPushes > 0 then
            local delayedPushesSize = #delayedPushes
            for i = 1, delayedPushesSize do
                local index = delayedPushesSize - i + 1
                local pushData = delayedPushes[index]
                if pushData[2] > 1 then
                    pushData[2] = pushData[2] - 1
                else
                    ret:AddDamage(pushData[1])
                    table.remove(delayedPushes, index)
                end
            end
        end
        if timing and timing.hit then
            projectileSpeedTemp = projectileSpeedTemp - 4
            local damage = SpaceDamage(curr, timing.damage, 5)
            if curr == lastTile then
                damage.sSound = self.FinalHitSound
                damage.sAnimation = self.FinalHitAnimation..direction
            else
                damage.sSound = self.HitSound
                damage.sAnimation = self.HitAnimation..direction
            end
            ret:AddDamage(damage)
            if timing.pushValid then
                local push = SpaceDamage(curr, 0, direction)
                push.bHide = true
                if timing.pushDelay and timing.pushDelay > 0 then
                    table.insert(delayedPushes, {push, timing.pushDelay})
                else
                    ret:AddDamage(push)
                end
            end
            local animPre
            if timing.pushImpact then
                animPre = "multipush_"..DirString(direction).."_impact"..GetPushXs(curr)
                if not Board:IsTipImage() then
                    WeaponPreview:AddDamage(SpaceDamage(curr, 0, direction))
                end
            elseif timing.pushValid then
                animPre = "multipush_"..DirString(direction).."_push"..GetPushXs(curr)
            elseif Board:IsPawnSpace(curr) and Board:GetPawn(curr):IsGuarding() then
                animPre = "multipush_"..DirString(direction).."_guard"..GetPushXs(curr)
            else
                animPre = "multipush_"..DirString(direction).."_miss"..GetPushXs(curr)
            end
            if Board:IsTipImage() then
                if ANIMS[animPre] then
                    ANIMS["ffrg_TemporaryTipAnim_ffrg_Brute_Flechette_"..tostring(self.BuildingImmune).."_"..curr:GetString()] = ANIMS[animPre]:new{
                        Frames = {2, 0},
                        Lengths = {1, 1.5},
                        Loop = false
                    }
                end
                Board:AddAnimation(curr, "ffrg_TemporaryTipAnim_ffrg_Brute_Flechette_"..tostring(self.BuildingImmune).."_"..curr:GetString(), 1)
            else
                WeaponPreview:AddAnimation(curr, animPre, 0)
            end
        end
    end

    return ret
end


---------------------
-- Hydra Cannonade --
---------------------

ffrg_Brute_Cannonade = Skill:new{
    Name = "Hydra Cannonade",
    Description = "Fire multiple damaging and pushing projectiles in sequence.",
    Class = "Brute",
    Limited = 1,
    PathSize = INT_MAX,
    Icon = "weapons/ffrg_brute_cannonade.png",
    ProjectileArt = "effects/shot_mechtank",
    FireSound = "/weapons/unstable_cannon",
    HitSound = "/impact/generic/explosion_large",
    Upgrades = 2,
    Animation = "explopush2_",
    UpgradeCost = {2,3},
    Projectiles = 2,
    Damage2 = 2,
    TipDamageCustom = "2x2",
    Delay = 0.75,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,2),
        CustomEnemy = "Scorpion1",
        Length = 5
    }
}

ffrg_Brute_Cannonade_A = ffrg_Brute_Cannonade:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Uses = 2
}

ffrg_Brute_Cannonade_B = ffrg_Brute_Cannonade:new{
    UpgradeDescription = "Increases number of fired projectiles by 1.",
    Projectiles = 3,
    TipDamageCustom = "2x3",
    Delay = 0.60,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,2),
        Length = 5
    }
}

ffrg_Brute_Cannonade_AB = ffrg_Brute_Cannonade:new{
    Uses = 2,
    Projectiles = 3,
    TipDamageCustom = "2x3",
    Delay = 0.5,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,1),
        Target = Point(2,2),
        Length = 5
    }
}

Weapon_Texts.ffrg_Brute_Cannonade_Upgrade1 = "+1 Use"
Weapon_Texts.ffrg_Brute_Cannonade_Upgrade2 = "+1 Projectile"

function ffrg_Brute_Cannonade:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local dir = GetDirection(p2 - p1)
    ffrg_Multihit.MultihitProjectile(self.Damage2, self.Projectiles, p1, dir, {ret = ret, origin = p1, push = true, mode = "simple", delay = self.Delay, sfx_fire = self.FireSound, sfx_hit = self.HitSound, proj_art = self.ProjectileArt, anim = self.Animation, anim_directional = "forwards"})
    return ret
end


-----------------
-- Horus Drill --
-----------------

ffrg_Ranged_TC_Silica = LineArtillery:new{
    Name = "Horus Drill",
    Description = "Fire a damaging and flipping artillery that burrows to a nearby tile, damaging and pushing an additional target.",
    Class = "Ranged",
    Icon = "weapons/ffrg_ranged_silica.png",
    Explosion = "",
    DrillArt = "explodrill2",
    DrillMissArt = "explodrill3",
    ProjArt = "effects/ffrg_shotup_horusdrill.png",
    LaunchSound = "/weapons/back_shot",
    DrillSound = "/weapons/crack_ko",
    DrillMissSound = "/weapons/titan_fist",
    BurrowSound = "/props/ground_break_tile",
    SurfaceSound = "/support/vip_truck/death",
    TwoClick = true,
    Upgrades = 2,
    DrillRange = 2,
    Limited = 1,
    Damage = 2,
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,1),
        Enemy2 = Point(3,1),
        Target = Point(1,1),
        Second_Click = Point(3,1),
        Length = 6,
    }
}

ffrg_Ranged_TC_Silica_A = ffrg_Ranged_TC_Silica:new{
    UpgradeDescription = "Increases damage to both targets by 1.",
    Damage = 3,
}
ffrg_Ranged_TC_Silica_B = ffrg_Ranged_TC_Silica:new{
    UpgradeDescription = "Removes the range restriction on the Burrowing.",
    DrillRange = 7,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,1),
        Enemy2 = Point(4,1),
        Target = Point(1,1),
        Second_Click = Point(4,1),
        Length = 6,
    }
}
ffrg_Ranged_TC_Silica_AB = ffrg_Ranged_TC_Silica:new{
    Damage = 3,
    DrillRange = 7,
    TipImage = {
        Unit = Point(1,3),
        Enemy = Point(1,1),
        Enemy2 = Point(4,1),
        Target = Point(1,1),
        Second_Click = Point(4,1),
        Length = 6,
    }
}

Weapon_Texts.ffrg_Ranged_TC_Silica_Upgrade1 = "+1 Damage"
Weapon_Texts.ffrg_Ranged_TC_Silica_Upgrade2 = "Unlimited Range"

function ffrg_Ranged_TC_Silica:IsTwoClickException(p1,p2)
	if ffrg_Ranged_TC_Silica:IsBurrowable(p2) == false then
		return true
    else
        for i = DIR_START, DIR_END do
            local curr = p2 + DIR_VECTORS[i]
            if ffrg_Ranged_TC_Silica:IsBurrowable(curr) then
                return false
            end
        end
	end

	return true
end

function ffrg_Ranged_TC_Silica:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local damage = SpaceDamage(p2,self.Damage)
    damage.iPush = DIR_FLIP
    if ffrg_Ranged_TC_Silica:IsBurrowable(p2) == false then
        damage.sImageMark = "combat/icons/ffrg_icon_burrow_miss.png"
        if terrain == TERRAIN_HOLE then
            damage.sSound = "impact/generic/general"
        else
            damage.sSound = self.DrillMissSound
        end
        damage.sAnimation = self.DrillMissArt
        ret:AddArtillery(damage, self.ProjArt, NO_DELAY)
        ret:AddDelay(0.8)
        ret:AddBounce(p2, 2)
    else
        damage.sSound = self.DrillSound
        damage.sAnimation = self.DrillArt
        ret:AddArtillery(damage, self.ProjArt, NO_DELAY)
        ret:AddDelay(0.8)
        ret:AddBounce(p2, 6)
        ret:AddBurst(p2,"Emitter_Crack_Start",DIR_NONE)
        for i = DIR_START, DIR_END do
            for j = 1, self.DrillRange do
                local curr = p2 + ( DIR_VECTORS[i]*j )
                if Board:IsValid(curr) then
                    if ffrg_Ranged_TC_Silica:IsBurrowable(curr) == false then
                        local damagep = SpaceDamage(curr,0)
                        damagep.sImageMark = "combat/icons/ffrg_icon_burrow_central_miss.png"
                        ret:AddDamage(damagep)
                        break
                    end
                end
            end
        end
    end
    return ret
end

function ffrg_Ranged_TC_Silica:GetSecondTargetArea(p1,p2)
    local ret = PointList()
    if ffrg_Ranged_TC_Silica:IsBurrowable(p2) == false then
        ret:push_back(Point(-1,-1))
        return ret
    end
    for i = DIR_START, DIR_END do
        for j = 1, self.DrillRange do
            local curr = p2 + ( DIR_VECTORS[i]*j )
            if Board:IsValid(curr) then
                if ffrg_Ranged_TC_Silica:IsBurrowable(curr) then
                    ret:push_back(curr)
                else
                    break
                end
            else
                break
            end
        end
    end

    return ret
end

function ffrg_Ranged_TC_Silica:GetFinalEffect(p1, p2, p3)
    local ret = SkillEffect()
	local direction = GetDirection(p3 - p2)
    local distance = p2:Manhattan(p3)
    local terrain = Board:GetTerrain(p3)
    for i = DIR_START, DIR_END do
        for j = 1, self.DrillRange do
            local curr = p2 + ( DIR_VECTORS[i]*j )
            if Board:IsValid(curr) then
                if ffrg_Ranged_TC_Silica:IsBurrowable(curr) == false then
                    local damagep = SpaceDamage(curr,0)
                    damagep.sImageMark = "combat/icons/ffrg_icon_burrow_central_miss.png"
                    ret:AddDamage(damagep)
                    break
                end
            end
        end
    end
    local damagea = SpaceDamage(p2,self.Damage)
    damagea.iPush = DIR_FLIP
    damagea.sSound = self.DrillSound
    damagea.sAnimation = self.DrillArt
    ret:AddBounce(p1, 3)
    ret:AddArtillery(damagea, self.ProjArt, NO_DELAY)
    ret:AddDelay(0.8)
    ret:AddBounce(p2, 6)
    ret:AddBurst(p2,"Emitter_Crack_Start",DIR_NONE)
    ret:AddDelay(0.1)

    for i = 1, distance do
        local curr = p2+(DIR_VECTORS[direction]*i)
        if i == distance then
            if i == 1 then
                ret:AddDelay(0.4)
            else
                ret:AddDelay(0.8/(distance+3))
            end
            ret:AddBounce(curr,-4)
            local damage = SpaceDamage(p3,0)
            damage.sSound = self.BurrowSound
            ret:AddDamage(damage)
            ret:AddBurst(curr,"Emitter_Crack_Start2",DIR_NONE)
            local damagef = SpaceDamage(p3,self.Damage)
            damagef.iPush = direction
            damagef.sSound = self.SurfaceSound
            damagef.sAnimation = "explohorus_"..direction
            ret:AddDamage(damagef)
            ret:AddBurst(p3,"Emitter_Burst_$tile",DIR_NONE)
        else
            ret:AddDelay(1.6/(distance+3))
            local damage = SpaceDamage(curr,0)
            damage.sSound = self.BurrowSound
            ret:AddBurst(curr,"Emitter_Crack_Start",DIR_NONE)
            ret:AddBounce(curr,-2)
            ret:AddDamage(damage)
        end
    end

    return ret
end

function ffrg_Ranged_TC_Silica:IsBurrowable(point)
    local burrowable = true
    if Board:IsValid(point) then
        local terrain = Board:GetTerrain(point)
        if terrain == TERRAIN_HOLE or terrain == TERRAIN_WATER or terrain == TERRAIN_ACID or terrain == TERRAIN_LAVA then
            burrowable = false
        end
        if Board:IsPawnSpace(point) then
            if terrain == TERRAIN_WATER and Board:GetPawn(point):GetType() == "Dam_Pawn" then
                burrowable = true
            end
        end
    end

    return burrowable
end


-----------------
-- Sekhmet Saw --
-----------------

ffrg_Ranged_Sawblade = LineArtillery:new{
    Name = "Sekhmet Saw",
    Description = "Fire an artillery that damages multiple times then shatters, flinging fragments in every direction.",
    Class = "Ranged",
    Icon = "weapons/ffrg_ranged_sawblade.png",
    Explosion = "",
    SawAnimation = "ffrg_Saw_Shatter",
    SawArt = "effects/ffrg_shotup_sawblade.png",
    FragmentAnimation = "airpush_",
    FragmentProjectileAnimation = "ffrg_Shot_SawFrag",
    LaunchSound = "/weapons/back_shot",
    HitSound = "/impact/generic/general",
    SawSound = "/support/shield/death",
    ShatterSound = "mech/science/napalm_mech/death",
    FragmentHitSound = "impact/generic/general",
    ProjectileSpeed = 9,
    Upgrades = 2,
    PowerCost = 1,
    Limited = 2,
    Damage2 = 1,
    Attacks = 2,
    TipDamageCustom = "1x2",
    UpgradeCost = {1,2},
    TipImage = {
        Unit = Point(2,4),
        Mountain = Point(2,3),
        Enemy = Point(2,1),
        Enemy2 = Point(3,1),
        Target = Point(2,1),
        Length = 6,
    }
}

ffrg_Ranged_Sawblade_A = ffrg_Ranged_Sawblade:new{
    UpgradeDescription = "Increases uses per battle by 1.",
    Limited = 3
}
ffrg_Ranged_Sawblade_B = ffrg_Ranged_Sawblade:new{
    UpgradeDescription = "Increases damage by 1.",
    Damage2 = 2,
    TipDamageCustom = "2x2"
}
ffrg_Ranged_Sawblade_AB = ffrg_Ranged_Sawblade:new{
    Limited = 3,
    Damage2 = 2,
    TipDamageCustom = "2x2"
}

Weapon_Texts.ffrg_Ranged_Sawblade_Upgrade1 = "+1 Use"
Weapon_Texts.ffrg_Ranged_Sawblade_Upgrade2 = "+1 Damage"

ffrg_Emitter_SparkSmall_Saw_Shatter = ffrg_Emitter_SparkSmall_Saw_Main:new{
    burst_count = 15,
    x = 4,
    y = 12,
}
ffrg_Emitter_SparkLarge_Saw_Shatter = ffrg_Emitter_SparkSmall_Saw_Shatter:new{
    image = "effects/smoke/ffrg_spark_large.png",
    burst_count = 8
}

function ffrg_Ranged_Sawblade:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local artillery = SpaceDamage(p2 + Point(-24,0),0)
    local shadow = SpaceDamage(p2,0)
    artillery.sSound = self.HitSound
    shadow.sAnimation = self.SawAnimation
    ret:AddArtillery(p1 + Point(-24,0), artillery, self.SawArt, NO_DELAY)
    ret:AddArtillery(shadow,"effects/ffrg_nil.png", NO_DELAY)
    ret:AddDelay(0.85)
    local multihit = ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2, {mode = "dissect", origin = p1, ret = ret, delay = 0.2, sfx = self.SawSound})

    for i = 1, #multihit do
        if i%2 == 0 then
            ret:AddDelay(multihit[i])
        else
            ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkSmall_Saw_Shatter\",DIR_NONE)")
            ret:AddScript("Board:AddBurst("..p2:GetString()..",\"ffrg_Emitter_SparkLarge_Saw_Shatter\",DIR_NONE)")
            ret:AddDamage(multihit[i])
        end
    end
    ret:AddDelay(0.2)
    ret:AddDamage(SoundEffect(p2,self.ShatterSound))
    for i = 0, 3 do
        local offset = p2+DIR_VECTORS[i]
        if Board:IsValid(offset) then
            local col = GetProjectileEnd(p2,offset)
            local damage = SpaceDamage(col,0,i)
            damage.sSound = self.FragmentHitSound
            damage.sAnimation = self.FragmentAnimation..i
            ffrg_CustomProjectile.AddCustomProjectile(p2,col,self.FragmentProjectileAnimation,{speed = self.ProjectileSpeed, ret = ret, damage = damage, directional = false})
        end
    end

    return ret
end


-------------------------
-- Gravity Manipulator --
-------------------------

ffrg_Science_TC_GravManipulator = Skill:new{
    Name = "Gravity Manipulator",
    Class = "Science",
    Icon = "weapons/ffrg_science_TC_gravmanipulator.png",
    Description = "Push self and any other unit on the board in any pair of opposing directions.",
    LaunchSound = "/mech/science/exchange_mech/death",
    Animation = "ffrg_RepulsePush1_",
    TwoClick = true,
    Limited = 2,
    ShieldAlly = false,
    Upgrades = 2,
    UpgradeCost = { 1, 2 },
    TipImage = {
        Unit = Point(1,2),
        Target = Point(3,1),
        Enemy = Point(3,1),
        Second_Click = Point(3,2),
    }
}

ffrg_Science_TC_GravManipulator_A = ffrg_Science_TC_GravManipulator:new{
    UpgradeDescription = "Applies a shield when targeting allies.",
    ShieldAlly = true,
    TipImage = {
        Unit = Point(1,2),
        Target = Point(3,1),
        Friendly = Point(3,1),
        Second_Click = Point(3,2),
    }
}

ffrg_Science_TC_GravManipulator_B = ffrg_Science_TC_GravManipulator:new{
    UpgradeDescription = "Removes use restriction in battles.",
    Limited = 0,
}

ffrg_Science_TC_GravManipulator_AB = ffrg_Science_TC_GravManipulator:new{
    ShieldAlly = true,
    Limited = 0,
    TipImage = {
        Unit = Point(1,2),
        Target = Point(3,1),
        Friendly = Point(3,1),
        Second_Click = Point(3,2),
    }
}

Weapon_Texts.ffrg_Science_TC_GravManipulator_Upgrade1 = "Shield Ally"
Weapon_Texts.ffrg_Science_TC_GravManipulator_Upgrade2 = "Unlimited Uses"

function ffrg_Science_TC_GravManipulator:GetTargetArea(point)
    local ret = PointList()
    for i = 0, 7 do
        for j = 0, 7  do
            local testPoint = Point(i,j)
            if Board:IsPawnSpace(testPoint) and testPoint ~= point then
                ret:push_back(testPoint)
            end
        end
    end
    return ret
end

function ffrg_Science_TC_GravManipulator:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
    local damage = SpaceDamage(p2, 0)
    local damageSelf = SpaceDamage(p1, 0)
    if Board:GetPawn(p1):IsGuarding() then
        damageSelf.sImageMark = "combat/icons/icon_guard_glow.png"
	end
	if Board:GetPawn(p2):IsGuarding() then
		damage.sImageMark = "combat/icons/icon_guard_glow.png"
	end
	ret:AddDamage(damage)
    ret:AddDamage(damageSelf)

	return ret
end

function ffrg_Science_TC_GravManipulator:GetSecondTargetArea(p1, p2)
    if (not Board:IsPawnSpace(p2) or ( Board:GetPawn(p1):IsGuarding() and Board:GetPawn(p2):IsGuarding() )) then
        return ret
    end
    local ret = PointList()
    for dir = 0, 3 do
        local curr = Point(p2 + DIR_VECTORS[dir])
        if Board:IsValid(curr) and curr~=p1 and curr+DIR_VECTORS[dir]~=p1 then
            ret:push_back(curr)
        end
    end
    for dir = 0, 3 do
        local curr = Point(p1 + DIR_VECTORS[dir])
        if Board:IsValid(curr) and curr ~= p2 and curr+DIR_VECTORS[DIR_UP] ~= p2 and curr+DIR_VECTORS[DIR_RIGHT] ~= p2 and curr+DIR_VECTORS[DIR_DOWN] ~= p2 and curr+DIR_VECTORS[DIR_LEFT]~=p2 then
            ret:push_back(curr)
        end
    end
    -- Spaces adjacent to both units or on the other are invalid

	return ret
end

function ffrg_Science_TC_GravManipulator:GetFinalEffect(p1, p2, p3)

    local ret = SkillEffect()
    local targetSelf = true
    if p3+DIR_VECTORS[DIR_UP] == p2 or p3+DIR_VECTORS[DIR_RIGHT] == p2 or p3+DIR_VECTORS[DIR_DOWN] == p2 or p3+DIR_VECTORS[DIR_LEFT] == p2 then
        targetSelf = false
    end
    local damageSelf = SpaceDamage(p1, 0)
    local damage = SpaceDamage(p2, 0)
    if Board:IsPawnTeam(p2, TEAM_PLAYER) then
        damage.iShield = 1
    end

    local dir
    local selfDir
    if targetSelf then
        selfDir = GetDirection(p3 - p1)
        dir = GetDirection((p3*-1) + p1)
    else
        selfDir = GetDirection((p3*-1) + p2)
        dir = GetDirection(p3 - p2)
    end

    damageSelf.iPush = selfDir
    damageSelf.sAnimation = self.Animation..selfDir
    damage.iPush = dir
    damage.sAnimation = self.Animation..dir

    ret:AddDamage(damage)
    ret:AddDamage(damageSelf)

	return ret
end


--------------------
-- Heavy Repulsor --
--------------------

ffrg_Science_HeavyRepulse = Skill:new{
    Name = "Heavy Repulsor",
    Class = "Science",
    Icon = "weapons/ffrg_science_heavyrepulse.png",
    Description = "Fire multiple pushing projectiles in sequence.",
    FireSound = "weapons/push_beam",
    ProjectileArt = "ffrg_Shot_PushVortex_",
    HitSound = "impact/generic/tractor_beam",
    PathSize = INT_MAX,
    Upgrades = 1,
    ProjectileSpeed = 8,
    Projectiles = 2,
    Animation = "ffrg_Explo_PushVortex_",
    Delay = 0.75,
    UpgradeCost = { 3 },
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Enemy2 = Point(2,0),
        Target = Point(2,2),
        Length = 5
    }
}

ffrg_Science_HeavyRepulse_A = ffrg_Science_HeavyRepulse:new{
    UpgradeDescription = "Increases number of fired projectiles by 1.",
    Projectiles = 3,
    Delay = 0.6
}

Weapon_Texts.ffrg_Science_HeavyRepulse_Upgrade1 = "+1 Projectile"

function ffrg_Science_HeavyRepulse:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local dir = GetDirection(p2 - p1)
    ffrg_Multihit.MultihitProjectile(0, self.Projectiles, p1, dir, {ret = ret, origin = p1, push = true, mode = "simple", delay = self.Delay, sfx_fire = self.FireSound, sfx_hit = self.HitSound, proj_art = self.ProjectileArt, anim = self.Animation, anim_directional = "forwards", custom_projectile = true, projectile_speed = self.ProjectileSpeed})
    return ret
end


----------------------
-- Munitions Loader --
----------------------

ffrg_Support_Supply = Skill:new{
    Name = "Munitions Loader",
    Class = "",
    Icon = "weapons/ffrg_support_supply.png",
    Description = "Push an adjacent tile, Supply self.",
    LaunchSound = "/weapons/healing_smoke",
    SupplyAlly = false,
    Upgrades = 1,
    UpgradeCost = { 2 },
    TipImage = {
        CustomPawn = "ScienceMech",
        Unit = Point(2,2),
        Target = Point(2,1),
        Enemy = Point(2,1),
    }
}

ffrg_Support_Supply_A = ffrg_Support_Supply:new{
    UpgradeDescription = "Grants Supply when targeting Mechs.",
    SupplyAlly = true,
    TipImage = {
        CustomPawn = "ScienceMech",
        Unit = Point(2,3),
        Target = Point(2,2),
        Friendly = Point(2,2),
    }
}

Weapon_Texts.ffrg_Support_Supply_Upgrade1 = "Supply Ally"

function ffrg_Support_Supply:GetTargetArea(point)
    local ret = PointList()
    for i = DIR_START, DIR_END do
        local curr = point+DIR_VECTORS[i]
        if Board:IsValid(curr) then
            ret:push_back(curr)
        end
    end

    return ret
end

function ffrg_Support_Supply:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    local direction = GetDirection(p2-p1)
    local damages = ffrg_Supply.Supply(p1,p1,ret,{returnDamage = true})
    ret:AddDamage(damages)
    ret:AddDelay(0.3)
    if self.SupplyAlly and Board:IsPawnTeam(p2, TEAM_PLAYER) then
        local damage = ffrg_Supply.Supply(p1,p2,ret,{returnDamage = true})
        damage.iPush = direction
        local damagea = SpaceDamage(p2, 0)
        damagea.sAnimation = "airpush_"..direction
        ret:AddDamage(damagea)
        ret:AddDamage(damage)
    else
        local damage = SpaceDamage(p2, 0)
        damage.iPush = direction
        damage.sAnimation = "airpush_"..direction
        ret:AddDamage(damage)
    end

    return ret
end


-----------------------
-- Mounted Armaments --
-----------------------

ffrg_Support_MountedArmaments = Skill:new{
    Name = "Mounted Armaments",
    Class = "",
    Icon = "weapons/ffrg_support_mountedarmaments.png",
    Description = "Fire damaging and pushing projectiles from all allied units.",
    FireSound = "weapons/modified_cannons",
    HitSound = "impact/generic/explosion",
    Animation = "explopush1_",
    ProjectileArt = "effects/shot_mechtank",
    Damage = 1,
    Limited = 1,
    Upgrades = 2,
    UpgradeCost = { 2, 3 },
    TipImage = {
        Unit = Point(2,3),
        Friendly = Point(3,3),
        Friendly2 = Point(1,2),
        Enemy = Point(2,1),
        Enemy2 = Point(1,1),
        Target = Point(2,1)
    }
}

ffrg_Support_MountedArmaments_A = ffrg_Support_MountedArmaments:new{
    Limited = 1
}

ffrg_Support_MountedArmaments_B = ffrg_Support_MountedArmaments:new{
    Damage = 2
}

ffrg_Support_MountedArmaments_AB = ffrg_Support_MountedArmaments:new{
    Limited = 2,
    Damage = 2
}

Weapon_Texts.ffrg_Support_MountedArmaments_Upgrade1 = "+1 Use"
Weapon_Texts.ffrg_Support_MountedArmaments_Upgrade2 = "+1 Damage"

function ffrg_Support_MountedArmaments:GetTargetArea(point)
    local ret = PointList()

    if Board:IsTipImage() then
        ret:push_back(Point(2,1))
        return ret
    end

    ret:push_back(Point(1,3))
    ret:push_back(Point(1,4))
    ret:push_back(Point(2,3))
    ret:push_back(Point(2,4))

    ret:push_back(Point(5,3))
    ret:push_back(Point(5,4))
    ret:push_back(Point(6,3))
    ret:push_back(Point(6,4))

    ret:push_back(Point(3,1))
    ret:push_back(Point(3,2))
    ret:push_back(Point(4,1))
    ret:push_back(Point(4,2))

    ret:push_back(Point(3,5))
    ret:push_back(Point(3,6))
    ret:push_back(Point(4,5))
    ret:push_back(Point(4,6))

    return ret
end

function ffrg_Support_MountedArmaments:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local direction = 0
    if not Board:IsTipImage() then
        if p2.x <= 2 then
            direction = 3
        elseif p2.x >= 5 then
            direction = 1
        elseif p2.y >= 5 then
            direction = 2
        end
    end
    for i = 0,7 do
        for j = 0,7 do
            local point = Point(j,i)
			if direction == DIR_RIGHT then
				point = Point(7 - j, i)
			elseif direction == DIR_UP then
				point = Point(i,j)
			elseif direction == DIR_DOWN then
				point = Point(i,7-j)
			end
			if Board:IsPawnSpace(point) and Board:GetPawn(point):GetTeam() == TEAM_PLAYER and not Board:GetPawn(point):IsDead() and Board:GetPawn(point):IsPowered() and Board:IsValid(point+DIR_VECTORS[direction]) then
                ret:AddDelay(0.2)
                local curr = GetProjectileEnd(point,point+DIR_VECTORS[direction])
                local projectile = SpaceDamage(curr,self.Damage,direction)
                projectile.sAnimation = self.Animation..direction
                projectile.sSound = self.HitSound
                ret:AddDamage(SoundEffect(point, self.FireSound))
                ret:AddProjectile(point,projectile,self.ProjectileArt,NO_DELAY)
            end
        end
    end
    return ret
end

--------------------------
-- Hydrogen Fabricators --
--------------------------

ffrg_Passive_IceSupply = PassiveSkill:new{
    Name = "Hydrogen Fabricators",
    Description = "Any Mech being Frozen removes the Freeze and Supplies the Mech.",
    Class = "",
    Icon = "weapons/ffrg_passive_icesupply.png",
    Passive = "ffrg_Passive_IceSupply",
    PathSize = INT_MAX,
    TipImage = {
        CustomPawn = "ScienceMech",
        Unit = Point(2,3),
        Target = Point(2,1),
        Length = 5
    }
}

function ffrg_Passive_IceSupply:TipVisuals(point)
    if Board:IsPawnSpace(point) then
        Board:GetPawn(point):SetFrozen(false)
    end
    Board:AddAnimation(point,"ffrg_UseSupply", 1)
    Board:Ping(point, GL_Color(255,206,41))
end

function ffrg_Passive_IceSupply:GetSkillEffect(p1,p2)
    local ret = SkillEffect()
    Board:ClearSpace(Point(2,1))
    Board:SetItem(Point(2,1), "Freeze_Mine")
    ret:AddDelay(0.2)
    ret:AddMove(Board:GetPath(p1, p2, PATH_GROUND), FULL_DELAY)
    ret.effect:back().bHide = true
    local unfreeze = SpaceDamage(p2, 0)
    unfreeze.sScript = "ffrg_Passive_IceSupply:TipVisuals("..p2:GetString()..")"
    ret:AddDamage(unfreeze)
    return ret
end

local IceSupplyExceptionID = nil
local IceSupplyExceptionWeapon = ""

local function ffrg_onPawnIsFrozen(mission, pawn, isFrozen)
    if isFrozen and IsPassiveSkill("ffrg_Passive_IceSupply") and pawn:IsMech() then
        pawn:SetFrozen(false)
        if pawn:GetSpace() then
            local point = pawn:GetSpace()
            if pawn:GetId() == IceSupplyExceptionID then
                local index = ffrg_Supply.SupplyIndex(point,point,IceSupplyExceptionWeapon)
                if index > 0 then
                    local damage = ffrg_Supply.Supply(point,point,nil,{returnDamage = true, hideIcon = true, callerPrevent = IceSupplyExceptionWeapon})
                    damage.sAnimation = "nil"
                    Board:DamageSpace(damage)
                    Board:AddAnimation(point,"ffrg_UseSupply", 1)
                end
            else
                local index = ffrg_Supply.SupplyIndex(point,point)
                if index > 0 then
                    local damage = ffrg_Supply.Supply(point,point,nil,{returnDamage = true, hideIcon = true})
                    damage.sAnimation = "nil"
                    Board:DamageSpace(damage)
                    Board:AddAnimation(point,"ffrg_UseSupply", 1)
                end
            end
        end
    end
end

local function ffrg_onSkillBuild(mission, pawn, weaponId, p1, p2)
    if pawn and pawn:IsMech() and IsPassiveSkill("ffrg_Passive_IceSupply") then
        IceSupplyExceptionID = pawn:GetId()
        IceSupplyExceptionWeapon = weaponId
    else
        IceSupplyExceptionID = nil
        IceSupplyExceptionWeapon = ""
    end
end

modapiext.events.onPawnIsFrozen:subscribe(ffrg_onPawnIsFrozen)
modapiext.events.onSkillStart:subscribe(ffrg_onSkillBuild)

--////////////////////////////////--
