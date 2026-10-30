--////////////////////////////////--
--//    (Impact) Squad Units    //--
--////////////////////////////////--

--== Fabricated ==--
-- Cannon Turret

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/units/turret/"

local files = {
    "ffrg_turret_cannon.png",
    "ffrg_turret_cannon_ns.png",
    "ffrg_turret_cannon_broken.png",
    "ffrg_turret_cannon_emerge.png",
    "ffrg_turret_cannon_a.png",
    "ffrg_turret_cannon_death.png",
    "ffrg_turret_mortar.png",
    "ffrg_turret_mortar_ns.png",
    "ffrg_turret_mortar_broken.png",
    "ffrg_turret_mortar_emerge.png",
    "ffrg_turret_mortar_a.png",
    "ffrg_turret_mortar_death.png",
    "ffrg_turret_flamer.png",
    "ffrg_turret_flamer_ns.png",
    "ffrg_turret_flamer_broken.png",
    "ffrg_turret_flamer_emerge.png",
    "ffrg_turret_flamer_a.png",
    "ffrg_turret_flamer_death.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/units/turret/".. file, imagePath .. file)
end

--== Cannon Turret ==--
ANIMS.ffrg_turret_cannon = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_cannon.png",
    PosX = -13,
    PosY = 2
}
ANIMS.ffrg_turret_cannona = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_cannon_a.png",
    PosX = -13,
    PosY = 2,
    NumFrames = 6
}
ANIMS.ffrg_turret_cannone = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_cannon_emerge.png",
    PosX = -14,
    PosY = -3,
    NumFrames = 14,
    Time = 0.08,
    Layer = LAYER_FRONT,
    Loop = false
}
ANIMS.ffrg_turret_cannond = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_cannon_death.png",
    PosX = -22,
    PosY = -2,
    NumFrames = 11,
    Time = 0.10,
    Loop = false
}

--== Mortar Turret ==--
ANIMS.ffrg_turret_mortar = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_mortar.png",
    PosX = -13,
    PosY = 2
}
ANIMS.ffrg_turret_mortara = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_mortar_a.png",
    PosX = -13,
    PosY = 2,
    NumFrames = 6
}
ANIMS.ffrg_turret_mortare = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_mortar_emerge.png",
    PosX = -14,
    PosY = -3,
    NumFrames = 14,
    Time = 0.08,
    Layer = LAYER_FRONT,
    Loop = false
}
ANIMS.ffrg_turret_mortard = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_mortar_death.png",
    PosX = -22,
    PosY = -2,
    NumFrames = 11,
    Time = 0.10,
    Loop = false
}

--== Flamer Turret ==--
ANIMS.ffrg_turret_flamer = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_flamer.png",
    PosX = -13,
    PosY = 2
}
ANIMS.ffrg_turret_flamera = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_flamer_a.png",
    PosX = -13,
    PosY = 2,
    NumFrames = 6
}
ANIMS.ffrg_turret_flamere = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_flamer_emerge.png",
    PosX = -14,
    PosY = -3,
    NumFrames = 14,
    Time = 0.08,
    Layer = LAYER_FRONT,
    Loop = false
}
ANIMS.ffrg_turret_flamerd = ANIMS.BaseUnit:new{
    Image = "units/turret/ffrg_turret_flamer_death.png",
    PosX = -22,
    PosY = -2,
    NumFrames = 11,
    Time = 0.10,
    Loop = false
}

--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--


-------------------
-- Cannon Turret --
-------------------

ffrg_CannonTurret = Pawn:new{
    Name = "Cannon Turret",
    Health = 1,
    MoveSpeed = 0,
    Image = "ffrg_turret_cannon",
    SkillList = { "ffrg_Deploy_Multishot" },
    SoundLocation = "/mech/distance/scorpio_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    IgnoreSmoke = true,
    Corpse = false,
    Pushable = false,
}
ffrg_CannonTurretA = ffrg_CannonTurret:new{
    SkillList = { "ffrg_Deploy_Multishot_A" },
}
AddPawnName("ffrg_CannonTurret")
AddPawnName("ffrg_CannonTurretA")


-------------------
-- Mortar Turret --
-------------------

ffrg_MortarTurret = Pawn:new{
    Name = "Mortar Turret",
    Health = 1,
    MoveSpeed = 0,
    Image = "ffrg_turret_mortar",
    SkillList = { "ffrg_Deploy_LightMortar" },
    SoundLocation = "/mech/distance/scorpio_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    IgnoreSmoke = true,
    Corpse = false,
    Pushable = false,
}
ffrg_MortarTurretA = ffrg_MortarTurret:new{
    SkillList = { "ffrg_Deploy_LightMortar_A" },
}
AddPawnName("ffrg_MortarTurret")
AddPawnName("ffrg_MortarTurretA")


-------------------
-- Flamer Turret --
-------------------

ffrg_FlamerTurret = Pawn:new{
    Name = "Flamer Turret",
    Health = 1,
    MoveSpeed = 0,
    Image = "ffrg_turret_flamer",
    SkillList = { "ffrg_Deploy_LightFlamer" },
    SoundLocation = "/mech/distance/scorpio_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    IgnoreSmoke = true,
    Corpse = false,
    Pushable = false,
}
ffrg_FlamerTurretA = ffrg_FlamerTurret:new{
    SkillList = { "ffrg_Deploy_LightFlamer_A" },
}
AddPawnName("ffrg_FlamerTurret")
AddPawnName("ffrg_FlamerTurretA")


--////////////////////////////////--
