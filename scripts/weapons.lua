--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "effects/ffrg_shot_bullet_U.png",
    "effects/ffrg_shot_bullet_R.png",
    "effects/smoke/ffrg_spark_small.png",
    "effects/smoke/ffrg_spark_large.png",
    "combat/icons/ffrg_icon_burrow_miss.png",
    "combat/icons/ffrg_icon_burrow_central_miss.png",
    "effects/ffrg_nil.png",
    "effects/ffrg_rock_shatter.png",
    "effects/ffrg_barrier_shatter.png"
}

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

Location["combat/icons/ffrg_icon_burrow_miss.png"] = Point(-12,23)
Location["combat/icons/ffrg_icon_burrow_central_miss.png"] = Point(-12,8)

ANIMS.ffrg_RockShatter = ANIMS.BaseUnit:new{
    Image = "effects/ffrg_rock_shatter.png",
    PosX = -34,
    PosY = -9,
    NumFrames = 17,
    Time = 0.07,
    Loop = false
}
ANIMS.ffrg_SlabShatter = ANIMS.BaseUnit:new{
    Image = "effects/ffrg_barrier_shatter.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 17,
    Time = 0.07,
    Loop = false
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
