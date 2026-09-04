--////////////////////////////////--
--//    (Impact) Enemy Units    //--
--////////////////////////////////--

--== Vek ==--
-- Bomberbug
-- Caterpillar

--== Bots ==--
-- Shredder Bot

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "units/aliens/ffrg_bomberbug.png",
    "units/aliens/ffrg_bomberbuga.png",
    "units/aliens/ffrg_bomberbug_emerge.png",
    "units/aliens/ffrg_bomberbug_death.png",
    "units/aliens/ffrg_bomberbug_Bw.png",
    "units/aliens/ffrg_caterpillar.png",
    "units/aliens/ffrg_caterpillara.png",
    "units/aliens/ffrg_caterpillar_emerge.png",
    "units/aliens/ffrg_caterpillar_death.png",
    "units/aliens/ffrg_caterpillar_Bw.png",
    "units/snowbots/ffrg_snowshred_1a.png",
    "units/snowbots/ffrg_snowshred_1.png",
    "units/snowbots/ffrg_snowshred_1a.png",
    "units/snowbots/ffrg_snowshred_1_death.png",
    "units/snowbots/ffrg_snowshred_1_off.png",
    "units/snowbots/ffrg_snowshred_2.png",
    "units/snowbots/ffrg_snowshred_2a.png",
    "units/snowbots/ffrg_snowshred_2_death.png",
    "units/snowbots/ffrg_snowshred_2_off.png",
    "units/snowbots/ffrg_bombshred_1.png",
    "units/snowbots/ffrg_bombshred_1a.png",
    "units/snowbots/ffrg_bombshred_1_death.png",
    "units/snowbots/ffrg_bombshred_1_off.png",
    "portraits/enemy/ffrg_Bomberbug1.png",
    "portraits/enemy/ffrg_Bomberbug2.png",
    "portraits/enemy/ffrg_BomberbugB.png",
    "portraits/enemy/ffrg_Caterpillar1.png",
    "portraits/enemy/ffrg_Caterpillar2.png",
    "portraits/enemy/ffrg_CaterpillarB.png",
    "portraits/enemy/ffrg_SnowShred1.png",
    "portraits/enemy/ffrg_SnowShred2.png",
    "portraits/enemy/ffrg_Snowshred1_Boom.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--== Bomberbug ==--
ANIMS.ffrg_bomberbug = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_bomberbug.png",
    PosX = -16,
    PosY = -2
}
ANIMS.ffrg_bomberbuga = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_bomberbuga.png",
    NumFrames = 6,
    PosX = -16,
    PosY = -2
}
ANIMS.ffrg_bomberbuge = ANIMS.BaseEmerge:new{
    Image = "units/aliens/ffrg_bomberbug_emerge.png",
    PosX = -22,
    PosY = -10
}
ANIMS.ffrg_bomberbugd = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_bomberbug_death.png",
    NumFrames = 8,
    PosX = -18,
    PosY = -2,
    Time = 0.14,
    Loop = false,
}
ANIMS.ffrg_bomberbugw = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_bomberbug_Bw.png",
    PosX = -16,
    PosY = 8
}

--== Caterpillar ==--
ANIMS.ffrg_caterpillar = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_caterpillar.png",
    PosX = -20,
    PosY = 2
}
ANIMS.ffrg_caterpillara = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_caterpillara.png",
    NumFrames = 4,
    PosX = -20,
    PosY = 2
}
ANIMS.ffrg_caterpillare = ANIMS.BaseEmerge:new{
    Image = "units/aliens/ffrg_caterpillar_emerge.png",
    PosX = -22,
    PosY = -10
}
ANIMS.ffrg_caterpillard = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_caterpillar_death.png",
    NumFrames = 8,
    Time = 0.14,
    Loop = false,
    PosX = -20,
    PosY = 2
}
ANIMS.ffrg_caterpillarw = ANIMS.EnemyUnit:new{
    Image = "units/aliens/ffrg_caterpillar_Bw.png",
    PosX = -20,
    PosY = 13
}

--== Shredder-Bot ==--
ANIMS.ffrg_snowshred1 = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_1.png",
    PosX = -16,
    PosY = -8
}
ANIMS.ffrg_snowshred1a = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_1a.png",
    NumFrames = 4,
    PosX = -16,
    PosY = -9
}
ANIMS.ffrg_snowshred1d = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_1_death.png",
    NumFrames = 11,
    Time = 0.12,
    Loop = false,
    PosX = -20,
    PosY = -12
}
ANIMS.ffrg_snowshred1off = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_1_off.png",
    PosX = -16,
    PosY = -8
}

--== Shredder-Mech ==--
ANIMS.ffrg_snowshred2 = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_2.png",
    PosX = -16,
    PosY = -8
}
ANIMS.ffrg_snowshred2a = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_2a.png",
    NumFrames = 4,
    PosX = -16,
    PosY = -9
}
ANIMS.ffrg_snowshred2d = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_2_death.png",
    NumFrames = 11,
    Time = 0.12,
    Loop = false,
    PosX = -20,
    PosY = -12
}
ANIMS.ffrg_snowshred2off = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_snowshred_2_off.png",
    PosX = -16,
    PosY = -8
}

--== Boom Shredder ==--
ANIMS.ffrg_bombshred1 = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_bombshred_1.png",
    PosX = -16,
    PosY = -8
}
ANIMS.ffrg_bombshred1a = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_bombshred_1a.png",
    NumFrames = 4,
    PosX = -16,
    PosY = -9
}
ANIMS.ffrg_bombshred1d = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_bombshred_1_death.png",
    NumFrames = 11,
    Time = 0.12,
    Loop = false,
    PosX = -20,
    PosY = -12
}
ANIMS.ffrg_bombshred1off = ANIMS.BaseUnit:new{
    Image = "units/snowbots/ffrg_bombshred_1_off.png",
    PosX = -16,
    PosY = -8
}

--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--


---------------
-- Bomberbug --
---------------

ffrg_Bomberbug1 = Pawn:new{
    Name = "Bomberbug",
    Health = 2,
    MoveSpeed = 3,
    Image = "ffrg_bomberbug",
    SkillList = { "ffrg_BomberbugAtk1" },
    Ranged = 1,
    SoundLocation = "/enemy/firefly_soldier_1/",
    Portrait = "enemy/ffrg_Bomberbug1",
    DefaultTeam = TEAM_ENEMY,
    ImpactMaterial = IMPACT_FLESH,
}
AddPawnName("ffrg_Bomberbug1")


-----------------------
-- Alpha Caterpillar --
-----------------------

ffrg_Bomberbug2 = ffrg_Bomberbug1:new{
    Name = "Alpha Bomberbug",
    Health = 4,
    ImageOffset = 1,
    SkillList = { "ffrg_BomberbugAtk2" },
    Ranged = 1,
    SoundLocation = "/enemy/firefly_soldier_2/",
    Portrait = "enemy/ffrg_Bomberbug2",
    Tier = TIER_ALPHA,
}
AddPawnName("ffrg_Bomberbug2")


----------------------
-- Bomberbug Leader --
----------------------

ffrg_BomberbugBoss = ffrg_Bomberbug1:new{
    Name = "Bomberbug Leader",
    Health = 6,
    ImageOffset = 2,
    SkillList = { "ffrg_BomberbugAtkB" },
    Ranged = 1,
    Portrait = "enemy/ffrg_BomberbugB",
    Tier = TIER_BOSS,
}
AddPawnName("ffrg_BomberbugBoss")


-----------------
-- Caterpillar --
-----------------

ffrg_Caterpillar1 = Pawn:new{
    Name = "Caterpillar",
    Health = 2,
    MoveSpeed = 3,
    Image = "ffrg_caterpillar",
    SkillList = { "ffrg_CaterpillarAtk1" },
    SoundLocation = "/enemy/beetle_1/",
    Portrait = "enemy/ffrg_Caterpillar1",
    DefaultTeam = TEAM_ENEMY,
    ImpactMaterial = IMPACT_FLESH,
}
AddPawnName("ffrg_Caterpillar1")


-----------------------
-- Alpha Caterpillar --
-----------------------

ffrg_Caterpillar2 = ffrg_Caterpillar1:new{
    Name = "Alpha Caterpillar",
    Health = 3,
    ImageOffset = 1,
    SkillList = { "ffrg_CaterpillarAtk2" },
    SoundLocation = "/enemy/beetle_2/",
    Portrait = "enemy/ffrg_Caterpillar2",
    Tier = TIER_ALPHA,
}
AddPawnName("ffrg_Caterpillar2")


------------------------
-- Caterpillar Leader --
------------------------

ffrg_CaterpillarBoss = ffrg_Caterpillar1:new{
    Name = "Caterpillar Leader",
    Health = 5,
    ImageOffset = 2,
    SkillList = { "ffrg_CaterpillarAtkB" },
    Portrait = "enemy/ffrg_CaterpillarB",
    Tier = TIER_BOSS,
}
AddPawnName("ffrg_CaterpillarBoss")


------------------
-- Shredder-Bot --
------------------

ffrg_Snowshred1 = Pawn:new{
    Name = "Shredder-Bot",
    Health = 1,
    MoveSpeed = 4,
    Image = "ffrg_snowshred1",
    SkillList = { "ffrg_SnowshredAtk1" },
    SoundLocation = "/enemy/snowtank_1/",
    Portrait = "enemy/ffrg_SnowShred1",
    DefaultTeam = TEAM_ENEMY,
    DefaultFaction = FACTION_BOTS,
    ImpactMaterial = IMPACT_METAL,
}
AddPawnName("ffrg_Snowshred1")

-------------------
-- Shredder-Mech --
-------------------

ffrg_Snowshred2 = ffrg_Snowshred1:new{
    Name = "Shredder-Mech",
    Image = "ffrg_snowshred2",
    SkillList = { "ffrg_SnowshredAtk2" },
    SoundLocation = "/enemy/snowtank_2/",
    Portrait = "enemy/ffrg_SnowShred2",
    Tier = TIER_ALPHA,
}
AddPawnName("ffrg_Snowshred2")


-------------------
-- Boom Shredder --
-------------------

ffrg_Snowshred1_Boom = ffrg_Snowshred1:new{
    Name = "Boom Shredder",
    Image = "ffrg_bombshred1",
    SkillList = { "ffrg_SnowshredAtk1" },
    Portrait = "enemy/ffrg_Snowshred1_Boom",
    Explodes = true
}
AddPawnName("ffrg_Snowshred1_Boom")
