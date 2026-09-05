local path = GetParentPath(...)
local dialog_impact = require(path.."dialog_impact")

local VE_Info = {
	Mech_Heal = { Odds = 15 },
	Mech_Boost = { Odds = 20 },
	Mech_Deplete = { Odds = 10 },
	Mech_Supply = { Odds = 30 },
	Mech_SelfDamage = { Odds = 5 }
}

for personality_id, dialog in pairs(dialog_impact) do
	if not Personality[personality_id] then
		local personality = CreatePilotPersonality(personality_id)
		Personality[personality_id] = personality
	end
	Personality[personality_id]:AddDialogTable(dialog)
end

local function ffrg_TunnelVoiceEvent(event, custom_odds)
	local eventInfo = VE_Info[event.id]
	local odds = eventInfo.Odds or 100
	if custom_odds then
		odds = custom_odds
	end
	if odds >= random_int(100) and ( not Game:IsVoicePopup() or odds == 100 ) and not Board:IsTipImage() and GetCurrentMission() ~= Mission_Test then
		TriggerVoiceEvent(event)
	end
end


----------
-- Heal --
----------

if ffrg_impact_dialog_setting == "full" then

	local oldTriggerVoiceEvent = TriggerVoiceEvent
	function TriggerVoiceEvent(event, ...)
		if event.id == "Mech_Repaired" then
			return
		elseif event.id == "Mech_Repaired_Tunnel" then
			event.id = "Mech_Repaired"
		end
		oldTriggerVoiceEvent(event, ...)
	end

	local repairing = nil

	local function ffrg_RepairTest(pawn, weaponId, p2, bool)
		if pawn and pawn:IsMech() and weaponId == "Skill_Repair" or weaponId == "Skill_Repair_Power" and pawn:GetSpace() == p2 then
			repairing = pawn:GetId()
		end
	end

	local ffrg_onSkillStart = function(mission, pawn, weaponId, p1, p2)
		ffrg_RepairTest(pawn, weaponId, p2)
	end

	local ffrg_onFinalEffectStart = function(mission, pawn, weaponId, p1, p2, p3)
		ffrg_RepairTest(pawn, weaponId, p2)
	end

	local ffrg_onSkillEnd = function(mission, pawn, weaponId, p1, p2)
		modApi:runLater(function()
			modApi:runLater(function()
				repairing = nil
			end)
		end)
	end

	local ffrg_onFinalEffectEnd = function(mission, pawn, weaponId, p1, p2, p3)
		modApi:runLater(function()
			modApi:runLater(function()
				repairing = nil
			end)
		end)
	end

	local function ffrg_onPawnHealed(mission, pawn, healingTaken)
		if pawn and pawn:IsMech() then
			local id = pawn:GetId()
			if repairing and repairing == id then
				local event = VoiceEvent("Mech_Repaired_Tunnel",id,id)
				TriggerVoiceEvent(event)
			else
				local event = VoiceEvent("Mech_Heal",id,id)
				ffrg_TunnelVoiceEvent(event)
			end
		end
	end

	modapiext.events.onPawnHealed:subscribe(ffrg_onPawnHealed)
	modapiext.events.onSkillStart:subscribe(ffrg_onSkillStart)
	modapiext.events.onFinalEffectStart:subscribe(ffrg_onFinalEffectStart)
	modapiext.events.onSkillEnd:subscribe(ffrg_onSkillEnd)
	modapiext.events.onFinalEffectEnd:subscribe(ffrg_onFinalEffectEnd)

end


-----------
-- Boost --
-----------

if ffrg_impact_dialog_setting ~= "impact" then

	local function ffrg_onPawnIsBoosted(mission, pawn, isBoost)
		if pawn and pawn:IsMech() and isBoost then
			local id = pawn:GetId()
			local event = VoiceEvent("Mech_Boost",id,id)
			ffrg_TunnelVoiceEvent(event)
		end
	end

	modapiext.events.onPawnIsBoosted:subscribe(ffrg_onPawnIsBoosted)

end

------------
-- Supply --
------------

local function ffrg_onPawnIsSupplied(mission, pawn, index)
	if pawn and pawn:IsMech() then
	local id = pawn:GetId()
	local event = VoiceEvent("Mech_Supply",id,id)
	ffrg_TunnelVoiceEvent(event)
	end
end

ffrg_Supply.events.onPawnIsSupplied:subscribe(ffrg_onPawnIsSupplied)


-------------
-- Deplete --
-------------

if ffrg_impact_dialog_setting ~= "impact" then

	local function ffrg_DepleteTest(pawn, weaponId)
		if pawn and Board then
			if pawn:IsMech() and pawn:IsWeaponPowered(weaponId) then
				local weaponIndex = nil
				local uses = {}
				local remaining = {}
				local count = pawn:GetWeaponCount()
				for i = 1, count do
					if pawn:GetWeaponType(i) == weaponId then
						weaponIndex = i
					end
					uses[i] = pawn:GetWeaponLimitedUses(i)
					remaining[i] = pawn:GetWeaponLimitedRemaining(i)
				end
				if weaponIndex and uses[weaponIndex] > 0 and remaining[weaponIndex] == 0 then
					local id = pawn:GetId()
					local event = VoiceEvent("Mech_Deplete",id,id)
					if count == 1 or ( uses[3-weaponIndex] > 0 and remaining[3-weaponIndex] == 0 ) then
						ffrg_TunnelVoiceEvent(event, 50)
					elseif uses[weaponIndex] >= 2 then
						ffrg_TunnelVoiceEvent(event, 20)
					else
						ffrg_TunnelVoiceEvent(event)
					end
				end
			end
		end
	end

	local ffrg_onSkillEnd2 = function(mission, pawn, weaponId, p1, p2)
		ffrg_DepleteTest(pawn, weaponId)
	end

	local ffrg_onFinalEffectEnd2 = function(mission, pawn, weaponId, p1, p2, p3)
		ffrg_DepleteTest(pawn, weaponId)
	end

	modapiext.events.onSkillEnd:subscribe(ffrg_onSkillEnd2)
	modapiext.events.onFinalEffectEnd:subscribe(ffrg_onFinalEffectEnd2)

end


-----------------
-- Self-Damage --
-----------------

if ffrg_impact_dialog_setting == "full" then

	local self_damaging = nil

	local function ffrg_SelfDamageTest(pawn, weaponId)
		if pawn and Board then
			if pawn:IsMech() and pawn:IsWeaponPowered(weaponId) then
				local weaponType = _G[weaponId]
				if weaponType.SelfDamage and weaponType.SelfDamage > 0 then
					self_damaging = pawn:GetId()
				end
			end
		end
	end

	local ffrg_onSkillStart3 = function(mission, pawn, weaponId, p1, p2)
		ffrg_SelfDamageTest(pawn, weaponId)
	end

	local ffrg_onFinalEffectStart3 = function(mission, pawn, weaponId, p1, p2, p3)
		ffrg_SelfDamageTest(pawn, weaponId)
	end

	local ffrg_onSkillEnd3 = function(mission, pawn, weaponId, p1, p2)
		modApi:runLater(function()
			modApi:runLater(function()
				self_damaging = nil
			end)
		end)
	end

	local ffrg_onFinalEffectEnd3 = function(mission, pawn, weaponId, p1, p2, p3)
		modApi:runLater(function()
			modApi:runLater(function()
				self_damaging = nil
			end)
		end)
	end

	local function ffrg_onPawnDamaged(mission, pawn, damageTaken)
		if pawn and pawn:IsMech() and pawn:GetHealth() > 1 then
			local id = pawn:GetId()
			if self_damaging and self_damaging == id then
				local event = VoiceEvent("Mech_SelfDamage",id,id)
				TriggerVoiceEvent(event)
			end
		end
	end

	modapiext.events.onPawnDamaged:subscribe(ffrg_onPawnDamaged)
	modapiext.events.onSkillStart:subscribe(ffrg_onSkillStart3)
	modapiext.events.onFinalEffectStart:subscribe(ffrg_onFinalEffectStart3)
	modapiext.events.onSkillEnd:subscribe(ffrg_onSkillEnd3)
	modapiext.events.onFinalEffectEnd:subscribe(ffrg_onFinalEffectEnd3)

end
