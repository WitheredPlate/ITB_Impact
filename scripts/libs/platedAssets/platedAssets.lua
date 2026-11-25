--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--  WitheredPlate's Asset Library --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## This is a library of (mostly) animation assets that are flexible and general-use.
--## Feel free to use any of the content defined in this file, even without my express permission.
--## I have far more animations in my content packs, but anything I left out of this library is distinctive for the weapon it is created by and I am not comfortable with said animations being used without my consent.


--------------------------
-- Available Animations --
--------------------------

--## ffrg_ExploFireflyPush[[tier]]_[[direction]]
-- A directional version of the vanilla Firefly goop explosion. Good for pushing attacks with similar visuals to the Firefly attacks.
-- [[tier]] can be the following values:
    -- 1 is the standard blue variation.
    -- 2 is the green variation typically used for Alpha Vek.
    -- B is the yellow variation typically used for Vek Leaders.
-- [[direction]] indicates the direction the animation faces.

--## ffrg_ExploAcidPush_[[direction]]
-- Just as the vanilla acid explosion is a retextured firefly explosion with acid colors, this is a retextured firefly push explosion with acid colors.
-- [[direction]] indicates the direction the animation faces.

--## ffrg_airflip_[[rotation]]
-- A stationary whirl of air visually similar to the 'airpush' animation that's useful for flipping or rotating attacks.
-- [[rotation]] can be the following values:
    -- 0 is a visual clockwise rotation.
    -- 1 is a visual counterclockwise rotation.

--## ffrg_exploflip_[[rotation]]
-- A stationary vortex explosion visually similar to the variety of 'explo' animations that's useful for flipping or rotating attacks.
-- [[rotation]] can be the following values:
    -- 0 is a visual clockwise rotation.
    -- 1 is a visual counterclockwise rotation.

--## ffrg_explolong_[[direction]]
-- A long, thin explosion visually similar to the 'explopush' animations that's useful for the impact of projectiles with a similar shape.
-- [[direction]] indicates the direction the animation faces.

--## ffrg_Swipe[[orientation]]
-- A very quick 3-pronged swipe. Useful for rapidly dealing damage to a single tile several times in a row by alternating between the orientations.
-- [[orientation]] can be the following values:
    -- 0 aligns the animation along the vertical axis.
    -- 1 aligns the animation along the horizontal axis.

--## ffrg_Saw[[orientation]]_[[duration]]
-- A variable-duration spinning sawblade that appears and disappears smoothly.
-- [[orientation]] can be the following values:
    -- 0 aligns the animation along the vertical axis.
    -- 1 aligns the animation along the horizontal axis.
-- [[duration]] ranges from 1 to 5, where each step increases the duration of the sawing by 0.1 seconds.


-------------------
-- Other Content --
-------------------

--## Slabs
-- Armored, 2-health variants of Rocks used across WitheredPlate content.
-- Like Rocks, has an explosive variant with Volatile Decay.
-- Called by the pawn ids "ffrg_Slab1" and "ffrg_BombSlab1," appending a "_Thrown" to the end to skip the normal emerge animation.


--////////////////////////////////--





--////////////////////////////////--
--//       Version Control      //--
--////////////////////////////////--


ffrg_PlatedAssets = ffrg_PlatedAssets or {}
ffrg_PlatedAssets.Newest = ffrg_PlatedAssets.Newest

if not ffrg_PlatedAssets.Newest then
    ffrg_PlatedAssets.Newest = VERSION
else
    if not modApi:isVersion(VERSION,ffrg_PlatedAssets.Newest) or ffrg_PlatedAssets.Newest == VERSION then return end
end


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--


local Animations = {

----------
-- Slab --
----------

{ "ffrg_barrier1", "BaseUnit", {
    Image = "units/inanimate/ffrg_barrier_1.png",
    PosX = -19,
    PosY = -14
}},
{ "ffrg_barrier1d", "BaseUnit", {
    Image = "units/inanimate/ffrg_barrier_1_death.png",
    PosX = -36,
    PosY = -30,
    NumFrames = 13,
    Time = 0.09,
    Loop = false
}},
{ "ffrg_barrier1e", "BaseUnit", {
    Image = "units/inanimate/ffrg_barrier_1_emerge.png",
    PosX = -24,
    PosY = -14,
    NumFrames = 10,
    Time = 0.06,
    Loop = false
}},
{ "ffrg_barrier1_thrown", "ffrg_barrier1", {}},
{ "ffrg_barrier1_thrownd", "ffrg_barrier1d", {}},
{ "ffrg_barrier2", "ffrg_barrier1", { Image = "units/inanimate/ffrg_barrier_2.png" }},
{ "ffrg_barrier2d", "ffrg_barrier1d", { Image = "units/inanimate/ffrg_barrier_2_death.png" }},
{ "ffrg_barrier2e", "ffrg_barrier1e", { Image = "units/inanimate/ffrg_barrier_2_emerge.png" }},
{ "ffrg_barrier2_thrown", "ffrg_barrier2", {}},
{ "ffrg_barrier2_thrownd", "ffrg_barrier2d", {}},


------------------
-- Pushing Goop --
------------------

{ "ffrg_ExploFireflyPush1_0", "Animation", {
    Image = "effects/ffrg_explo_fireflypush1_U.png",
    NumFrames = 8,
    Time = 0.05,
    PosX = -15,
    PosY = -14
}},
{ "ffrg_ExploFireflyPush1_1", "ffrg_ExploFireflyPush1_0", {
    Image = "effects/ffrg_explo_fireflypush1_R.png",
    PosY = -2
}},
{ "ffrg_ExploFireflyPush1_2", "ffrg_ExploFireflyPush1_0", {
    Image = "effects/ffrg_explo_fireflypush1_D.png",
    PosX = -41,
    PosY = -2
}},
{ "ffrg_ExploFireflyPush1_3", "ffrg_ExploFireflyPush1_0", {
    Image = "effects/ffrg_explo_fireflypush1_L.png",
    PosX = -41
}},
{ "ffrg_ExploFireflyPush2_0", "ffrg_ExploFireflyPush1_0", { Image = "effects/ffrg_explo_fireflypush2_U.png" }},
{ "ffrg_ExploFireflyPush2_1", "ffrg_ExploFireflyPush1_1", { Image = "effects/ffrg_explo_fireflypush2_R.png" }},
{ "ffrg_ExploFireflyPush2_2", "ffrg_ExploFireflyPush1_2", { Image = "effects/ffrg_explo_fireflypush2_D.png" }},
{ "ffrg_ExploFireflyPush2_3", "ffrg_ExploFireflyPush1_3", { Image = "effects/ffrg_explo_fireflypush2_L.png" }},
{ "ffrg_ExploFireflyPushB_0", "ffrg_ExploFireflyPush1_0", { Image = "effects/ffrg_explo_fireflypushB_U.png" }},
{ "ffrg_ExploFireflyPushB_1", "ffrg_ExploFireflyPush1_1", { Image = "effects/ffrg_explo_fireflypushB_R.png" }},
{ "ffrg_ExploFireflyPushB_2", "ffrg_ExploFireflyPush1_2", { Image = "effects/ffrg_explo_fireflypushB_D.png" }},
{ "ffrg_ExploFireflyPushB_3", "ffrg_ExploFireflyPush1_3", { Image = "effects/ffrg_explo_fireflypushB_L.png" }},
{ "ffrg_ExploAcidPush_0", "ffrg_ExploFireflyPush1_0", { Image = "effects/ffrg_explo_acidpush_U.png" }},
{ "ffrg_ExploAcidPush_1", "ffrg_ExploFireflyPush1_1", { Image = "effects/ffrg_explo_acidpush_R.png" }},
{ "ffrg_ExploAcidPush_2", "ffrg_ExploFireflyPush1_2", { Image = "effects/ffrg_explo_acidpush_D.png" }},
{ "ffrg_ExploAcidPush_3", "ffrg_ExploFireflyPush1_3", { Image = "effects/ffrg_explo_acidpush_L.png" }},


-----------
-- Flips --
-----------

{ "ffrg_airflip_1", "Animation", {
    Image = "effects/ffrg_airflip_1.png",
    PosX = -27,
    PosY = -1,
    NumFrames = 9,
    Time = 0.06
}},
{ "ffrg_airflip_0", "ffrg_airflip_1", {
    Image = "effects/ffrg_airflip_0.png"
}},
{ "ffrg_exploflip_1", "Animation", {
    Image = "effects/ffrg_explo_flip_1.png",
    PosX = -24,
    PosY = -2,
    NumFrames = 10,
    Time = 0.08
}},
{ "ffrg_exploflip_0", "ffrg_exploflip_1", {
    Image = "effects/ffrg_explo_flip_0.png",
    PosX = -27
}},


--------------------
-- Long Explosion --
--------------------

{ "ffrg_explolong_0", "Animation", {
    Image = "effects/ffrg_explo_long_U.png",
    NumFrames = 10,
    Time = 0.06,
    PosX = -11,
    PosY = 0
}},
{ "ffrg_explolong_1", "ffrg_explolong_0", {
    Image = "effects/ffrg_explo_long_R.png",
    PosY = 9
}},
{ "ffrg_explolong_2", "ffrg_explolong_0", {
    Image = "effects/ffrg_explo_long_D.png",
    PosX = -19,
    PosY = 9
}},
{ "ffrg_explolong_3", "ffrg_explolong_0", {
    Image = "effects/ffrg_explo_long_L.png",
    PosX = -19
}},


-----------
-- Swipe --
-----------

{ "ffrg_Swipe0", "Animation", {
    Image = "effects/ffrg_swipe_main.png",
    NumFrames = 6,
    Time = 0.03,
    PosX = -15,
    PosY = 6
}},
{ "ffrg_Swipe1", "ffrg_Swipe0", {
    Image = "effects/ffrg_swipe_alt.png",
    PosX = -17
}},


----------
-- Saws --
----------

{ "ffrg_Saw0_1", "Animation", {
    Image = "effects/ffrg_saw_main.png",
    NumFrames = 10,
    Time = 0.05,
    Frames = {0,1,2,3,6,7,8,9},
    PosX = -17,
    PosY = 0
}},
{ "ffrg_Saw0_2", "ffrg_Saw0_1", { Frames = {0,1,2,3,4,5,6,7,8,9} }},
{ "ffrg_Saw0_3", "ffrg_Saw0_1", { Frames = {0,1,2,3,4,5,4,5,6,7,8,9} }},
{ "ffrg_Saw0_4", "ffrg_Saw0_1", { Frames = {0,1,2,3,4,5,4,5,4,5,6,7,8,9} }},
{ "ffrg_Saw0_5", "ffrg_Saw0_1", { Frames = {0,1,2,3,4,5,4,5,4,5,4,5,6,7,8,9} }},
{ "ffrg_Saw1_1", "ffrg_Saw0_1", {
    Image = "effects/ffrg_saw_alt.png",
    PosX = -9
}},
{ "ffrg_Saw1_2", "ffrg_Saw1_1", { Frames = {0,1,2,3,4,5,6,7,8,9} }},
{ "ffrg_Saw1_3", "ffrg_Saw1_1", { Frames = {0,1,2,3,4,5,4,5,6,7,8,9} }},
{ "ffrg_Saw1_4", "ffrg_Saw1_1", { Frames = {0,1,2,3,4,5,4,5,4,5,6,7,8,9} }},
{ "ffrg_Saw1_5", "ffrg_Saw1_1", { Frames = {0,1,2,3,4,5,4,5,4,5,4,5,6,7,8,9} }},


}


local path = GetParentPath(...)

for _, animation in ipairs(Animations) do
    local id = animation[1]
    local base = animation[2]
    local data = animation[3]
    if data.Image and not modApi:assetExists(data.Image) then
        local img = data.Image
        modApi:appendAsset("img/".. img, path.."img/"..img)
    end
    if not ANIMS[id] then
        ANIMS[id] = (ANIMS[base]):new(data)
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


-----------
-- Slabs --
-----------

ffrg_Slab1 = Pawn:new{
    Name = "Slab",
    Health = 2,
    Armor = true,
    Neutral = true,
    MoveSpeed = 0,
    IsPortrait = false,
    Image = "ffrg_barrier1",
    SoundLocation = "/support/rock/",
    DefaultTeam = TEAM_NONE,
    ImpactMaterial = IMPACT_ROCK
}
ffrg_Slab1_Thrown = ffrg_Slab1:new{ Image = "ffrg_barrier1_thrown" }
ffrg_BombSlab = ffrg_Slab1:new{
    Name = "Explosive Slab",
    Explodes = true,
    Image = "ffrg_barrier2",
    SoundLocation = "/support/bombrock/"
}
ffrg_BombSlab_Thrown = ffrg_BombSlab:new{ Image = "ffrg_barrier2_thrown" }
AddPawnName("ffrg_Slab1")
AddPawnName("ffrg_Slab1_Thrown")
AddPawnName("ffrg_BombSlab")
AddPawnName("ffrg_BombSlab_Thrown")


--////////////////////////////////--
