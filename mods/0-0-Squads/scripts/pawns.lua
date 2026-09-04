--////////////////////////////////--
--//    (Impact) Squad Units    //--
--////////////////////////////////--

--== Architects ==--
-- Prism Mech
-- Bulwark Mech
-- Disassembly Mech

--== Seismic Colossi ==--
-- Bruiser Mech
-- Strafe Mech
-- Upheaval Mech

--== Fabricated ==--
-- Bastion

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/units/player/"

local files = {
    "ffrg_mech_prism.png",
    "ffrg_mech_prism_a.png",
    "ffrg_mech_prism_w.png",
    "ffrg_mech_prism_w_broken.png",
    "ffrg_mech_prism_broken.png",
    "ffrg_mech_prism_ns.png",
    "ffrg_mech_prism_h.png",
    "ffrg_mech_bulwark.png",
    "ffrg_mech_bulwark_a.png",
    "ffrg_mech_bulwark_w.png",
    "ffrg_mech_bulwark_w_broken.png",
    "ffrg_mech_bulwark_broken.png",
    "ffrg_mech_bulwark_ns.png",
    "ffrg_mech_bulwark_h.png",
    "ffrg_mech_disassembly.png",
    "ffrg_mech_disassembly_a.png",
    "ffrg_mech_disassembly_w.png",
    "ffrg_mech_disassembly_w_broken.png",
    "ffrg_mech_disassembly_broken.png",
    "ffrg_mech_disassembly_ns.png",
    "ffrg_mech_disassembly_h.png",
    "ffrg_mech_bruiser.png",
    "ffrg_mech_bruiser_a.png",
    "ffrg_mech_bruiser_w.png",
    "ffrg_mech_bruiser_w_broken.png",
    "ffrg_mech_bruiser_broken.png",
    "ffrg_mech_bruiser_ns.png",
    "ffrg_mech_bruiser_h.png",
    "ffrg_mech_strafe.png",
    "ffrg_mech_strafe_a.png",
    "ffrg_mech_strafe_w_broken.png",
    "ffrg_mech_strafe_broken.png",
    "ffrg_mech_strafe_ns.png",
    "ffrg_mech_strafe_h.png",
    "ffrg_mech_upheaval.png",
    "ffrg_mech_upheaval_a.png",
    "ffrg_mech_upheaval_w.png",
    "ffrg_mech_upheaval_w_broken.png",
    "ffrg_mech_upheaval_broken.png",
    "ffrg_mech_upheaval_ns.png",
    "ffrg_mech_upheaval_h.png",
    "ffrg_mech_manifold.png",
    "ffrg_mech_manifold_a.png",
    "ffrg_mech_manifold_w.png",
    "ffrg_mech_manifold_w_broken.png",
    "ffrg_mech_manifold_broken.png",
    "ffrg_mech_manifold_ns.png",
    "ffrg_mech_manifold_h.png",
    "ffrg_mech_razor.png",
    "ffrg_mech_razor_a.png",
    "ffrg_mech_razor_w.png",
    "ffrg_mech_razor_w_broken.png",
    "ffrg_mech_razor_broken.png",
    "ffrg_mech_razor_ns.png",
    "ffrg_mech_razor_h.png",
    "ffrg_mech_maintenance.png",
    "ffrg_mech_maintenance_a.png",
    "ffrg_mech_maintenance_w.png",
    "ffrg_mech_maintenance_w_broken.png",
    "ffrg_mech_maintenance_broken.png",
    "ffrg_mech_maintenance_ns.png",
    "ffrg_mech_maintenance_h.png",
    "ffrg_bastion.png",
    "ffrg_bastion_a.png",
    "ffrg_bastion_death.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/units/player/".. file, imagePath .. file)
end

--== Prism Mech ==--
ANIMS.ffrg_mech_prism = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_prism.png",
    PosX = -16,
    PosY = -13
}
ANIMS.ffrg_mech_prisma = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_prism_a.png",
    PosX = -16,
    PosY = -15,
    NumFrames = 6
}
ANIMS.ffrg_mech_prismw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_prism_w.png",
    PosX = -16,
    PosY = 4
}
ANIMS.ffrg_mech_prism_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_prism_broken.png",
    PosX = -16,
    PosY = -10
}
ANIMS.ffrg_mech_prismw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_prism_w_broken.png",
    PosX = -16,
    PosY = 13
}
ANIMS.ffrg_mech_prism_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_prism_ns.png"
}

--== Bulwark Mech ==--
ANIMS.ffrg_mech_bulwark = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bulwark.png",
    PosX = -20,
    PosY = -7
}
ANIMS.ffrg_mech_bulwarka = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bulwark_a.png",
    PosX = -20,
    PosY = -7,
    NumFrames = 6
}
ANIMS.ffrg_mech_bulwarkw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bulwark_w.png",
    PosX = -20,
    PosY = 5
}
ANIMS.ffrg_mech_bulwark_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bulwark_broken.png",
    PosX = -20,
    PosY = -6
}
ANIMS.ffrg_mech_bulwarkw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bulwark_w_broken.png",
    PosX = -20,
    PosY = 6
}
ANIMS.ffrg_mech_bulwark_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_bulwark_ns.png"
}

--== Disassembly Mech ==--
ANIMS.ffrg_mech_disassembly = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_disassembly.png",
    PosX = -17,
    PosY = 3
}
ANIMS.ffrg_mech_disassemblya = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_disassembly_a.png",
    PosX = -17,
    PosY = 3,
    NumFrames = 4
}
ANIMS.ffrg_mech_disassemblyw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_disassembly_w.png",
    PosX = -17,
    PosY = 15
}
ANIMS.ffrg_mech_disassembly_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_disassembly_broken.png",
    PosX = -16,
    PosY = 4
}
ANIMS.ffrg_mech_disassemblyw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_disassembly_w_broken.png",
    PosX = -16,
    PosY = 16
}
ANIMS.ffrg_mech_disassembly_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_disassembly_ns.png"
}

--== Bruiser Mech ==--
ANIMS.ffrg_mech_bruiser = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bruiser.png",
    PosX = -17,
    PosY = -8
}
ANIMS.ffrg_mech_bruisera = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bruiser_a.png",
    PosX = -17,
    PosY = -8,
    NumFrames = 4
}
ANIMS.ffrg_mech_bruiserw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bruiser_w.png",
    PosX = -17,
    PosY = 7
}
ANIMS.ffrg_mech_bruiser_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bruiser_broken.png",
    PosX = -19,
    PosY = 1
}
ANIMS.ffrg_mech_bruiserw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_bruiser_w_broken.png",
    PosX = -16,
    PosY = 13
}
ANIMS.ffrg_mech_bruiser_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_bruiser_ns.png"
}

--== Strafe Mech ==--
ANIMS.ffrg_mech_strafe = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_strafe.png",
    PosX = -19,
    PosY = -8
}
ANIMS.ffrg_mech_strafea = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_strafe_a.png",
    PosX = -19,
    PosY = -8,
    NumFrames = 4
}
ANIMS.ffrg_mech_strafe_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_strafe_broken.png",
    PosX = -19,
    PosY = 6
}
ANIMS.ffrg_mech_strafew_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_strafe_w_broken.png",
    PosX = -15,
    PosY = 14
}
ANIMS.ffrg_mech_strafe_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_strafe_ns.png"
}

--== Upheaval Mech ==--
ANIMS.ffrg_mech_upheaval = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_upheaval.png",
    PosX = -19,
    PosY = -11
}
ANIMS.ffrg_mech_upheavala = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_upheaval_a.png",
    PosX = -19,
    PosY = -15,
    NumFrames = 8
}
ANIMS.ffrg_mech_upheavalw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_upheaval_w.png",
    PosX = -18,
    PosY = 2
}
ANIMS.ffrg_mech_upheaval_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_upheaval_broken.png",
    PosX = -21,
    PosY = -4
}
ANIMS.ffrg_mech_upheavalw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_upheaval_w_broken.png",
    PosX = -14,
    PosY = 9
}
ANIMS.ffrg_mech_upheaval_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_upheaval_ns.png"
}

--== Manifold Mech ==--
ANIMS.ffrg_mech_manifold = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_manifold.png",
    PosX = -19,
    PosY = -13
}
ANIMS.ffrg_mech_manifolda = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_manifold_a.png",
    PosX = -19,
    PosY = -13,
    NumFrames = 4
}
ANIMS.ffrg_mech_manifoldw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_manifold_w.png",
    PosX = -19,
    PosY = 4
}
ANIMS.ffrg_mech_manifold_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_manifold_broken.png",
    PosX = -18,
    PosY = -5
}
ANIMS.ffrg_mech_manifoldw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_manifold_w_broken.png",
    PosX = -18,
    PosY = 11
}
ANIMS.ffrg_mech_manifold_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_manifold_ns.png"
}

--== Razor Mech ==--
ANIMS.ffrg_mech_razor = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_razor.png",
    PosX = -18,
    PosY = 1
}
ANIMS.ffrg_mech_razora = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_razor_a.png",
    PosX = -18,
    PosY = 1,
    NumFrames = 4
}
ANIMS.ffrg_mech_razorw = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_razor_w.png",
    PosX = -19,
    PosY = 12
}
ANIMS.ffrg_mech_razor_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_razor_broken.png",
    PosX = -18,
    PosY = 4
}
ANIMS.ffrg_mech_razorw_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_razor_w_broken.png",
    PosX = -18,
    PosY = 15
}
ANIMS.ffrg_mech_razor_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_razor_ns.png"
}

--== Maintenance Mech ==--
ANIMS.ffrg_mech_maintenance = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_maintenance.png",
    PosX = -20,
    PosY = -6
}
ANIMS.ffrg_mech_maintenancea = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_maintenance_a.png",
    PosX = -20,
    PosY = -6,
    NumFrames = 4
}
ANIMS.ffrg_mech_maintenancew = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_maintenance_w.png",
    PosX = -18,
    PosY = 7
}
ANIMS.ffrg_mech_maintenance_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_maintenance_broken.png",
    PosX = -19,
    PosY = 0
}
ANIMS.ffrg_mech_maintenancew_broken = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_mech_maintenance_w_broken.png",
    PosX = -18,
    PosY = 13
}
ANIMS.ffrg_mech_maintenance_ns = ANIMS.MechIcon:new{
    Image = "units/player/ffrg_mech_maintenance_ns.png"
}

--== Bastion ==--
ANIMS.ffrg_bastion = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_bastion.png",
    PosX = -15,
    PosY = 5
}
ANIMS.ffrg_bastiona = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_bastion_a.png",
    PosX = -15,
    PosY = 5,
    NumFrames = 4
}
ANIMS.ffrg_bastiond = ANIMS.MechUnit:new{
    Image = "units/player/ffrg_bastion_death.png",
    PosX = -25,
    PosY = -8,
    NumFrames = 11,
    Time = 0.14,
    Loop = false
}

--////////////////////////////////--





--////////////////////////////////--
--//          Palettes          //--
--////////////////////////////////--


--== Architects == Blue and Gold ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_ArchitectsColors",
    Name = "Architects",
    PlateHighlight = {216, 253, 245},	--lights
    PlateLight     = {86, 128, 250},	--main light
    PlateMid       = {46, 49, 177},		--main mid
    PlateDark      = {40, 32, 92},		--main dark
    PlateOutline   = {15, 16, 22},		--main outline
    PlateShadow    = {59, 41, 36},		--metal dark
    BodyColor      = {127, 92, 63},	    --metal mid
    BodyHighlight  = {211, 192, 112},	--metal light
})
local architectsPalette = modApi:getPaletteImageOffset("ffrg_ArchitectsColors")


--== Seismic Colossi == Gray and Rose ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_SeismicColors",
    Name = "Seismic Colossi",
    PlateHighlight = {129, 255, 184},	--lights
    PlateLight     = {107, 114, 115},	--main light
    PlateMid       = {61, 64, 69},		--main mid
    PlateDark      = {35, 36, 40},		--main dark
    PlateOutline   = {15, 15, 22},		--main outline
    PlateShadow    = {50, 26, 27},		--metal dark
    BodyColor      = {102, 70, 69},	    --metal mid
    BodyHighlight  = {167, 141, 137},	--metal light
})
local seismicPalette = modApi:getPaletteImageOffset("ffrg_SeismicColors")

--////////////////////////////////--


--== Frenzy == Crimson and Silver ==--
local pathScripts = mod_loader.mods[modApi.currentMod].scriptPath
modApi:addPalette({
    ID = "ffrg_FrenzyColors",
    Name = "Frenzy",
    PlateHighlight = {252, 208, 251},	--lights
    PlateLight     = {254, 43, 83},	    --main light
    PlateMid       = {131, 27, 31},		--main mid
    PlateDark      = {65, 12, 23},		--main dark
    PlateOutline   = {35, 6, 15},		--main outline
    PlateShadow    = {31, 39, 51},		--metal dark
    BodyColor      = {60, 86, 89},	    --metal mid
    BodyHighlight  = {125, 159, 146},	--metal light
})
local frenzyPalette = modApi:getPaletteImageOffset("ffrg_FrenzyColors")


--////////////////////////////////--





--////////////////////////////////--
--//            Units           //--
--////////////////////////////////--


----------------
-- Prism Mech --
----------------

ffrg_PrismMech = Pawn:new{
    Name = "Prism Mech",
    Class = "Prime",
    Health = 2,
    MoveSpeed = 5,
    Image = "ffrg_mech_prism",
    ImageOffset = architectsPalette,
    SkillList = { "Prime_PrismLaser" },
    SoundLocation = "/mech/brute/pierce_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
    LargeShield = true,
}


------------------
-- Bulwark Mech --
------------------

ffrg_BulwarkMech = Pawn:new{
    Name = "Bulwark Mech",
    Class = "Ranged",
    Health = 4,
    MoveSpeed = 3,
    Image = "ffrg_mech_bulwark",
    ImageOffset = architectsPalette,
    SkillList = { "ffrg_Ranged_DeployBastion" },
    SoundLocation = "/mech/prime/bottlecap_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
    LargeShield = true,
}


----------------------
-- Disassembly Mech --
----------------------

ffrg_DisassemblyMech = Pawn:new{
    Name = "Disassembly Mech",
    Class = "Science",
    Health = 2,
    MoveSpeed = 3,
    Image = "ffrg_mech_disassembly",
    ImageOffset = architectsPalette,
    SkillList = { "ffrg_Science_KO_Shred", "ffrg_Science_TC_LongTele" },
    SoundLocation = "/mech/distance/scorpio_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
    Armor = true,
}


-------------------
-- Bruiser Mech --
-------------------

ffrg_BruiserMech = Pawn:new{
    Name = "Bruiser Mech",
    Class = "Prime",
    Health = 3,
    MoveSpeed = 4,
    Image = "ffrg_mech_bruiser",
    ImageOffset = seismicPalette,
    SkillList = { "ffrg_Prime_BoulderFlail" },
    SoundLocation = "/mech/prime/smoke_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}


-------------------
-- Strafe Mech --
-------------------

ffrg_StrafeMech = Pawn:new{
    Name = "Strafe Mech",
    Class = "Brute",
    Health = 2,
    MoveSpeed = 3,
    Image = "ffrg_mech_strafe",
    ImageOffset = seismicPalette,
    SkillList = { "ffrg_Brute_Rotary"},
    SoundLocation = "/mech/flying/jet_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
    Flying = true,
}


-------------------
-- Upheaval Mech --
-------------------

ffrg_UpheavalMech = Pawn:new{
    Name = "Upheaval Mech",
    Class = "Science",
    Health = 3,
    MoveSpeed = 3,
    Image = "ffrg_mech_upheaval",
    ImageOffset = seismicPalette,
    SkillList = { "ffrg_Science_KO_Telefrag", "ffrg_Science_TC_Upheaval" },
    SoundLocation = "/mech/science/napalm_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}


-------------------
-- Manifold Mech --
-------------------

ffrg_ManifoldMech = Pawn:new{
    Name = "Manifold Mech",
    Class = "Prime",
    Health = 3,
    MoveSpeed = 4,
    Image = "ffrg_mech_manifold",
    ImageOffset = frenzyPalette,
    SkillList = { "ffrg_Prime_TC_MultiToss" },
    SoundLocation = "/mech/distance/trimissile_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
    LargeShield = true,
}


----------------
-- Razor Mech --
----------------

ffrg_RazorMech = Pawn:new{
    Name = "Razor Mech",
    Class = "Brute",
    Health = 2,
    MoveSpeed = 4,
    Image = "ffrg_mech_razor",
    ImageOffset = frenzyPalette,
    SkillList = { "ffrg_Brute_SawCharge" },
    SoundLocation = "/support/vip_truck/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}


----------------------
-- Maintenance Mech --
----------------------

ffrg_MaintenanceMech = Pawn:new{
    Name = "Maintenance Mech",
    Class = "Ranged",
    Health = 3,
    MoveSpeed = 3,
    Image = "ffrg_mech_maintenance",
    ImageOffset = frenzyPalette,
    SkillList = { "ffrg_Ranged_TC_Maintenance", "ffrg_Passive_Phoenix" },
    SoundLocation = "/mech/distance/bombling_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Massive = true,
}


-------------
-- Bastion --
-------------

ffrg_Bastion = Pawn:new{
    Name = "Bastion",
    Health = 2,
    MoveSpeed = 2,
    Image = "ffrg_bastion",
    SkillList = {},
    SoundLocation = "/mech/brute/bulk_mech/",
    DefaultTeam = TEAM_PLAYER,
    ImpactMaterial = IMPACT_METAL,
    Corpse = false,
}

ffrg_BastionA = ffrg_Bastion:new{
    MoveSpeed = 3
}
ffrg_BastionB = ffrg_Bastion:new{
    Armor = true
}
ffrg_BastionAB = ffrg_Bastion:new{
    MoveSpeed = 3,
    Armor = true
}

--////////////////////////////////--
