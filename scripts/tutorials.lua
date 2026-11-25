local Tutorials

if modApi:isProfilePath() then
	sdlext.config(
		modApi:getCurrentProfilePath().."modcontent.lua",
		function(obj)
			obj.ffrg_Tutorials = obj.ffrg_Tutorials or {}
			obj.ffrg_Tutorials.Supply = obj.ffrg_Tutorials.Supply or false
			Tutorials = obj.ffrg_Tutorials
		end
	)
end

local function writeData(id, obj)
	sdlext.config(
		modApi:getCurrentProfilePath().."modcontent.lua",
		function(readObj)
			readObj.ffrg_Tutorials[id] = obj
			Tutorials = readObj.ffrg_Tutorials
		end
	)
end

local function ffrg_onPawnIsSupplied(mission, pawn, index)
	if Tutorials and not Tutorials.Supply and mission ~= Mission_Test and not Board:IsTipImage() and pawn then
		local id = pawn:GetId()
		modApi:conditionalHook(
			function()
				return not Board:IsBusy()
			end,
			function()
				if Board:GetPawn(id) then
					Game:AddTip("ffrg_Tutorial_Supply",Board:GetPawn(id):GetSpace())
				else
					writeData("Supply", false)
				end
			end
		)
		writeData("Supply", true)
	end
end

if Tutorials and not Tutorials.Supply then
    ffrg_Supply.events.onPawnIsSupplied:subscribe(ffrg_onPawnIsSupplied)
end

modApi:setText("ffrg_Tutorial_Supply_Title", "Regaining Uses")
modApi:setText("ffrg_Tutorial_Supply_Text", "This unit was just Supplied. All of its held limited-use weapons have gained 1 use for the remainder of this mission.")
