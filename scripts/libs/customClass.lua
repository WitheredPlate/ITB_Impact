--////////////////////////////////--
--//            Title           //--
--////////////////////////////////--

--      Custom Class Library      --

--##      By WitheredPlate      ##--

--////////////////////////////////--





--////////////////////////////////--
--//         Information        //--
--////////////////////////////////--


-----------------
-- Description --
-----------------

local VERSION = "1.0.0"

--## A library for creating custom mech and weapon classes


-----------------------
-- Table of Contents --
-----------------------

--## ffrg_***
-- ( * [*],  * [*] )


--////////////////////////////////--





--////////////////////////////////--
--//            Tools           //--
--////////////////////////////////--


local function buildSquadId(squad)
	return string.format("%s_%s", modApi.currentMod, squad[1]:gsub("%s","_"))
end

local vanillaMechClasses = {
    "Prime",
    "Brute",
    "Ranged",
    "Science",
    "TechnoVek",
}

local validMechClasses = {
    "Prime",
    "Brute",
    "Ranged",
    "Science",
    "TechnoVek",
}

local CLASS_ORDER = {
    Prime = 0,
    Brute = 1,
    Ranged = 2,
    Science = 3,
    TechnoVek = 4,
}

local RESERVED_SQUAD_ID = {
    "Custom",
}

modApi.oldAddSquad = modApi.addSquad
function modApi:addSquad(squad, name, desc, icon)
    local custom_class = false
    for i = 2, 4 do
        if custom_class then break end
        local mechType = squad[i]
        local ptable = _G[mechType]
        local found = false
		for _, i in ipairs(vanillaMechClasses) do
            if ptable.Class == i then
                found = true
            end
        end
        if not found then
            custom_class = true
            break
        end
	end
	if custom_class then
        Assert.ModInitializingOrLoading()

        Assert.Equals('table', type(squad), "Argument #1")
        Assert.Equals(4, #squad, "Argument #1 - table size")
        Assert.Equals('string', type(squad[1]), "Argument #1 - entry 1")
        Assert.Equals('string', type(name), "Argument #2")
        Assert.Equals('string', type(desc), "Argument #3")

        squad.id = squad.id or buildSquadId(squad)
        Assert.Equals(nil, modApi.mod_squads_by_id[squad.id], string.format("Squad with id %q already exists", squad.id))
        Assert.NotEquals(RESERVED_SQUAD_ID, squad.id, string.format("Squad id %s is reserved", squad.id))

        local mechOrder = {[squad[1]] = -1}

        for i = 2, 4 do
            local mechType = squad[i]
            local ptable = _G[mechType]

            Assert.Equals(
                    "table", type(ptable),
                    string.format("Squad %q - contains pawn with id %q, but no global pawn table with such identifier exists", squad.id, mechType)
            )
            Assert.Equals(
                    validMechClasses,
                    ptable.Class,
                    string.format("Squad %q - pawn with id %q has an invalid Class", squad.id, mechType)
            )

            mechOrder[mechType] = CLASS_ORDER[ptable.Class] or INT_MAX
        end

        table.sort(squad, function(a, b) return mechOrder[a] < mechOrder[b] end)

        modApi.mod_squads_by_id[squad.id] = squad

        table.insert(self.mod_squads, squad)
        table.insert(self.squad_text, name)
        table.insert(self.squad_text, desc)
        table.insert(self.squad_icon, icon or "resources/mods/squads/unknown.png")
    else
        return modApi.oldAddSquad(self, squad, name, desc, icon)
    end
end


--////////////////////////////////--





--////////////////////////////////--
--//            Code            //--
--////////////////////////////////--


local function ffrg_AddClass(id, name)
    modApi:setText("Skill_Class"..id, name)
    table.insert(CLASS_ORDER, {_G[id], 5})
    table.insert(validMechClasses, id)
end

local ffrg_ClassStorage = {}
local ffrg_CurrentSquad = {}

local function ffrg_ClassStore()
    local mechs = {}
    for i = 1, 3 do
        table.insert(mechs,ffrg_CurrentSquad:PopPawn())
    end
    for i = 1, 3 do
        ffrg_ClassStorage.(4-i) = mechs[i]:GetClass()
        mechs[i]:SetClass("Ranged")
    end
    for i = 1, 3 do
        ffrg_CurrentSquad:AddPawn(table.remove(mechs))
    end
end

local function ffrg_ClassRegain()
    if Game then
        for id, class in pairs(ffrg_ClassStorage) do
            Game:GetPawn(id):SetClass(class)
        end
        ffrg_ClassStorage = {}
    end
end

local function ffrg_onPostStartGame()
    ffrg_ClassRegain()
end

local function ffrg_onSquadSelectionWindowHidden(screen)
    LOG("Hangar UI Hidden")
    ffrg_ClassStore()
end

local function ffrg_onHangarSquadSelected(selectedSquad)
    LOG("Mechs Selected")
    ffrg_CurrentSquad = selectedSquad
end

modApi.events.onPostStartGame:subscribe(ffrg_onPostStartGame)
modApi.events.onHangarMechsSelected:subscribe(ffrg_onHangarMechsSelected)
modApi.events.onSquadSelectionWindowHidden:subscribe(ffrg_onSquadSelectionWindowHidden)

--////////////////////////////////--





--////////////////////////////////--
--//       Initialization       //--
--////////////////////////////////--


local function initialize()
    ffrg_CustomClass.AddClass = ffrg_AddClass
    ffrg_CustomClass.Version = VERSION
end

if ffrg_CustomClass then
    if modApi:isVersion(ffrg_CustomClass.Version, VERSION) and ffrg_CustomClass.Version ~= VERSION then
        initialize()
    end
else
    ffrg_CustomClass = ffrg_CustomClass or {}
    initialize()
end

return ffrg_CustomClass


--////////////////////////////////--
