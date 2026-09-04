--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "effects/ffrg_swipe_main.png",
    "effects/ffrg_swipe_alt.png",
    "effects/ffrg_saw_main.png",
    "effects/ffrg_saw_alt.png",
    "effects/smoke/ffrg_spark_small.png",
    "effects/smoke/ffrg_spark_large.png",
    "combat/icons/ffrg_icon_burrow_miss.png",
    "combat/icons/ffrg_icon_burrow_central_miss.png",
    "effects/ffrg_nil.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

Location["combat/icons/ffrg_icon_burrow_miss.png"] = Point(-12,23)
Location["combat/icons/ffrg_icon_burrow_central_miss.png"] = Point(-12,8)

ANIMS.ffrg_Swipe1 = Animation:new{
    Image = "effects/ffrg_swipe_main.png",
    NumFrames = 6,
    Time = 0.03,
    PosX = -15,
    PosY = 6
}
ANIMS.ffrg_Swipe2 = Animation:new{
    Image = "effects/ffrg_swipe_alt.png",
    NumFrames = 6,
    Time = 0.03,
    PosX = -17,
    PosY = 6
}

-- Saw Timings:
-- Delay 0.1 to Start
-- Damage + Delay 0.1
-- Repeat above per hit

ANIMS.ffrg_Saw1_Main = Animation:new{
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,6,7,8,9},
    PosX = -17,
    PosY = 0
}
ANIMS.ffrg_Saw2_Main = Animation:new{
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,6,7,8,9},
    PosX = -17,
    PosY = 0
}
ANIMS.ffrg_Saw3_Main = Animation:new{
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,6,7,8,9},
    PosX = -17,
    PosY = 0
}
ANIMS.ffrg_Saw4_Main = Animation:new{
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,4,5,6,7,8,9},
    PosX = -17,
    PosY = 0
}
ANIMS.ffrg_Saw5_Main = Animation:new{
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,4,5,4,5,6,7,8,9},
    PosX = -17,
    PosY = 0
}
ANIMS.ffrg_Saw1_Alt = Animation:new{
    Image = "effects/ffrg_saw_alt.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,6,7,8,9},
    PosX = -9,
    PosY = 0
}
ANIMS.ffrg_Saw2_Alt = Animation:new{
    Image = "effects/ffrg_saw_alt.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,6,7,8,9},
    PosX = -9,
    PosY = 0
}
ANIMS.ffrg_Saw3_Alt = Animation:new{
    Image = "effects/ffrg_saw_alt.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,6,7,8,9},
    PosX = -9,
    PosY = 0
}
ANIMS.ffrg_Saw4_Alt = Animation:new{
    Image = "effects/ffrg_saw_alt.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,4,5,6,7,8,9},
    PosX = -9,
    PosY = 0
}
ANIMS.ffrg_Saw5_Alt = Animation:new{
    Image = "effects/ffrg_saw_alt.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,4,5,4,5,4,5,4,5,6,7,8,9},
    PosX = -9,
    PosY = 0
}

ffrg_Emitter_SparkSmall_Saw_Main = Emitter:new{
    image = "effects/smoke/ffrg_spark_small.png",
    x = 0,
    y = 15,
    burst_count = 10,
    max_alpha = 1,
    min_alpha = 0.4,
    angle = 80,
    variance_x = 2,
    variance_y = 6,
    angle_variance = 45,
    lifespan = 0.15,
    max_particles = 64,
    speed = 12,
    gravity = true,
    layer = LAYER_FRONT
}
ffrg_Emitter_SparkLarge_Saw_Main = ffrg_Emitter_SparkSmall_Saw_Main:new{
    image = "effects/smoke/ffrg_spark_large.png",
    burst_count = 5
}
ffrg_Emitter_SparkSmall_Saw_Alt = Emitter:new{
    image = "effects/smoke/ffrg_spark_small.png",
    x = 0,
    y = 15,
    burst_count = 10,
    max_alpha = 1,
    min_alpha = 0.4,
    angle = 145,
    variance_x = 2,
    variance_y = 6,
    angle_variance = 45,
    lifespan = 0.15,
    max_particles = 64,
    speed = 12,
    gravity = true,
    layer = LAYER_FRONT
}
ffrg_Emitter_SparkLarge_Saw_Alt = ffrg_Emitter_SparkSmall_Saw_Alt:new{
    image = "effects/smoke/ffrg_spark_large.png",
    burst_count = 5
}


--////////////////////////////////--
