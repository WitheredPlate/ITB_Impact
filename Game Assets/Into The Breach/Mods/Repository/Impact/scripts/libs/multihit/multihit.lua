--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--        Multihit Library        --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.2.3"

--## A library of functions for attacks that strike or fire projectiles multiple times in a row ##--


------------------
-- Dependencies --
------------------

--## seriousDamage.lua 1.1.4
--## weaponPreview.lua 3.1.3


----------------------
-- Multihit Attacks --
----------------------

--## Multihit attacks deal damage to the same tile or fire projectiles in the same direction multiple times in a row.
--## Under many circumstances, they behave similarly to a normal attack with as much damage as the damage times the number of attacks. There are however, big differences.
    --## Boost and Armor apply to each attack individually, making armored units particularly resilient to multihit attacks and boost particularly effective with them.
    --## Shield and Freeze are shattered/disabled by a single attack of the sequence, making multihit attacks to deal reduced damage through said statuses.
    --## Environments can be degraded by more than one stage in a single turn by multihits, making multihit attacks particularly good at demolishing mountain and shattering ice.
    --## All projectiles from ranged multihits will continue past any target destroyed by the previous shot(s) in the sequence. This allows ranged multihits to kill many units or demolish much terrain at once.
    --## Ranged multihits that push can push single units multiple times, displacing by more than one tile and/or causing more than one pair of impact damage for impeded pushes.


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_Multihit.MultihitMelee
-- ( damage [Integer],  attacks [Integer],  point [Point],  config [Table] )
-- Assembles a melee multihit attack with the specified damage and attacks at the specified point. By default, instantly applies said attack, but can be specifically configured with a wide variety of config options, specified below.
    -- queued [Boolean] indicates whether or not the attack should be queued. Unused in "instant" mode.
    -- mode [String] indicates how the multihit attack should be implemented.
        -- "instant" immediately applies the multihit attack to the Board.
        -- "simple" adds the multihit attack to the SkillEffect specified by the ret config option.
        -- "ko" functions as "simple", but also returns a boolean that indicates whether or not the multihit attack is lethal to a pawn.
        -- "dissect" returns a table of SpaceDamages and Delays that, when done in sequence, will produce a full melee multihit attack. This allows the fine manipulation and timing of individual components.
    -- ret [SkillEffect] indicates the SkillEffect that the multihit attack should be added to. Unused in "instant" mode.
    -- origin [Point] indicates the point that the attack is being directed from.
    -- immunities [Table] indicates any type immunities that the attack should have, doing no damage to certain targets.
        -- team [Enumeration] prevents damage to pawns with the specified team.
        -- buildings [Boolean] prevents damage to buildings.
    -- sfx [String] indicates the sound effect that should accompany each instance of the damage.
    -- anim [String] indicates the animation that should play each time an attack lands.
    -- anim_alt [String] indicates an alternate animation that is used for every other attack if present.
    -- force_ice [String] makes the attack assume the target will be frozen when the attack lands in tip images. Mainly just made for caterpillar tip damage previews.
    -- delay [Float] indicates how much delay, in seconds, should be spaced between each of the attacks.

--## ffrg_Multihit.MultihitRanged
-- ( damage [Integer],  attacks [Integer],  point [Point],  dir [Integer],  config [Table] )
-- Assembles a ranged multihit attack with the specified damage and number of projectiles from the specified point being fired in the specified direction. By default, instantly applies said attack, but can be specifically configured with a wide variety of config options, specified below.
    -- queued [Boolean] indicates whether or not the attack should be queued. Unused in "instant" mode.
    -- push [Boolean] indicates whether or not the projectiles should push their targets.
    -- mode [String] indicates how the multihit attack should be implemented.
        -- "instant" immediately applies the multihit attack to the Board.
        -- "simple" adds the multihit attack to the SkillEffect specified by the ret config option.
    -- ret [SkillEffect] indicates the SkillEffect that the multihit attack should be added to. Unused in "instant" mode.
    -- origin [Point] indicates the point that the attack is being directed from.
    -- immunities [Table] indicates any type immunities that the attack should have, doing no damage to certain targets. Currently doesn't work for ranged attacks bcuz I'm lazy.
        -- team [Enumeration] prevents damage to pawns with the specified team.
        -- buildings [Boolean] prevents damage to buildings.
    -- sfx_fire [String] indicates the sound effect that should play each time a projectile is fired.
    -- sfx_hit [String] indicates the sound effect that should play each time a projectile hits a target.
    -- anim [String] indicates the animation that should play each time a projectile hits a target.
    -- anim_directional [String] indicates the directionality of the main animation.
        -- "none" does not append a direction.
        -- "forwards" appends the firing direction.
        -- "backwards" appends the direction opposite to the firing direction.
    -- anim_origin [String] indicates the animation that should play on the firing tile every time a projectile is fired.
    -- anim_origin_directional [String] indicates the directionality of the origin animation.
        -- "none" does not append a direction.
        -- "forwards" appends the firing direction.
        -- "backwards" appends the direction opposite to the firing direction.
    -- delay [Float] indicates how much delay, in seconds, should be spaced between each of the projectiles. If the projectiles are pushing, this is floored at 0.5 seconds to allow hit units to move to the next tile.


--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = GetParentPath(...)
local multihitPath = path.."img/combat/icons/multihit/"
local multipushPath = path.."img/combat/multipush/"

-- Multihit Damage Types:

-- (Lower damage types take priority over higher ones.)

-- [Blank]: Used in absence of any other damage type.
-- Armor: Used when positive damage hits armor but is not reduced to 0.
-- Negate: Used when positive damage hits armor and is reduced to 0.
-- Acid: Used when damage hits an acidified unit.
-- Lethal: Used when the weapon being fired has an on kill effect that triggers.
-- Boost: Used when the mech firing the weapon is boosted.
-- Void: Used for instances of damage that are specified as 0 even before any reductions.
-- Immune: Used for DAMAGE_ZERO, ie. For activations of ally/building immune.

local multihitFiles = {
    "multihit_2",
    "multihit_3",
    "multihit_4",
    "multihit_5",
    "multihit_6",
    "multihit_2_null_acidify",
    "multihit_3_null_acidify",
    "multihit_4_null_acidify",
    "multihit_5_null_acidify",
    "multihit_6_null_acidify",
    "multihit_3_null_null_acidify",
    "multihit_2_null_block",
    "multihit_3_null_null_block",
    "multihit_3_null_block",
    "multihit_3_null_block_block",
    "multihit_3_null_acidify_block",
    "multihit_3_null_block_acidify",
    "multihit_2_void",
    "multihit_3_void",
    "multihit_4_void",
    "multihit_5_void",
    "multihit_6_void",
    "multihit_2_immune",
    "multihit_3_immune",
    "multihit_4_immune",
    "multihit_5_immune",
    "multihit_6_immune",
    "multihit_2_armor",
    "multihit_3_armor",
    "multihit_4_armor",
    "multihit_5_armor",
    "multihit_6_armor",
    "multihit_2_armor_null_acidify",
    "multihit_3_armor_null_acidify",
    "multihit_4_armor_null_acidify",
    "multihit_5_armor_null_acidify",
    "multihit_6_armor_null_acidify",
    "multihit_3_armor_null_null_acidify",
    "multihit_2_armor_null_block",
    "multihit_3_armor_null_null_block",
    "multihit_3_armor_null_block",
    "multihit_3_armor_null_block_block",
    "multihit_3_armor_null_acidify_block",
    "multihit_3_armor_null_block_acidify",
    "multihit_2_lethal",
    "multihit_3_lethal",
    "multihit_4_lethal",
    "multihit_5_lethal",
    "multihit_6_lethal",
    "multihit_2_acid",
    "multihit_3_acid",
    "multihit_4_acid",
    "multihit_5_acid",
    "multihit_6_acid",
    "multihit_2_acid_null_block",
    "multihit_3_acid_null_null_block",
    "multihit_3_acid_null_block",
    "multihit_3_acid_null_block_block",
    "multihit_2_boost",
    "multihit_3_boost",
    "multihit_4_boost",
    "multihit_5_boost",
    "multihit_6_boost",
    "multihit_2_boost_null_block",
    "multihit_3_boost_null_null_block",
    "multihit_3_boost_null_block",
    "multihit_3_boost_null_block_block"
}

for _, file in ipairs(multihitFiles) do
    modApi:appendAsset("img/combat/icons/multihit/"..file..".png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_U.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_R.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_D.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_L.png", multihitPath..file..".png")
    Location["combat/icons/multihit/"..file..".png"] = Point(2,10)
    Location["combat/icons/multihit/"..file.."_U.png"] = Point(30,-11)
    Location["combat/icons/multihit/"..file.."_R.png"] = Point(30,31)
    Location["combat/icons/multihit/"..file.."_D.png"] = Point(-26,31)
    Location["combat/icons/multihit/"..file.."_L.png"] = Point(-26,-11)
    ANIMS[file] = Animation:new{
        Image = "combat/icons/multihit/"..file..".png",
        Layer = 0,
        NumFrames = 1,
        Loop = true,
        Time = 1,
        PosX = 2,
        PosY = 10
    }
end

local multihitFilesNegate = {
    "multihit_2_negate",
    "multihit_3_negate",
    "multihit_4_negate",
    "multihit_5_negate",
    "multihit_6_negate",
    "multihit_2_negate_null_acidify",
    "multihit_3_negate_null_acidify",
    "multihit_4_negate_null_acidify",
    "multihit_5_negate_null_acidify",
    "multihit_6_negate_null_acidify",
    "multihit_3_negate_null_null_acidify",
    "multihit_2_negate_null_block",
    "multihit_3_negate_null_null_block",
    "multihit_3_negate_null_block",
    "multihit_3_negate_null_block_block",
    "multihit_3_negate_null_acidify_block",
    "multihit_3_negate_null_block_acidify"
}

for _, file in ipairs(multihitFilesNegate) do
    modApi:appendAsset("img/combat/icons/multihit/"..file..".png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_U.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_R.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_D.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_L.png", multihitPath..file..".png")
    Location["combat/icons/multihit/"..file..".png"] = Point(3,10)
    Location["combat/icons/multihit/"..file.."_U.png"] = Point(31,-11)
    Location["combat/icons/multihit/"..file.."_R.png"] = Point(31,31)
    Location["combat/icons/multihit/"..file.."_D.png"] = Point(-25,31)
    Location["combat/icons/multihit/"..file.."_L.png"] = Point(-25,-11)
end

local multihitFilesBlock = {
    "multihit_2_block",
    "multihit_3_block",
    "multihit_4_block",
    "multihit_5_block",
    "multihit_6_block",
    "multihit_3_block_null_acidify",
    "multihit_4_block_null_acidify",
    "multihit_5_block_null_acidify",
    "multihit_6_block_null_acidify",
    "multihit_2_block_block",
    "multihit_3_block_block",
    "multihit_4_block_block",
    "multihit_5_block_block",
    "multihit_6_block_block",
    "multihit_4_block_block_null_acidify",
    "multihit_5_block_block_null_acidify",
    "multihit_6_block_block_null_acidify",
    "multihit_3_block_null_block",
    "multihit_3_block_block_block",
    "multihit_3_block_acidify",
    "multihit_3_block_acidify_block",
    "multihit_3_block_block_acidify",
    "multihit_2_armor_block",
    "multihit_3_armor_block",
    "multihit_4_armor_block",
    "multihit_5_armor_block",
    "multihit_6_armor_block",
    "multihit_3_armor_block_null_acidify",
    "multihit_4_armor_block_null_acidify",
    "multihit_5_armor_block_null_acidify",
    "multihit_6_armor_block_null_acidify",
    "multihit_2_armor_block_block",
    "multihit_3_armor_block_block",
    "multihit_4_armor_block_block",
    "multihit_5_armor_block_block",
    "multihit_6_armor_block_block",
    "multihit_4_armor_block_block_null_acidify",
    "multihit_5_armor_block_block_null_acidify",
    "multihit_6_armor_block_block_null_acidify",
    "multihit_3_armor_block_null_block",
    "multihit_3_armor_block_block_block",
    "multihit_3_armor_block_acidify",
    "multihit_3_armor_block_acidify_block",
    "multihit_3_armor_block_block_acidify",
    "multihit_2_negate_block",
    "multihit_3_negate_block",
    "multihit_4_negate_block",
    "multihit_5_negate_block",
    "multihit_6_negate_block",
    "multihit_3_negate_block_null_acidify",
    "multihit_4_negate_block_null_acidify",
    "multihit_5_negate_block_null_acidify",
    "multihit_6_negate_block_null_acidify",
    "multihit_2_negate_block_block",
    "multihit_3_negate_block_block",
    "multihit_4_negate_block_block",
    "multihit_5_negate_block_block",
    "multihit_6_negate_block_block",
    "multihit_4_negate_block_block_null_acidify",
    "multihit_5_negate_block_block_null_acidify",
    "multihit_6_negate_block_block_null_acidify",
    "multihit_3_negate_block_null_block",
    "multihit_3_negate_block_block_block",
    "multihit_3_negate_block_acidify",
    "multihit_3_negate_block_acidify_block",
    "multihit_3_negate_block_block_acidify",
    "multihit_2_lethal_block",
    "multihit_3_lethal_block",
    "multihit_4_lethal_block",
    "multihit_5_lethal_block",
    "multihit_6_lethal_block",
    "multihit_2_lethal_block_block",
    "multihit_3_lethal_block_block",
    "multihit_4_lethal_block_block",
    "multihit_5_lethal_block_block",
    "multihit_6_lethal_block_block",
    "multihit_2_acid_block",
    "multihit_3_acid_block",
    "multihit_4_acid_block",
    "multihit_5_acid_block",
    "multihit_6_acid_block",
    "multihit_2_acid_block_block",
    "multihit_3_acid_block_block",
    "multihit_4_acid_block_block",
    "multihit_5_acid_block_block",
    "multihit_6_acid_block_block",
    "multihit_3_acid_block_null_block",
    "multihit_3_acid_block_block_block",
    "multihit_2_boost_block",
    "multihit_3_boost_block",
    "multihit_4_boost_block",
    "multihit_5_boost_block",
    "multihit_6_boost_block",
    "multihit_2_boost_block_block",
    "multihit_3_boost_block_block",
    "multihit_4_boost_block_block",
    "multihit_5_boost_block_block",
    "multihit_6_boost_block_block",
    "multihit_3_boost_block_null_block",
    "multihit_3_boost_block_block_block"
}

for _, file in ipairs(multihitFilesBlock) do
    modApi:appendAsset("img/combat/icons/multihit/"..file..".png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_U.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_R.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_D.png", multihitPath..file..".png")
    modApi:appendAsset("img/combat/icons/multihit/"..file.."_L.png", multihitPath..file..".png")
    Location["combat/icons/multihit/"..file..".png"] = Point(3,9)
    Location["combat/icons/multihit/"..file.."_U.png"] = Point(31,-12)
    Location["combat/icons/multihit/"..file.."_R.png"] = Point(31,30)
    Location["combat/icons/multihit/"..file.."_D.png"] = Point(-25,30)
    Location["combat/icons/multihit/"..file.."_L.png"] = Point(-25,-12)
end


local multipushFiles = {
    "multipush_down_null",
    "multipush_down_guard",
    "multipush_down_guard_guard",
    "multipush_down_guard_guard_guard",
    "multipush_down_impact",
    "multipush_down_impact_impact",
    "multipush_down_impact_impact_impact",
    "multipush_down_impact_impact_push",
    "multipush_down_impact_push",
    "multipush_down_impact_push_impact",
    "multipush_down_impact_push_miss",
    "multipush_down_impact_push_push",
    "multipush_down_miss",
    "multipush_down_push",
    "multipush_down_push_impact",
    "multipush_down_push_impact_impact",
    "multipush_down_push_impact_push",
    "multipush_down_push_miss",
    "multipush_down_push_push",
    "multipush_down_push_push_impact",
    "multipush_down_push_push_miss",
    "multipush_down_push_push_push",
    "multipush_left_null",
    "multipush_left_guard",
    "multipush_left_guard_guard",
    "multipush_left_guard_guard_guard",
    "multipush_left_impact",
    "multipush_left_impact_impact",
    "multipush_left_impact_impact_impact",
    "multipush_left_impact_impact_push",
    "multipush_left_impact_push",
    "multipush_left_impact_push_impact",
    "multipush_left_impact_push_miss",
    "multipush_left_impact_push_push",
    "multipush_left_miss",
    "multipush_left_push",
    "multipush_left_push_impact",
    "multipush_left_push_impact_impact",
    "multipush_left_push_impact_push",
    "multipush_left_push_miss",
    "multipush_left_push_push",
    "multipush_left_push_push_impact",
    "multipush_left_push_push_miss",
    "multipush_left_push_push_push",
    "multipush_right_null",
    "multipush_right_guard",
    "multipush_right_guard_guard",
    "multipush_right_guard_guard_guard",
    "multipush_right_impact",
    "multipush_right_impact_impact",
    "multipush_right_impact_impact_impact",
    "multipush_right_impact_impact_push",
    "multipush_right_impact_push",
    "multipush_right_impact_push_impact",
    "multipush_right_impact_push_miss",
    "multipush_right_impact_push_push",
    "multipush_right_miss",
    "multipush_right_push",
    "multipush_right_push_impact",
    "multipush_right_push_impact_impact",
    "multipush_right_push_impact_push",
    "multipush_right_push_miss",
    "multipush_right_push_push",
    "multipush_right_push_push_impact",
    "multipush_right_push_push_miss",
    "multipush_right_push_push_push",
    "multipush_up_null",
    "multipush_up_guard",
    "multipush_up_guard_guard",
    "multipush_up_guard_guard_guard",
    "multipush_up_impact",
    "multipush_up_impact_impact",
    "multipush_up_impact_impact_impact",
    "multipush_up_impact_impact_push",
    "multipush_up_impact_push",
    "multipush_up_impact_push_impact",
    "multipush_up_impact_push_miss",
    "multipush_up_impact_push_push",
    "multipush_up_miss",
    "multipush_up_push",
    "multipush_up_push_impact",
    "multipush_up_push_impact_impact",
    "multipush_up_push_impact_push",
    "multipush_up_push_miss",
    "multipush_up_push_push",
    "multipush_up_push_push_impact",
    "multipush_up_push_push_miss",
    "multipush_up_push_push_push"
}

for _, file in ipairs(multipushFiles) do
    modApi:appendAsset("img/combat/multipush/"..file..".png", multipushPath..file..".png")
end

local MultipushLengthBank = {
    null = 1,
    guard = 1,
    guard_guard = 1,
    guard_guard_guard = 1,
    impact = 1,
    impact_impact = 1,
    impact_impact_impact = 1,
    impact_impact_push = 2,
    impact_push = 2,
    impact_push_impact = 2,
    impact_push_miss = 2,
    impact_push_push = 2,
    miss = 1,
    push = 1,
    push_impact = 2,
    push_impact_impact = 2,
    push_impact_push = 3,
    push_miss = 2,
    push_push = 2,
    push_push_impact = 3,
    push_push_miss = 3,
    push_push_push = 3,
}

local function MultiPushAnimGen(indicator, x, y)
    ANIMS[indicator] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    ANIMS[indicator.."_focused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    ANIMS[indicator.."_unfocused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y
    }
    -- Ice Level
    ANIMS[indicator.."_x"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    ANIMS[indicator.."_x_focused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    ANIMS[indicator.."_x_unfocused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 4
    }
    -- Liquid / Chasm Level
    ANIMS[indicator.."_xx"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = true,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
    ANIMS[indicator.."_xx_focused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 0 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
    ANIMS[indicator.."_xx_unfocused"] = Animation:new{
        Image = "combat/multipush/"..indicator..".png",
        Layer = 0,
        NumFrames = 3,
        Frames = { 1 },
        Loop = false,
        Lengths = nil,
        Time = 0,
        PosX = x,
        PosY = y + 7
    }
end



-- Down
MultiPushAnimGen("multipush_down_null",-43,-1)
MultiPushAnimGen("multipush_down_guard",-43,-1)
MultiPushAnimGen("multipush_down_guard_guard",-43,-1)
MultiPushAnimGen("multipush_down_guard_guard_guard",-43,-1)
MultiPushAnimGen("multipush_down_impact",-43,14)
MultiPushAnimGen("multipush_down_impact_impact",-43,14)
MultiPushAnimGen("multipush_down_impact_impact_impact",-43,14)
MultiPushAnimGen("multipush_down_impact_impact_push",-55,14)
MultiPushAnimGen("multipush_down_impact_push",-55,14)
MultiPushAnimGen("multipush_down_impact_push_impact",-71,14)
MultiPushAnimGen("multipush_down_impact_push_miss",-71,14)
MultiPushAnimGen("multipush_down_impact_push_push",-71,14)
MultiPushAnimGen("multipush_down_miss",-43,14)
MultiPushAnimGen("multipush_down_push",-43,14)
MultiPushAnimGen("multipush_down_push_impact",-71,14)
MultiPushAnimGen("multipush_down_push_impact_impact",-71,14)
MultiPushAnimGen("multipush_down_push_impact_push",-83,14)
MultiPushAnimGen("multipush_down_push_miss",-71,14)
MultiPushAnimGen("multipush_down_push_push",-71,14)
MultiPushAnimGen("multipush_down_push_push_impact",-99,14)
MultiPushAnimGen("multipush_down_push_push_miss",-99,14)
MultiPushAnimGen("multipush_down_push_push_push",-99,14)

--Left
MultiPushAnimGen("multipush_left_null",-43,-10)
MultiPushAnimGen("multipush_left_guard",-43,-10)
MultiPushAnimGen("multipush_left_guard_guard",-43,-10)
MultiPushAnimGen("multipush_left_guard_guard_guard",-43,-10)
MultiPushAnimGen("multipush_left_impact",-43,-10)
MultiPushAnimGen("multipush_left_impact_impact",-43,-10)
MultiPushAnimGen("multipush_left_impact_impact_impact",-43,-10)
MultiPushAnimGen("multipush_left_impact_impact_push",-55,-18)
MultiPushAnimGen("multipush_left_impact_push",-55,-18)
MultiPushAnimGen("multipush_left_impact_push_impact",-71,-31)
MultiPushAnimGen("multipush_left_impact_push_miss",-71,-31)
MultiPushAnimGen("multipush_left_impact_push_push",-71,-31)
MultiPushAnimGen("multipush_left_miss",-43,-10)
MultiPushAnimGen("multipush_left_push",-43,-10)
MultiPushAnimGen("multipush_left_push_impact",-71,-31)
MultiPushAnimGen("multipush_left_push_impact_impact",-71,-31)
MultiPushAnimGen("multipush_left_push_impact_push",-83,-39)
MultiPushAnimGen("multipush_left_push_miss",-71,-31)
MultiPushAnimGen("multipush_left_push_push",-71,-31)
MultiPushAnimGen("multipush_left_push_push_impact",-99,-52)
MultiPushAnimGen("multipush_left_push_push_miss",-99,-52)
MultiPushAnimGen("multipush_left_push_push_push",-99,-52)

--Up
MultiPushAnimGen("multipush_up_null",-31,-10)
MultiPushAnimGen("multipush_up_guard",-31,-10)
MultiPushAnimGen("multipush_up_guard_guard",-31,-10)
MultiPushAnimGen("multipush_up_guard_guard_guard",-31,-10)
MultiPushAnimGen("multipush_up_impact",-11,-10)
MultiPushAnimGen("multipush_up_impact_impact",-11,-10)
MultiPushAnimGen("multipush_up_impact_impact_impact",-11,-10)
MultiPushAnimGen("multipush_up_impact_impact_push",-11,-18)
MultiPushAnimGen("multipush_up_impact_push",-11,-18)
MultiPushAnimGen("multipush_up_impact_push_impact",-11,-31)
MultiPushAnimGen("multipush_up_impact_push_miss",-11,-31)
MultiPushAnimGen("multipush_up_impact_push_push",-11,-31)
MultiPushAnimGen("multipush_up_miss",-11,-10)
MultiPushAnimGen("multipush_up_push",-11,-10)
MultiPushAnimGen("multipush_up_push_impact",-11,-31)
MultiPushAnimGen("multipush_up_push_impact_impact",-11,-31)
MultiPushAnimGen("multipush_up_push_impact_push",-11,-39)
MultiPushAnimGen("multipush_up_push_miss",-11,-31)
MultiPushAnimGen("multipush_up_push_push",-11,-31)
MultiPushAnimGen("multipush_up_push_push_impact",-11,-52)
MultiPushAnimGen("multipush_up_push_push_miss",-11,-52)
MultiPushAnimGen("multipush_up_push_push_push",-11,-52)

--Right
MultiPushAnimGen("multipush_right_null",-31,-1)
MultiPushAnimGen("multipush_right_guard",-31,-1)
MultiPushAnimGen("multipush_right_guard_guard",-31,-1)
MultiPushAnimGen("multipush_right_guard_guard_guard",-31,-1)
MultiPushAnimGen("multipush_right_impact",-11,14)
MultiPushAnimGen("multipush_right_impact_impact",-11,14)
MultiPushAnimGen("multipush_right_impact_impact_impact",-11,14)
MultiPushAnimGen("multipush_right_impact_impact_push",-11,14)
MultiPushAnimGen("multipush_right_impact_push",-11,14)
MultiPushAnimGen("multipush_right_impact_push_impact",-11,14)
MultiPushAnimGen("multipush_right_impact_push_miss",-11,14)
MultiPushAnimGen("multipush_right_impact_push_push",-11,14)
MultiPushAnimGen("multipush_right_miss",-11,14)
MultiPushAnimGen("multipush_right_push",-11,14)
MultiPushAnimGen("multipush_right_push_impact",-11,14)
MultiPushAnimGen("multipush_right_push_impact_impact",-11,14)
MultiPushAnimGen("multipush_right_push_impact_push",-11,14)
MultiPushAnimGen("multipush_right_push_miss",-11,14)
MultiPushAnimGen("multipush_right_push_push",-11,14)
MultiPushAnimGen("multipush_right_push_push_impact",-11,14)
MultiPushAnimGen("multipush_right_push_push_miss",-11,14)
MultiPushAnimGen("multipush_right_push_push_push",-11,14)


--////////////////////////////////--





--////////////////////////////////--
--//        Preview Logic       //--
--////////////////////////////////--


function ffrg_MultihitForceSet()
    Passive_ForceAmp.Passive = "Passive_ForceAmp"
end

local function ffrg_QueuedSkillHide(id, weapon)
    ffrg_MultihitForceSet()
end

local function ffrg_onQueuedSkillEffectHidden(id, weapon, index)
    ffrg_QueuedSkillHide(id, weapon)
end

local function ffrg_onNextTurn(mission)
    local damage = SpaceDamage(Point(0,0))
    Board:DamageSpace(damage)
end

local function ffrg_onSkillEffectHidden(...)
    ffrg_MultihitForceSet()
end

local function ffrg_onFinalEffectHidden(...)
    ffrg_MultihitForceSet()
end

local function ffrg_onMissionStart(...)
    ffrg_MultihitForceSet()
end

local function ffrg_onModsInitialized(...)
    modApi:runLater(function()
        WeaponPreview.events.onSkillEffectHidden:subscribe(ffrg_onSkillEffectHidden)
        WeaponPreview.events.onFinalEffectHidden:subscribe(ffrg_onFinalEffectHidden)
        WeaponPreview.events.onQueuedSkillEffectHidden:subscribe(ffrg_onQueuedSkillEffectHidden)
    end)
end

modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)
modApi.events.onMissionStart:subscribe(ffrg_onMissionStart)
modApi.events.onNextTurn:subscribe(ffrg_onNextTurn)


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function DirReverse(dir)
    if dir == 0 then return 2 end
    if dir == 1 then return 3 end
    if dir == 2 then return 0 end
    return 1
end

local function DirRotate(dir)
    if dir == 0 then return 1 end
    if dir == 1 then return 2 end
    if dir == 2 then return 3 end
    return 0
end

local function DirSwitch(dir)
    if dir == 0 then return 1 end
    if dir == 1 then return 2 end
    if dir == 2 then return 1 end
    return 2
end

local function DirString(dir)
    if dir == 0 then return "up" end
    if dir == 1 then return "right" end
    if dir == 2 then return "down" end
    if dir == 3 then return "left" end
    return ""
end

local function DirID(dir)
    if dir == 0 then return "U" end
    if dir == 1 then return "R" end
    if dir == 2 then return "D" end
    if dir == 3 then return "L" end
    return ""
end

local function QueuedDamageIconAdd(icon, dir, curr, array)
    local iconDir
    if Board:IsValid(curr + DIR_VECTORS[DirSwitch(dir)]) then
        iconDir = DirSwitch(dir)
    else
        iconDir = DirSwitch(DirReverse(dir))
    end
    local icon_space = curr + DIR_VECTORS[iconDir]
    local damage = SpaceDamage(icon_space,0)
    damage.sImageMark = icon:gsub(".png","").."_"..DirID(DirReverse(iconDir))..".png"
    table.insert(array, { type = "damage", focused = true, data = damage } )
end

local ffrg_TipWeaponId = ""

local function ffrg_onTargetAreaBuild(mission, pawn, weaponId, point, pointList)
    if Board and Board:IsTipImage() then
        ffrg_TipWeaponId = weaponId
    end
end

local function ffrg_onSecondTargetAreaBuild(mission, pawn, weaponId, p1, p2, pointList)
    if Board and Board:IsTipImage() then
        ffrg_TipWeaponId = weaponId
    end
end

modapiext.events.onTargetAreaBuild:subscribe(ffrg_onTargetAreaBuild)
modapiext.events.onSecondTargetAreaBuild:subscribe(ffrg_onSecondTargetAreaBuild)


--////////////////////////////////--





--////////////////////////////////--
--//            Melee           //--
--////////////////////////////////--


local function MultihitMelee(damage, attacks, point, config)
    if Board then
        config = config or {}
        config.damage = damage
        config.attacks = attacks
        config.mode = config.mode or "instant"
        config.immunities = config.immunities or {}
        config.sfx = config.sfx or ""
        config.anim = config.anim or ""
        config.anim_alt = config.anim_alt or ""
        config.delay = config.delay or 0.2
        config.queued = config.queued or false

        local space_damage = SpaceDamage(point, damage)
        space_damage.sSound = config.sfx
        space_damage.sAnimation = config.anim

        local boost = false
        if config.origin and Board and Board:IsPawnSpace(config.origin) and Board:GetPawn(config.origin):IsBoosted() and config.damage ~= 0 and config.damage ~= DAMAGE_ZERO then
            config.damage = config.damage + 1
            boost = true
        end

        if config.immunities.buildings and Board:IsBuilding(point) then
            config.damage = DAMAGE_ZERO
        elseif config.immunities.team and Board:IsPawnTeam(point,config.immunities.team) then
            config.damage = DAMAGE_ZERO
        end

        if config.mode ~= "instant" and config.ret then
            local block = 0
            local modifier = ""
            local modifier2 = ""
            local ko = false

            if Board:IsPawnSpace(point) then
                local pawn = Board:GetPawn(point)

                local env_res = 0

                if pawn:IsFlying() then
                    env_res = 2
                elseif pawn:IsMassive() then
                    env_res = 1
                end

                if pawn:IsShield() then
                    block = 1
                end
                if pawn:IsFrozen() or ( config.force_ice and Board:IsTipImage()) then
                    block = block + 1
                end

                if config.mode == "ko" and config.damage ~= 0 and config.damage ~= DAMAGE_ZERO then
                    local damage = config.damage
                    local attacks = config.attacks - block
                    local terrain = Board:GetTerrain(point)
                    local env_kill = false
                    local damage_mod = 0
                    if pawn:IsAcid() then
                        damage = damage*2
                    elseif pawn:IsArmor() then
                        damage = damage-1
                    end

                    if terrain == TERRAIN_ICE then
                        local env_integrity = Board:GetHealth(point)
                        if env_integrity <= attacks then
                            if env_res == 0 then
                                env_kill = true
                            elseif env_res == 1 and Board:IsAcid(point) and not pawn:IsAcid() then -- NOTICE This is detection for acid ice. It probably does not function and needs a different method of detection.
                                damage_mod = ( attacks - env_integrity ) * config.damage
                            end
                        end
                    elseif Board:IsCracked(point) and attacks >= 0 and env_res ~= 2 then
                        env_kill = true
                    end
                    if env_kill or ( ( damage * attacks ) + damage_mod ) >= pawn:GetHealth() then
                        ko = true
                        space_damage.bKO_Effect = true
                    end
                end
                if config.damage == DAMAGE_ZERO then
                    modifier = "_immune"
                elseif config.damage == 0 then
                    modifier = "_void"
                elseif boost then
                    modifier = "_boost"
                elseif ko then
                    modifier = "_lethal"
                elseif pawn:IsAcid() then
                    modifier = "_acid"
                elseif pawn:IsArmor() then
                    if config.damage == 1 then
                        modifier = "_negate"
                    else
                        modifier = "_armor"
                    end
                end
                if config.damage ~= 0 and config.damage ~= DAMAGE_ZERO and Board:GetTerrain(point) == TERRAIN_ICE and Board:IsAcid(point) and not pawn:IsAcid() and Board:GetHealth(point) < ( config.attacks - block ) and env_res == 2 then -- NOTICE Ditto as above
                    modifier2 = "_null_acidify"
                    ffrg_SeriousDamage.AppendSeriousDamage( config.ret, (( config.attacks - block - Board:GetHealth(point) ) * config.damage)+block, point, {queued = config.queued, type = "stupid", preview = true} )
                end
            else
                if Board:IsShield(point) then
                    block = 1
                end
                if Board:IsFrozen(point) or ( config.force_ice and Board:IsTipImage()) then
                    block = block + 1
                end
            end

            local icon = "combat/icons/multihit/multihit_"..config.attacks
            if modifier ~= "" then
                icon = icon..modifier
            end
            if config.damage ~= 0 and config.damage ~= DAMAGE_ZERO then
                for i = 1, block do
                    icon = icon.."_block"
                end
            end
            if modifier2 ~= "" then
                icon = icon..modifier2
            end
            icon = icon..".png"
            if not config.queued then
                space_damage.sImageMark = icon
            elseif config.origin and Board:IsPawnSpace(config.origin) then
                local dir = GetDirection(config.origin - point)
                local iconArray = {}
                QueuedDamageIconAdd(icon, dir, point, iconArray)
                ffrg_QueuedPreview.AddQueuedSet(Board:GetPawn(config.origin):GetId(),iconArray)
            end

            if config.mode == "dissect" then
                local dissection = {}
                for i = 1, attacks do
                    if config.anim_alt ~= "" then
                        if i%2 == 0 then
                            space_damage.sAnimation = config.anim_alt
                        elseif i ~= 1 then
                            space_damage.sAnimation = config.anim
                        end
                    end
                    table.insert(dissection, space_damage)
                    if i ~= attacks then
                        table.insert(dissection, config.delay)
                    end
                end
                return dissection
            else
                for i = 1, attacks do
                    if config.anim_alt ~= "" then
                        if i%2 == 0 then
                            space_damage.sAnimation = config.anim_alt
                        elseif i ~= 1 then
                            space_damage.sAnimation = config.anim
                        end
                    end
                    if config.queued then
                        config.ret:AddQueuedDamage(space_damage)
                        if i ~= attacks then
                            config.ret:AddQueuedDelay(config.delay)
                        end
                    else
                        config.ret:AddDamage(space_damage)
                        if i ~= attacks then
                            config.ret:AddDelay(config.delay)
                        end
                    end
                end
                if config.mode == "ko" then
                    return ko
                else
                    return
                end
            end
        elseif config.mode == "instant" then
            local ret = SkillEffect()
            for i = 1, attacks do
                if config.anim_alt ~= "" then
                    if i%2 == 0 then
                        space_damage.sAnimation = config.anim_alt
                    elseif i ~= 1 then
                        space_damage.sAnimation = config.anim
                    end
                end
                ret:AddDamage(space_damage)
                if i ~= attacks then
                    ret:AddDelay(config.delay)
                end
            end
            Board:AddEffect(ret)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//         Projectile         //--
--////////////////////////////////--


local PUSHABLE = 0
local UNPUSHABLE = 1
local STATIONARY = 2
local CLEAN = 0
local ACIDIFIED = 1
local ACID = 2

local function MultihitProjectilePreview(damage, attacks, dir, push, boost, pathArray, immunities)
-- This takes an input of statistics of a multihit brute weapon, and outputs an array of where all the hits of the weapon end up (and in the future, what those hits do). Because there's so many factors that can alter damage and push effectiveness, this gets complex as fuck.
    immunities = immunities or {} -- not working yet. I don't really care enough

    local targetArray = {}
    local hazardArray = {}
    local itemArray = {}
    local outputArray = {}

    for _, targetPoint in ipairs(pathArray) do

        if Board:GetTerrain(targetPoint) == TERRAIN_HOLE then
            table.insert(hazardArray, "chasm")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_WATER then
            table.insert(hazardArray, "water")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_ACID then
            table.insert(hazardArray, "acid")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_LAVA then
            table.insert(hazardArray, "lava")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_ICE and Board:GetHealth(targetPoint) == 1 and Board:IsAcid(targetPoint) then
            table.insert(hazardArray, "cracked_acid_ice")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_ICE and Board:IsAcid(targetPoint) then
            table.insert(hazardArray, "acid_ice")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_ICE and Board:GetHealth(targetPoint) == 1 then
            table.insert(hazardArray, "cracked_ice")
        elseif Board:GetTerrain(targetPoint) == TERRAIN_ICE then
            table.insert(hazardArray, "ice")
        elseif Board:IsAcid(targetPoint) and Board:IsCracked(targetPoint) then
            table.insert(hazardArray, "cracked_acid_pool")
        elseif Board:IsCracked(targetPoint) then
            table.insert(hazardArray, "cracked")
        elseif Board:IsAcid(targetPoint) then
            table.insert(hazardArray, "acid_pool")
        else
            table.insert(hazardArray, "clear")
        end
        -- Hazard array lists all board hazards capable of damaging, killing, healing, shielding, or freezing targets. If cross-mod compatibility is desired, custom hazards must be placed here and the hazard detection and progression system below must be updated

        if Board:GetItem(targetPoint) == "Item_Mine" then -- NOTICE Identifier may be incorrect
            table.insert(itemArray, "mine")
        elseif Board:GetItem(targetPoint) == "Freeze_Mine" then -- NOTICE Identifier may be incorrect
            table.insert(itemArray, "mine_cryo")
        elseif Board:GetItem(targetPoint) == "Item_Repair_Mine" then -- NOTICE Identifier may be incorrect
            table.insert(itemArray, "mine_repair")
        else
            table.insert(itemArray, "clear")
        end
        -- Item array lists all board items capable of damaging, killing, healing, shielding, or freezing targets. If cross-mod compatibility is desired, custom items must be placed here and the item detection system below must be updated

        local targetData = {}

        if Board:IsPawnSpace(targetPoint) then
            local pawn = Board:GetPawn(targetPoint)
            if pawn:IsCorpse() then
                targetData.type = "pawn_corpse"
            else
                targetData.type = "pawn"
            end
            targetData.team = pawn:GetTeam()
            targetData.health = pawn:GetHealth()
            targetData.max_health = pawn:GetMaxHealth()
            if pawn:IsGuarding() then
                targetData.stable = UNPUSHABLE
            else
                targetData.stable = PUSHABLE
            end
            targetData.flying = pawn:IsFlying()
            targetData.massive = pawn:IsMassive()
            targetData.armored = pawn:IsArmor()
            if pawn:IsAcid() then
                targetData.acid = ACID
            else
                targetData.acid = CLEAN
            end
            targetData.shield = pawn:IsShield()
            targetData.frozen = pawn:IsFrozen()
            targetData.offset = 0
            if damage == 0 then
                targetData.hit_type = "void"
            elseif allyImmune and pawn:GetTeam() == TEAM_PLAYER then
                targetData.hit_type = "immune"
            elseif boost then
                targetData.hit_type = "boost"
            elseif targetData.acid == ACID then
                targetData.hit_type = "acid"
            elseif targetData.armored and damage == 1 then
                targetData.hit_type = "negate"
            elseif targetData.armored then
                targetData.hit_type = "armor"
            else
                targetData.hit_type = ""
            end
        elseif Board:IsBuilding(targetPoint) then
        -- Buildings are treated as stable pawns, which theoretically functions perfectly
            targetData.type = "pawn"
            targetData.team = TEAM_NONE
            targetData.health = Board:GetHealth(targetPoint)
            targetData.max_health = targetData.health
            targetData.stable = STATIONARY
            targetData.flying = false
            targetData.massive = false
            targetData.armored = false
            targetData.acid = CLEAN
            targetData.shield = Board:IsShield(targetPoint)
            targetData.frozen = Board:IsFrozen(targetPoint)
            targetData.offset = 0
            if damage == 0 then
                targetData.hit_type = "void"
            elseif buildingImmune then
                targetData.hit_type = "immune"
            elseif boost then
                targetData.hit_type = "boost"
            else
                targetData.hit_type = ""
            end
        elseif Board:GetTerrain(targetPoint) == TERRAIN_MOUNTAIN then
            targetData.type = "obstacle"
            if Board:GetHealth(targetPoint) == 2 then
                targetData.cracked = false
            else
                targetData.cracked = true
            end
            targetData.shield = Board:IsShield(targetPoint)
            targetData.frozen = Board:IsFrozen(targetPoint)
            if damage == 0 then
                targetData.hit_type = "void"
            elseif boost then
                targetData.hit_type = "boost"
            else
                targetData.hit_type = ""
            end
        else
            targetData.type = "empty"
            if boost then
                targetData.hit_type = "boost"
            else
                targetData.hit_type = ""
            end
        end

        table.insert(outputArray, {
            shots = 0,
            hits = 0,
            hit_type = targetData.hit_type,
            hit_sequence = {},
            bonus_damage = 0,
            bump_damage = 0,
            bonus_bonk = 0,
            push_sequence = {}
        })
        table.insert(targetArray,targetData)
    end
    -- Target array lists all relevant information about everything in the path of the weapon that can take damage and/or block projectiles


    -- And now that we have all the info we run the actual calculations
    local flag_miss = false
    for i = 1, attacks do
        local strike = false
        for j = 1, #targetArray do
            if strike then
                break
            end
            local targetData = targetArray[j]
            if targetData.type ~= "empty" then
                local hitType = "null"
                if targetData.type == "obstacle" then
                    outputArray[j].hits = outputArray[j].hits + 1
                    if damage > 0 then
                        if targetData.freeze then
                            targetData.freeze = false
                            -- Freeze gets broken
                            hitType = "block"
                        elseif targetData.shield then
                            targetData.shield = false
                            -- Shield gets popped
                            hitType = "block"
                        else
                            if targetData.cracked then
                                targetData.type = "empty"
                            else
                                targetData.cracked = true
                            end
                        end
                    end
                    table.insert(outputArray[j].hit_sequence, hitType)
                    if push then
                        table.insert(outputArray[j].push_sequence, "null")
                    end
                else
                    outputArray[j-targetData.offset].hits = outputArray[j-targetData.offset].hits+1
                    if targetData.frozen then
                        targetData.frozen = false
                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                        -- Freeze gets broken
                        hitType = "block"
                    elseif targetData.shield then
                        targetData.shield = false
                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                        -- Shield gets popped
                        hitType = "block"
                    else
                        if targetData.acid == ACIDIFIED then
                            hitType = "acidify"
                            targetData.acid = ACID
                        end
                        if hazardArray[j] == "cracked" or hazardArray[j] == "cracked_acid_pool" then
                            hazardArray[j] = "chasm"
                        elseif hazardArray[j] == "cracked_ice" then
                            hazardArray[j] = "water"
                        elseif hazardArray[j] == "ice" then
                            hazardArray[j] = "cracked_ice"
                        elseif hazardArray[j] == "cracked_acid_ice" then
                            hazardArray[j] = "acid"
                        elseif hazardArray[j] == "acid_ice" then
                            hazardArray[j] = "cracked_acid_ice"
                        end
                        -- Damage progresses certain hazards. This can be prevented via blocks, but lethality can still happen due to bump damage.
                        local tempDamage = damage
                        if targetData.acid == 1 or targetData.acid == 2 then
                            tempDamage = tempDamage * 2
                        elseif targetData.armored then
                            tempDamage = tempDamage - 1
                        end
                        targetData.health = targetData.health - tempDamage
                        if outputArray[j-targetData.offset].shots ~= 0 then
                            outputArray[j-targetData.offset].bonus_damage = outputArray[j-targetData.offset].bonus_damage + tempDamage
                        end
                        -- Damage is dealt after modifiers
                    end
                    table.insert(outputArray[j-targetData.offset].hit_sequence, hitType)

                    local displaced = false

                    if push then
                        if j == #targetArray then
                            flag_miss = true
                            if targetData.type == "pawn" or targetData.type == "pawn_corpse" then
                                if targetData.stable == PUSHABLE then
                                    table.insert(outputArray[j-targetData.offset].push_sequence, "miss")
                                elseif targetData.stable == UNPUSHABLE then
                                    table.insert(outputArray[j-targetData.offset].push_sequence, "guard")
                                else
                                    table.insert(outputArray[j-targetData.offset].push_sequence, "null")
                                end
                            elseif targetData.type == "obstacle" then
                                table.insert(outputArray[j-targetData.offset].push_sequence, "null")
                            end
                            -- Hitting a target on the edge of the board is almost identical to hitting a stable one
                        else
                            local shiftedData = targetArray[j+1]
                            if targetData.type == "obstacle" then
                                table.insert(outputArray[j-targetData.offset].push_sequence, "null")
                                -- Hitting an obstacle is identical to hitting a stable target
                            elseif targetData.stable ~= PUSHABLE then
                                if targetData.stable == UNPUSHABLE then
                                    table.insert(outputArray[j-targetData.offset].push_sequence, "guard")
                                else
                                    table.insert(outputArray[j-targetData.offset].push_sequence, "null")
                                end
                                -- Hitting a stable target automatically fails the push but tells the game one was attempted and failed
                            elseif shiftedData.type == "empty" then
                                -- For the preview; bumps add a push tile to the preview (with a bump symbol) despite not actually pushing to match vanilla aesthetics. This line prevents that push from badly representing the whole effect
                                table.insert(outputArray[j-targetData.offset].push_sequence, "push")
                                targetData.offset = targetData.offset + 1
                                targetArray[j+1] = copy_table(targetData)
                                targetData.type = "empty"
                                displaced = true
                                -- If there's room, the unit is pushed
                            else
                                -- Otherwise, an impact is generated, dealing damage
                                if shiftedData.type == "obstacle" then
                                    if targetData.frozen then
                                        targetData.frozen = false
                                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                                    elseif targetData.shield then
                                        targetData.shield = false
                                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                                    elseif ( IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") ) and targetData.team == TEAM_ENEMY then
                                        targetData.health = targetData.health - 2
                                        outputArray[j-targetData.offset].bonus_damage = outputArray[j-targetData.offset].bonus_damage + 2
                                        outputArray[j-targetData.offset].bump_damage = outputArray[j-targetData.offset].bump_damage + 2
                                    else
                                        targetData.health = targetData.health - 1
                                        outputArray[j-targetData.offset].bonus_damage = outputArray[j-targetData.offset].bonus_damage + 1
                                        outputArray[j-targetData.offset].bump_damage = outputArray[j-targetData.offset].bump_damage + 1
                                    end
                                    if shiftedData.shield then
                                        shiftedData.shield = false
                                    elseif shiftedData.frozen then
                                        shiftedData.frozen = false
                                    else
                                        if shiftedData.cracked == true then
                                            shiftedData.type = "empty"
                                        else
                                            shiftedData.cracked = true
                                        end
                                    end
                                    -- Impacts crack obstacles
                                else
                                    if targetData.frozen then
                                        targetData.frozen = false
                                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                                    elseif targetData.shield then
                                        targetData.shield = false
                                        outputArray[j-targetData.offset].bonus_bonk = outputArray[j-targetData.offset].bonus_bonk + 1
                                    elseif ( IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") ) and targetData.team == TEAM_ENEMY then
                                        targetData.health = targetData.health - 2
                                        outputArray[j-targetData.offset].bonus_damage = outputArray[j-targetData.offset].bonus_damage + 2
                                        outputArray[j-targetData.offset].bump_damage = outputArray[j-targetData.offset].bump_damage + 2
                                    else
                                        targetData.health = targetData.health - 1
                                        outputArray[j-targetData.offset].bonus_damage = outputArray[j-targetData.offset].bonus_damage + 1
                                        outputArray[j-targetData.offset].bump_damage = outputArray[j-targetData.offset].bump_damage + 1
                                    end
                                    if shiftedData.frozen then
                                        shiftedData.frozen = false
                                        outputArray[j+1].bonus_bonk = outputArray[j+1].bonus_bonk + 1
                                    elseif shiftedData.shield then
                                        shiftedData.shield = false
                                        outputArray[j+1].bonus_bonk = outputArray[j+1].bonus_bonk + 1
                                    elseif ( IsPassiveSkill("Passive_ForceAmp") or IsPassiveSkill("Passive_ForceAlt") ) and shiftedData.team == TEAM_ENEMY then
                                        shiftedData.health = shiftedData.health - 2
                                        outputArray[j+1].bonus_damage = outputArray[j+1].bonus_damage + 2
                                        outputArray[j+1].bump_damage = outputArray[j+1].bump_damage + 2
                                    else
                                        shiftedData.health = shiftedData.health - 1
                                        outputArray[j+1].bonus_damage = outputArray[j+1].bonus_damage + 1
                                        outputArray[j+1].bump_damage = outputArray[j+1].bump_damage + 1
                                    end
                                end
                                table.insert(outputArray[j-targetData.offset].push_sequence, "impact")
                            end
                        end
                    end

                    -- If target was just pushed: hazard, item, and lethality tests are done for the next element rather than the current. Comments are only listed for the latter.
                    if displaced == true then
                        shiftedData = targetArray[j+1]
                        if hazardArray[j+1] == "chasm" and ( shiftedData.health < 1 or shiftedData.flying == false ) then
                            shiftedData.type = "empty"
                        elseif ( hazardArray[j+1] == "water" or hazardArray[j+1] == "acid" or hazardArray[j+1] == "lava" ) and ( shiftedData.health < 1 or shiftedData.flying == false ) and shiftedData.massive == false then
                            shiftedData.type = "empty"
                        elseif hazardArray[j+1] == "acid" and shiftedData.massive and shiftedData.flying == false and shiftedData.acid == CLEAN then
                            shiftedData.acid = ACIDIFIED
                        elseif hazardArray[j+1] == "cracked_acid_pool" then
                            if shiftedData.acid == CLEAN then
                                shiftedData.acid = ACIDIFIED
                            end
                            hazardArray[j+1] = "cracked"
                        elseif hazardArray[j+1] == "acid_pool" then
                            if shiftedData.acid == CLEAN then
                                shiftedData.acid = ACIDIFIED
                            end
                            hazardArray[j+1] = "clear"
                        end

                        if itemArray[j+1] == "mine" then
                            shiftedData.type = "empty"
                            itemArray[j+1] = {"clear"}
                        elseif itemArray[j+1] == "mine_cryo" then
                            shiftedData.frozen = true
                            itemArray[j+1] = {"clear"}
                        elseif itemArray[j+1] == "mine_repair" then
                            shiftedData.health = shiftedData.max_health
                            itemArray[j+1] = {"clear"}
                        end

                        if shiftedData.type == "pawn" and shiftedData.health < 1 then
                            if shiftedData.type == "pawn_corpse" then
                                shiftedData.health = 0
                            else
                                shiftedData.type = "empty"
                            end
                        end

                    else
                        if hazardArray[j] == "chasm" and ( targetData.health < 1 or targetData.flying == false ) then
                            targetData.type = "empty"
                        -- Chasm tiles can kill grounded units
                        elseif ( hazardArray[j] == "water" or hazardArray[j] == "acid" or hazardArray[j] == "lava" ) and ( targetData.health < 1 or targetData.flying == false ) and targetData.massive == false then
                            targetData.type = "empty"
                        -- Liquid tiles can kill grounded non-massive units
                        elseif hazardArray[j] == "acid" and targetData.massive and targetData.flying == false and targetData.acid == 0 then
                            targetData.acid = ACIDIFIED
                        -- Acid tiles will nonlethally acidify massive units
                        -- Shield can prevent this but with damaging weapons it never comes into play.
                        elseif hazardArray[j] == "cracked_acid_pool" then
                            if targetData.acid == CLEAN then
                                targetData.acid = ACIDIFIED
                            end
                            hazardArray[j] = "cracked"
                        elseif hazardArray[j] == "acid_pool" then
                            if targetData.acid == CLEAN then
                                targetData.acid = ACIDIFIED
                            end
                            hazardArray[j] = "clear"
                        -- Acid tiles will acidify all units
                        -- Shield can prevent this but with damaging weapons it never comes into play.
                        end

                        if itemArray[j] == "mine" then
                            targetData.type = "empty"
                            itemArray[j] = {"clear"}
                        -- Mines can kill all units
                        elseif itemArray[j] == "mine_cryo" then
                            targetData.frozen = true
                            itemArray[j] = {"clear"}
                        -- Cryo mines can freeze all units
                        elseif itemArray[j] == "mine_repair" then
                            targetData.health = targetData.max_health
                            itemArray[j] = {"clear"}
                        -- Repair mines can heal all units
                        -- NOTICE Do repair mines remove debuffs?
                        end

                        if targetData.health < 1 then
                            if targetData.type == "pawn_corpse" then
                                targetData.health = 0
                            else
                                targetData.type = "empty"
                            end
                        end
                        if push then
                            shiftedData = targetArray[j+1]
                            if shiftedData and shiftedData.type == "pawn" and shiftedData.health < 1 then
                                if shiftedData.type == "pawn_corpse" then
                                    shiftedData.health = 0
                                else
                                    shiftedData.type = "empty"
                                end
                            end
                        end
                        -- Space is cleared if damage is lethal and target does not create corpse on death
                    end

                end
                outputArray[j].shots = outputArray[j].shots + 1
                -- Let the system know it can begin racking up bonus damage
                strike = true
            elseif j == #targetArray then
                outputArray[j].shots = outputArray[j].shots + 1
                outputArray[j].hits = outputArray[j].hits + 1
                table.insert(outputArray[j].hit_sequence, "null")
                -- Adds a hit if a projectile reaches the board edge w/out hitting anything
                if push and not flag_miss then
                    table.insert(outputArray[j].push_sequence, "null")
                end
                -- Adds the failed push at the edge of the board
            end
        end
    end
    local finalArray = {}
    local lastShot = 1
    for i = 1, #outputArray do
        finalArray[i] = {}
        finalArray[i].bonus_damage = outputArray[i].bonus_damage
        finalArray[i].bump_damage = outputArray[i].bump_damage
        finalArray[i].bonus_bonk = outputArray[i].bonus_bonk
        finalArray[i].shots = outputArray[i].shots

        if finalArray[i].shots ~= 0 then
            lastShot = i
        end
        if outputArray[i].hits > 1 then
            local damage_icon = "combat/icons/multihit/multihit_"..outputArray[i].hits
            local hit_type = outputArray[i].hit_type
            if hit_type ~= "" then
                damage_icon = damage_icon.."_"..hit_type
            end
            local hit_modifier = ""
            local hit_flag = false
            local hit_sequence = outputArray[i].hit_sequence
            local length = #hit_sequence
            for j = 1, length do
                local hit = hit_sequence[length - j + 1]
                if hit == "acidify" and ( hit_type == "boost" or hit_type == "acid" ) then
                    hit = "null"
                end
                if hit_flag == true or hit ~= "null" then
                    hit_flag = true
                    hit_modifier = hit..hit_modifier
                    hit_modifier = "_"..hit_modifier
                end
            end
            if hit_modifier ~= "" then
                damage_icon = damage_icon..hit_modifier
            end
            finalArray[i].damage_icon = damage_icon..".png"
        else
            finalArray[i].damage_icon = ""
        end

        local push_sequence = outputArray[i].push_sequence
        if push and #push_sequence > 0 then
            local push_indicator = "multipush_"..DirString(dir).."_"
            local stable_flag = false
            local push_modifier = ""
            for j, k in ipairs(outputArray[i].push_sequence) do
                if ( k == "miss" or k == "null" ) and stable_flag then
                    break
                end
                if j ~= 1 then
                    push_modifier = push_modifier.."_"
                end
                push_modifier = push_modifier..k
                if k == "guard" then
                    stable_flag = true
                    -- to prevent guard and stable indicators from overlapping in rare cases (guard looks like stable with extra pzazz)
                end
                if k == "miss" or k == "null" then
                    break
                    -- stop making the indicator after a miss
                end
            end
            if push_modifier ~= "" then
                finalArray[i].push_indicator = push_indicator..push_modifier
                finalArray[i].push_mod = push_modifier
            else
                finalArray[i].push_indicator = ""
            end
        end
    end

    finalArray[lastShot].final = true

    return finalArray
end

local function MultihitProjectile(damage, attacks, point, dir, config)
    if Board then
        config = config or {}
        config.damage = damage
        config.attacks = attacks
        config.push = config.push or false
        config.mode = config.mode or "instant"
        config.immunities = config.immunities or {}
        config.sfx_fire = config.sfx_fire or ""
        config.sfx_hit = config.sfx_hit or ""
        config.proj_art = config.proj_art or ""
        config.anim = config.anim or ""
        config.anim_directional = config.anim_directional or "none"
        config.anim_origin = config.anim_origin or ""
        config.anim_origin_directional = config.anim_origin_directional or "none"
        config.delay = config.delay or 0.2
        config.custom_projectile = config.custom_projectile or false
        config.queued = config.queued or false

        local proj_damage = SpaceDamage(point, damage)
        proj_damage.bHidePath = true
        proj_damage.sSound = config.sfx_hit
        if config.anim_directional == "forwards" then
            proj_damage.sAnimation = config.anim..dir
        elseif config.anim_directional == "backwards" then
            proj_damage.sAnimation = config.anim..DirReverse(dir)
        else
            proj_damage.sAnimation = config.anim
        end
        if config.anim_origin_directional == "forwards" then
            config.anim_origin = config.anim_origin..dir
        elseif config.anim_origin_directional == "backwards" then
            config.anim_origin = config.anim_origin..DirReverse(dir)
        end

        local delay_extra = config.push and 0.60 or 0

        local boost = false
        if config.origin and Board and Board:IsPawnSpace(config.origin) and Board:GetPawn(config.origin):IsBoosted() and config.damage ~= 0 and config.damage ~= DAMAGE_ZERO then
            config.damage = config.damage + 1
            boost = true
        end

        local dirVector = DIR_VECTORS[dir]
        local pathArray = {}
        for i = 1, 7 do
            local curr = point + dirVector*i
            if Board:IsValid(curr) then
                table.insert(pathArray, curr)
            else
                break
            end
        end

        local projectileArray = MultihitProjectilePreview(config.damage, attacks, dir, config.push, boost, pathArray, config.immunities)

        if config.mode ~= "instant" and config.ret then
            if not config.queued and config.projectile_speed and ffrg_WorldConstants then
                ffrg_WorldConstants:setSpeed(config.ret, (config.projectile_speed/18))
            end
            if not Board:IsTipImage() then
                Passive_ForceAmp.Passive = "Passive_ForceAlt"
                config.ret:AddScript("ffrg_MultihitForceSet()")
            end
            local final
            local queued_anims = {}
            local last_point = point
            local damagel = SpaceDamage(point, 0)
            damagel.sSound = ""
            damagel.sAnimation = ""
            if not config.queued then
                for i = 1, #projectileArray do
                    if projectileArray[i].shots > 0 then
                        local curr_point = point + DIR_VECTORS[dir] * i
                        damagel.loc = curr_point
                        if config.queued then
                            config.ret:AddQueuedProjectile(damagel, "", 0)
                        else
                            config.ret:AddProjectile(last_point, damagel, "", 0)
                        end
                        last_point = curr_point
                    end
                end
            else
                for i = 1, #projectileArray do
                    if projectileArray[i].shots > 0 then
                        final = point + DIR_VECTORS[dir] * i
                    end
                end
                damagel.loc = final
                config.ret:AddQueuedProjectile(damagel, "", 0)
            end
            for i, tile in ipairs(projectileArray) do
                local curr = point + dirVector*i
                if Board:IsBuilding(curr) and tile.bump_damage > 0 then --Building Damage Previews
                    if tile.shots > 0 and damage > 0 then
                        for i = 1, tile.bump_damage do
                            WeaponPreview:AddDamage(SpaceDamage(curr,1))
                        end
                    else
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret, tile.bump_damage, curr, {queued = config.queued, preview = true, type = "bump", stupidBuilding = true})
                    end
                end
                if tile.bonus_damage > 0 or tile.bonus_bonk > 0 and not Board:IsBuilding(curr) then
                    if Board:IsPawnSpace(curr) then
                        local pawnType = _G[Board:GetPawn(curr):GetType()]
                        if pawnType and pawnType.Pushable == nil or pawnType.Pushable == true then
                            tile.bonus_damage = tile.bonus_damage + tile.bonus_bonk
                            if tile.shots > 0 and tile.bonus_bonk > 0 then
                                tile.bonus_damage = tile.bonus_damage - 1
                            end
                            ffrg_SeriousDamage.AppendSeriousDamage(config.ret, tile.bonus_damage, curr, {queued = config.queued, preview = true, type = "stupid"})
                        elseif config.origin and Board:IsPawnSpace(config.origin) and pawnType and tile.bump_damage > 0 then
                            local pawn = Board:GetPawn(config.origin)
                            ffrg_SeriousDamage.AppendSeriousDamage(config.ret, tile.bump_damage, curr, {queued = config.queued, preview = true, type = "stupid", uprootData = {pawn:GetId(),pawn:GetArmedWeapon(),pawn:GetArmedWeaponId()}})
                        end
                    else
                        tile.bonus_damage = tile.bonus_damage + tile.bonus_bonk
                        if tile.shots > 0 and tile.bonus_bonk > 0 then
                            tile.bonus_damage = tile.bonus_damage - 1
                        end
                        ffrg_SeriousDamage.AppendSeriousDamage(config.ret, tile.bonus_damage, curr, {queued = config.queued, preview = true, type = "stupid"})
                    end
                end
                if tile.push_indicator and tile.push_indicator ~= "" then
                    proj_damage.iPush = 5
                    local append = 2
                    if MultipushLengthBank[tile.push_mod] then
                        for i = 1, MultipushLengthBank[tile.push_mod] do
                            local curr2 = curr + DIR_VECTORS[dir]*(i-1)
                            if Board:IsValid(curr2) then
                                local terrain = Board:GetTerrain(curr)
                                if terrain == TERRAIN_ICE then
                                    append = math.min(append,1)
                                elseif terrain ~= TERRAIN_WATER and terrain ~= TERRAIN_LAVA and terrain ~= TERRAIN_ACID and terrain ~= TERRAIN_HOLE then
                                    append = 0
                                    break
                                end
                            end
                        end
                    else
                        append = 0
                    end
                    if append > 0 then
                        tile.push_indicator = tile.push_indicator.."_"
                        for i = 1, append do
                            tile.push_indicator = tile.push_indicator.."x"
                        end
                    end
                    if not Board:IsTipImage() then
                        if config.queued then
                            if ANIMS[tile.push_indicator.."_focused"] then
                                table.insert( queued_anims, { focused = true, type = "animation", data = tile.push_indicator.."_focused", loc = curr } )
                            end
                            if ANIMS[tile.push_indicator.."_unfocused"] then
                                table.insert( queued_anims, { focused = false, type = "animation", data = tile.push_indicator.."_unfocused", loc = curr } )
                            end
                        elseif ANIMS[tile.push_indicator] then
                            WeaponPreview:AddAnimation(curr, tile.push_indicator, 0)
                        end
                    elseif ANIMS[tile.push_indicator] then
                        if not config.queued or (config.origin and Board:IsPawnSpace(config.origin) and (Board:GetPawn(config.origin):GetUndoLoc() == nil or Board:GetPawn(config.origin):GetUndoLoc() ~= Point(6,9))) then
                            local tipDuration = 3
                            if _G[ffrg_TipWeaponId] and _G[ffrg_TipWeaponId].TipImage then
                                tipDuration = _G[ffrg_TipWeaponId].TipImage.Length or 3
                            end
                            if config.queued then
                                ANIMS["ffrg_TemporaryTipMultihitAnim_"..ffrg_TipWeaponId.."_"..curr:GetString()] = ANIMS[tile.push_indicator]:new{
                                    Frames = {1, 0},
                                    Lengths = {tipDuration*0.2, tipDuration*0.3},
                                    Loop = false
                                }
                            else
                                ANIMS["ffrg_TemporaryTipMultihitAnim_"..ffrg_TipWeaponId.."_"..curr:GetString()] = ANIMS[tile.push_indicator]:new{
                                    Frames = {2, 0},
                                    Lengths = {tipDuration*0.2, tipDuration*0.3},
                                    Loop = false
                                }
                            end
                            Board:AddAnimation(curr, "ffrg_TemporaryTipMultihitAnim_"..ffrg_TipWeaponId.."_"..curr:GetString(), 1)
                        end
                    end
                else
                    if config.push then
                        proj_damage.iPush = 5
                    end
                end
                if tile.shots > 0 then
                    proj_damage.loc = curr
                    if not config.queued then
                        if config.damage ~= 0 then
                            proj_damage.sImageMark = tile.damage_icon
                        end
                    end
                    for j = 1, tile.shots do
                        if j == tile.shots then
                            proj_damage.bHide = false
                            if config.queued and tile.damage_icon ~= "" then
                                QueuedDamageIconAdd(tile.damage_icon, dir, curr, queued_anims)
                            end
                            if tile.final then
                                delay_extra = 0
                                config.delay = 0
                                final = curr
                            end
                        else
                            if Board:IsBuilding(curr) or ( Board:IsPawnSpace(curr) and Board:GetPawn(curr):IsGuarding() ) then
                                proj_damage.bHide = false
                            else
                                proj_damage.bHide = true
                            end
                        end
                        local pointDamage = SpaceDamage(point, 0)
                        pointDamage.sSound = config.sfx_fire
                        pointDamage.sAnimation = config.anim_origin
                        pointDamage.bHide = true
                        if config.push then
                            local pushDamage = SpaceDamage(curr, 0, dir)
                            pushDamage.bHide = true
                            if config.queued then
                                config.ret:AddQueuedDamage(pointDamage)
                                config.ret:AddQueuedProjectile(proj_damage, config.proj_art, 0)
                                config.ret:AddQueuedProjectile(pushDamage, "", math.max(delay_extra, config.delay))
                            else
                                config.ret:AddDamage(pointDamage)
                                if config.custom_projectile and ffrg_CustomProjectile then
                                    if config.projectile_speed and ffrg_WorldConstants then
                                        ffrg_CustomProjectile.AddCustomProjectile(point, curr, config.proj_art, {ret = config.ret, speed = config.projectile_speed})
                                    else
                                        ffrg_CustomProjectile.AddCustomProjectile(point, curr, config.proj_art, {ret = config.ret})
                                    end
                                    config.ret:AddProjectile(point, proj_damage, "", 0)
                                else
                                    config.ret:AddProjectile(point, proj_damage, config.proj_art, 0)
                                end
                                config.ret:AddProjectile(point, pushDamage, "", math.max(delay_extra, config.delay))
                            end
                        else
                            if config.queued then
                                config.ret:AddQueuedDamage(pointDamage)
                                config.ret:AddQueuedProjectile(proj_damage, config.proj_art, math.max(delay_extra, config.delay))
                            else
                                config.ret:AddDamage(pointDamage)
                                if config.custom_projectile and ffrg_CustomProjectile then
                                    if config.projectile_speed and ffrg_WorldConstants then
                                        ffrg_CustomProjectile.AddCustomProjectile(point, curr, config.proj_art, {ret = config.ret, speed = config.projectile_speed})
                                    else
                                        ffrg_CustomProjectile.AddCustomProjectile(point, curr, config.proj_art, {ret = config.ret})
                                    end
                                    config.ret:AddProjectile(point, proj_damage, "", config.delay)
                                else
                                    config.ret:AddProjectile(point, proj_damage, config.proj_art, config.delay)
                                end
                            end
                        end
                    end
                end
            end
            if config.queued and queued_anims ~= {} and config.origin and Board:IsPawnSpace(config.origin) then
                ffrg_QueuedPreview.AddQueuedSet(Board:GetPawn(config.origin):GetId(),queued_anims)
            end
            if not config.queued and config.projectile_speed and ffrg_WorldConstants then
                ffrg_WorldConstants:resetSpeed(config.ret)
            end
        elseif config.mode == "instant" then
            local ret = SkillEffect()
            if config.projectile_speed and ffrg_WorldConstants then
                ffrg_WorldConstants:setSpeed(ret, (config.projectile_speed/18))
            end
            for i, tile in ipairs(projectileArray) do
                local curr = point + dirVector*i
                if tile.shots > 0 then
                    proj_damage.loc = curr
                    for j = 1, tile.shots do
                        if j == tile.shots and tile.final then
                            delay_extra = 0
                            config.delay = 0
                        end
                        local pointDamage = SpaceDamage(point, 0)
                        pointDamage.sSound = config.sfx_fire
                        pointDamage.sAnimation = config.anim_origin
                        ret:AddDamage(pointDamage)
                        ret:AddProjectile(point, proj_damage, config.proj_art, math.max(delay_extra, config.delay))
                    end
                end
            end
            if config.projectile_speed and ffrg_WorldConstants then
                ffrg_WorldConstants:resetSpeed(ret)
            end
            Board:AddEffect(ret)
        end
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_Multihit.MultihitMelee = MultihitMelee
    ffrg_Multihit.MultihitProjectile = MultihitProjectile
    ffrg_Multihit.Version = VERSION
end

if ffrg_Multihit then
    if modApi:isVersion(ffrg_Multihit.Version, VERSION) and ffrg_Multihit.Version ~= VERSION then
        initialize()
    end
else
    ffrg_Multihit = ffrg_Multihit or {}
    initialize()
end

return ffrg_Multihit


--////////////////////////////////--
