
-- Allows vanilla and Impact repair skills to be directed towards any adjacent allies
if ffrg_impact_tweaks_repair_adjustments then
	if Skill_Repair_Orig then
		function Skill_Repair_Orig:GetTargetArea(point)

			local ret = PointList()
			ret:push_back(point)

			for dir = DIR_START, DIR_END do
				curr = point + DIR_VECTORS[dir]
				if Board:IsValid(curr) and Board:IsPawnSpace(curr) and Board:GetPawnTeam(curr) == TEAM_PLAYER then
					ret:push_back(curr)
				end
			end

			return ret
		end
		if ffrg_Repair_Engi then
			ffrg_Repair_Engi.GetTargetArea = Skill_Repair_Orig.GetTargetArea
		end
		Skill_Repair_Power.GetTargetArea = Skill_Repair_Orig.GetTargetArea
	else
		function Skill_Repair:GetTargetArea(point)

			local ret = PointList()
			ret:push_back(point)

			for dir = DIR_START, DIR_END do
				curr = point + DIR_VECTORS[dir]
				if Board:IsValid(curr) and Board:IsPawnSpace(curr) and Board:GetPawnTeam(curr) == TEAM_PLAYER then
					ret:push_back(curr)
				end
			end

			return ret
		end
		if ffrg_Repair_Engi then
			ffrg_Repair_Engi.GetTargetArea = Skill_Repair.GetTargetArea
		end
		Skill_Repair_Power.GetTargetArea = Skill_Repair.GetTargetArea
	end

	Skill_Repair_Power.GetTargetArea = Skill_Repair.GetTargetArea

	function Skill_Repair_Power:GetSkillEffect(p1,p2)
		local ret = SkillEffect()
		local damage = SpaceDamage(p2,self.Amount)
		damage.iFire = EFFECT_REMOVE
		damage.iAcid = EFFECT_REMOVE

		damage.sAnimation = "ExploRepulse1"

		ret:AddDamage(damage)

		if IsPassiveSkill("Mass_Repair") then
			local mechs = extract_table(Board:GetPawns(TEAM_MECH))
			for i,id in pairs(mechs) do
				if Board:GetPawnSpace(id) ~= p2 then
					damage.loc = Board:GetPawnSpace(id)
					ret:AddDamage(damage)
				end
			end
		end

			for i = DIR_START,DIR_END do
				local curr = p2 + DIR_VECTORS[i]
				if curr ~= p1 then
					local spaceDamage = SpaceDamage(curr, 0, i)
					spaceDamage.sAnimation = "airpush_"..i
					ret:AddDamage(spaceDamage)
				end
			end

		return ret
	end
end
