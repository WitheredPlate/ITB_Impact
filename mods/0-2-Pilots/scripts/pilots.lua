--////////////////////////////////--
--//       (Impact) Pilots      //--
--////////////////////////////////--

--== Unique ==--
-- Evelyn Moore
-- Averruncus

--== Alien ==--
-- Turzil

--////////////////////////////////--





--////////////////////////////////--
--//           Assets           //--
--////////////////////////////////--

local path = mod_loader.mods[modApi.currentMod].resourcePath

local imagePath = path .."img/"

local files = {
    "effects/ffrg_confuse_cult.png",
    "weapons/ffrg_repair_engi.png",
    "weapons/ffrg_repair_engi_frozen.png",
    "combat/icons/ffrg_icon_repair_engi_10.png",
    "combat/icons/ffrg_icon_repair_engi_10_miss.png",
    "combat/icons/ffrg_icon_repair_engi_10_redundant.png",
    "combat/icons/ffrg_icon_repair_engi_10_redundant_miss.png",
    "combat/icons/ffrg_icon_repair_engi_11.png",
    "combat/icons/ffrg_icon_repair_engi_11_miss.png",
    "combat/icons/ffrg_icon_repair_engi_11_redundant.png",
    "combat/icons/ffrg_icon_repair_engi_11_redundant_miss.png"
}

Location["combat/icons/ffrg_icon_repair_engi_10.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_redundant.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_10_redundant_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_miss.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_redundant.png"] = Point(-28,-2)
Location["combat/icons/ffrg_icon_repair_engi_11_redundant_miss.png"] = Point(-28,-2)

for _, file in ipairs(files) do
    modApi:appendAsset("img/".. file, imagePath .. file)
end

--////////////////////////////////--





--////////////////////////////////--
--//           Pilots           //--
--////////////////////////////////--


------------------
-- Evelyn Moore --
------------------

local function Composed_Trigger(pawn)
    local point = pawn:GetSpace()
    local index = ffrg_Supply.SupplyIndex(point,point)
    if index > 0 then
        local damage = ffrg_Supply.Supply(point,point,nil,{returnDamage = true, hideIcon = true})
        damage.sAnimation = "nil"
        Board:DamageSpace(damage)
        Board:AddAnimation(point,"ffrg_UseSupply", 1)
    end
end

ffrg_PilotFactory.Fabricate{
    prefix = "ffrg",
    path = path,
    identifier = "Composed",
    name = "Evelyn Moore",
    blacklist = {
        "Conservative",
        "Pain",
        "Move",
        "Adrenaline"
    },
    ability_title = "Composed",
    ability_description = "Mech is Supplied if it does not move.",
    ability_type = "patient",
    ability_data = Composed_Trigger
}


----------------
-- Averruncus --
----------------

ffrg_Emitter_Confuse = Emitter_Confuse1:new{
    x = 0,
    y = 20,
    variance_x = 30,
    variance_y = 15,
    burst_count = 5,
    max_alpha = 0.6,
    speed = 0.6,
    lifespan = 2,
    image = "effects/ffrg_confuse_cult.png"
}

local function Martyr_Trigger(pawn)
    for i = 0, 7 do
        for j = 0, 7  do
            local point = Point(i,j)
            if Board:IsPawnSpace(point) and Board:GetPawn(point):GetTeam() == TEAM_ENEMY then
                Board:AddBurst(point, "ffrg_Emitter_Confuse", DIR_NONE)
                Board:DamageSpace(SpaceDamage(point,0,DIR_FLIP))
            end
        end
    end
end

ffrg_PilotFactory.Fabricate{
    prefix = "ffrg",
    path = path,
    identifier = "Martyr",
    name = "Averruncus",
    power_cost = 2,
    ability_title = "Salvation",
    ability_description = "On Reset Turn, Flip all enemies.",
    ability_type = "reset",
    ability_data = Martyr_Trigger
}


------------
-- Turzil --
------------

ffrg_Repair_Engi = Skill_Repair:new{
    Name = "Flawless Repair",
    Description = "Repair 10 damage; clear debuffs; and apply Shield, Boost and Supply.",
    Amount = -10,
    LaunchSound = "/weapons/refrigerate"
}

function ffrg_Repair_Engi:GetSkillEffect(p1,p2)
	local ret = SkillEffect()

    local damage = SpaceDamage(p2,0)
    local damageo = SpaceDamage(p2,-1)
    local damages = SpaceDamage(p2,self.Amount)
    local damageb = SpaceDamage(p2,0)
    local damager = ffrg_Supply.Supply(p1,p2,nil,{returnDamage = true})

    damages.bHide = true
	damages.iFire = EFFECT_REMOVE
	damages.iAcid = EFFECT_REMOVE
	damageo.iFire = EFFECT_REMOVE
	damageo.iAcid = EFFECT_REMOVE
	damageb.iShield = EFFECT_CREATE

    local icon = "combat/icons/ffrg_icon_repair_engi_"
    local supply = true

    if Board:IsPawnSpace(p1) and Board:GetPawn(p1):IsBoosted() then
        icon = icon.."11"
    else
        icon = icon.."10"
    end
    if ( not Board:IsTipImage() and ffrg_Supply.SupplyIndex(p1,p2) == 0 ) then
        supply = false
        icon = icon.."_redundant"
    end

    if Board:IsPawnSpace(p2) and Board:GetPawn(p2):IsShield() then
        icon = icon.."_miss"
    end

    icon = icon..".png"

    damage.sImageMark = icon

    ret:AddScript(string.format("ffrg_Repair_Engi:Boost(%s)", p2:GetString()))
    ret:AddDamage(damager)
    ret:AddDamage(damages)
    ret:AddDamage(damageb)
    ret:AddDamage(damage)

	if IsPassiveSkill("Mass_Repair") then
		local mechs = extract_table(Board:GetPawns(TEAM_MECH))
		for i,id in pairs(mechs) do
			if Board:GetPawnSpace(id) ~= p2 then
				damageo.loc = Board:GetPawnSpace(id)
				ret:AddDamage(damageo)
			end
		end
	end

	return ret
end

function ffrg_Repair_Engi:Boost(point)
    modApi:runLater(function()
        if Board:IsPawnSpace(point) then
            Board:GetPawn(point):SetBoosted(true)
        end
    end)
end

ffrg_PilotFactory.Fabricate{
    prefix = "ffrg",
    path = path,
    identifier = "Engi",
    name = "Turzil",
    power_cost = 1,
    ability_title = "Engi",
    ability_description = "Repair fully heals, Shields, Boosts, and Supplies.",
    ability_type = "repair",
    ability_data = {
        weapon = "ffrg_Repair_Engi",
        icon = "img/weapons/ffrg_repair_engi"
    }
}


