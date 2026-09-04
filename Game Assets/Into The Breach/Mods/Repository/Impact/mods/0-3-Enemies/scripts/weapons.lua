--////////////////////////////////--
--//   (Impact) Enemy Weapons   //--
--////////////////////////////////--

--== Vek ==--
-- Sizzling Expulsion
-- Scalding Expulsion
-- Igneous Expulsion
-- Frigid Breath
-- Glacial Breath
-- Hyperborean Breath

--== Bot ==--
-- shR30 Processor Mark 1
-- shR30 Processor Mark 2

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "effects/ffrg_explo_bomberbug1_U.png",
    "effects/ffrg_explo_bomberbug1_R.png",
    "effects/ffrg_explo_bomberbug1_D.png",
    "effects/ffrg_explo_bomberbug1_L.png",
    "effects/ffrg_explo_bomberbug2_U.png",
    "effects/ffrg_explo_bomberbug2_R.png",
    "effects/ffrg_explo_bomberbug2_D.png",
    "effects/ffrg_explo_bomberbug2_L.png",
    "effects/ffrg_explo_bomberbugB_U.png",
    "effects/ffrg_explo_bomberbugB_R.png",
    "effects/ffrg_explo_bomberbugB_D.png",
    "effects/ffrg_explo_bomberbugB_L.png",
    "effects/ffrg_shot_bomberbug1_U.png",
    "effects/ffrg_shot_bomberbug1_R.png",
    "effects/ffrg_shot_bomberbug2_U.png",
    "effects/ffrg_shot_bomberbug2_R.png",
    "effects/ffrg_shot_bomberbugB_U.png",
    "effects/ffrg_shot_bomberbugB_R.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

ANIMS.ffrg_ExploBomberbug1_0 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug1_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -14
}
ANIMS.ffrg_ExploBomberbug1_1 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug1_R.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbug1_2 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug1_D.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbug1_3 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug1_L.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -14
}
ANIMS.ffrg_ExploBomberbug2_0 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug2_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -14
}
ANIMS.ffrg_ExploBomberbug2_1 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug2_R.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbug2_2 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug2_D.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbug2_3 = Animation:new{
    Image = "effects/ffrg_explo_bomberbug2_L.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -14
}
ANIMS.ffrg_ExploBomberbugB_0 = Animation:new{
    Image = "effects/ffrg_explo_bomberbugB_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -14
}
ANIMS.ffrg_ExploBomberbugB_1 = Animation:new{
    Image = "effects/ffrg_explo_bomberbugB_R.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbugB_2 = Animation:new{
    Image = "effects/ffrg_explo_bomberbugB_D.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -2
}
ANIMS.ffrg_ExploBomberbugB_3 = Animation:new{
    Image = "effects/ffrg_explo_bomberbugB_L.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -41,
    PosY = -14
}

--////////////////////////////////--





--////////////////////////////////--
--//           Weapons          //--
--////////////////////////////////--


----------------
-- Expulsions --
----------------

ffrg_BomberbugAtk1 = Skill:new{
    Name = "Sizzling Expulsion",
    Class = "Enemy",
    Description = "Fire two damaging and pushing projectiles in sequence.",
    PathSize = 1,
    ProjectileArt = "effects/ffrg_shot_bomberbug1",
    LaunchSound = "",
    Sound = "/enemy/firefly_soldier_1/attack",
    HitSound = "/impact/dynamic/enemy_projectile",
    Animation = "ffrg_ExploBomberbug1_",
    Projectiles = 2,
    IgniteBehind = false,
    Damage2 = 1,
    TipDamageCustom = "1x2",
    Delay = 0.50,
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Target = Point(2,3),
        Length = 5,
        CustomPawn = "ffrg_Bomberbug1"
    }
}

function ffrg_BomberbugAtk1:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local dir = GetDirection(p2 - p1)

    if self.IgniteBehind then
        local ignition = SpaceDamage(p1 - DIR_VECTORS[dir], 0)
        ignition.iFire = EFFECT_CREATE
        ignition.sAnimation = "explo_fire1"
        ret:AddQueuedDamage(ignition)
    end

    ffrg_Multihit.MultihitProjectile(self.Damage2, self.Projectiles, p1, dir, {queued = true, ret = ret, origin = p1, push = true, mode = "simple", delay = self.Delay, sfx_fire = self.Sound, sfx_hit = self.HitSound, proj_art = self.ProjectileArt, anim = self.Animation, anim_directional = "forwards"})
    return ret
end

ffrg_BomberbugAtk2 = ffrg_BomberbugAtk1:new{
    Name = "Scalding Expulsion",
    Description = "Fire two damaging and pushing projectiles in sequence.",
    ProjectileArt = "effects/ffrg_shot_bomberbug2",
    Sound = "/enemy/firefly_soldier_2/attack",
    Animation = "ffrg_ExploBomberbug2_",
    Damage2 = 2,
    TipDamageCustom = "2x2",
    TipImage = {
        Unit = Point(2,4),
        Enemy = Point(2,2),
        Target = Point(2,2),
        Length = 5,
        CustomPawn = "ffrg_Bomberbug2"
    }
}

ffrg_BomberbugAtkB = ffrg_BomberbugAtk1:new{
    Name = "Igneous Expulsion",
    Description = "Fire three damaging and pushing projectiles in sequence. Ignite the tile behind the user.",
    ProjectileArt = "effects/ffrg_shot_bomberbugB",
    Animation = "ffrg_ExploBomberbugB_",
    Damage2 = 2,
    Projectiles = 3,
    IgniteBehind = true,
    TipDamageCustom = "2x3",
    TipImage = {
        Unit = Point(2,3),
        Enemy = Point(2,1),
        Target = Point(2,1),
        Length = 5,
        CustomPawn = "ffrg_BomberbugBoss"
    }
}


-------------
-- Breaths --
-------------

ffrg_CaterpillarAtk1 = Skill:new{
    Name = "Frigid Breath",
    Class = "Enemy",
    Description = "Freeze an adjacent tile, then prepare to attack it twice.",
    PathSize = 1,
    Damage2 = 2,
    TipDamageCustom = "2x2",
    Attacks = 2,
    LaunchSound = "",
    Sound = "/enemy/hornet_1/attack",
    Animation = "ffrg_Swipe1",
    AlternateAnimation = "ffrg_Swipe2",
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        CustomPawn = "ffrg_Caterpillar1"
    }
}

function ffrg_CaterpillarAtk1:GetSkillEffect(p1, p2)
    local ret = SkillEffect()
    local damage = SpaceDamage(p2, 0)
    damage.iFrozen = EFFECT_CREATE
    if self.Smoke == true then
        damage.iSmoke = EFFECT_CREATE
    end
    ret:AddDamage(damage)
    ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2, {mode = "simple", queued = true, origin = p1, ret = ret, delay = 0.25, sfx = self.Sound, anim = self.Animation, anim_alt = self.AlternateAnimation, force_ice = true})
    return ret
end

ffrg_CaterpillarAtk2 = ffrg_CaterpillarAtk1:new{
    Name = "Glacial Breath",
    Description = "Freeze an adjacent tile, then prepare to attack it twice.",
    TipDamageCustom = "3x2",
    Damage2 = 3,
    Sound = "/enemy/hornet_2/attack",
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        CustomPawn = "ffrg_Caterpillar2"
    }
}

ffrg_CaterpillarAtkB = ffrg_CaterpillarAtk1:new{
    Name = "Hyperborean Breath",
    Description = "Freeze and Smoke an adjacent tile, then prepare to attack it three times.",
    TipDamageCustom = "2x3",
    Smoke = true,
    Damage2 = 2,
    Attacks = 3,
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        CustomPawn = "ffrg_CaterpillarBoss"
    }
}


----------------------
-- shR30 Processors --
----------------------

ffrg_SnowshredAtk1 = Skill:new{
    Name = "shR30 Processor Mark 1",
    Class = "Enemy",
    Description = "Attack an adjacent tile three times.",
    PathSize = 1,
    Damage2 = 1,
    TipDamageCustom = "1x3",
    Attacks = 3,
    LaunchSound = "",
    Sound = "/impact/generic/arachnoid",
    Animation = "ffrg_Swipe1",
    AlternateAnimation = "ffrg_Swipe2",
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        CustomPawn = "ffrg_Snowshred1"
    }
}

function ffrg_SnowshredAtk1:GetSkillEffect(p1, p2)
local ret = SkillEffect()
ffrg_Multihit.MultihitMelee(self.Damage2, self.Attacks, p2, {mode = "simple", queued = true, origin = p1, ret = ret, delay = 0.15, sfx = self.Sound, anim = self.Animation, anim_alt = self.AlternateAnimation})
return ret
end

ffrg_SnowshredAtk2 = ffrg_SnowshredAtk1:new{
    Name = "shR30 Processor Mark 2",
    Description = "Attack an adjacent tile five times.",
    TipDamageCustom = "1x5",
    Attacks = 5,
    TipImage = {
        Unit = Point(2,2),
        Enemy = Point(2,1),
        Target = Point(2,1),
        CustomPawn = "ffrg_Snowshred2",
        Length = 4
    }
}
