
-- Makes the logic between different vanilla charge attacks consistent.
-- Units with flying or massive can charge over liquids
-- Units with flying can charge over chasms.
-- Units can never charge through entities unless the charge specifically allows it.
-- Defined charges (such as Hermes Engines) cannot charge onto impassable tiles.
-- Reckless charges (such as Ramming Engines) will charge directly onto any impassable tiles and fail to activate their ram effect.

if ffrg_impact_tweaks_charge_adjustments then
	Brute_Beetle.Fly = 0

	function Brute_Beetle:GetTargetArea(point)
		local ret = PointList()
		for i = DIR_START, DIR_END do
			for k = 1, 7 do
				local curr = DIR_VECTORS[i]*k + point
				if Board:IsValid(curr) then
					ret:push_back(curr)
				else
					break
				end
				if Board:IsBlocked(curr,Pawn:GetPathProf()) then
					break
				end
			end
		end

		return ret
	end

	function Brute_Beetle:GetSkillEffect(p1,p2)
		local ret = SkillEffect()
		local direction = GetDirection(p2 - p1)

		local pathing = PATH_PROJECTILE
		if self.Fly == 0 then pathing = Pawn:GetPathProf() end

		local doDamage = true
		local target = GetProjectileEnd(p1,p2,pathing)
		local distance = p1:Manhattan(target)

		if not Board:IsBlocked(target,pathing) then -- dont attack an empty edge square, just run to the edge
			doDamage = false
			target = target + DIR_VECTORS[direction]
		end

		if not Board:IsPawnSpace(target) and (Board:GetTerrain(target) == TERRAIN_WATER or Board:GetTerrain(target) == TERRAIN_ACID or Board:GetTerrain(target) == TERRAIN_LAVA or Board:GetTerrain(target) == TERRAIN_HOLE) then
			doDamage = false
			target = target + DIR_VECTORS[direction]
		end

		if self.BackSmoke == 1 then
			local smoke = SpaceDamage(p1 - DIR_VECTORS[direction], 0)
			smoke.iSmoke = 1
			ret:AddDamage(smoke)
		end

		local damage = SpaceDamage(target, self.Damage, direction)
		damage.sAnimation = "ExploAir2"
		damage.sSound = self.ImpactSound

		if distance == 1 and doDamage then
			ret:AddMelee(p1,damage, NO_DELAY)
			if doDamage then ret:AddDamage(SpaceDamage( target - DIR_VECTORS[direction] , self.SelfDamage)) end
		else
			ret:AddCharge(Board:GetSimplePath(p1, target - DIR_VECTORS[direction]), NO_DELAY)--FULL_DELAY)

			local temp = p1
			while temp ~= target  do
				ret:AddBounce(temp,-3)
				temp = temp + DIR_VECTORS[direction]
				if temp ~= target then
					ret:AddDelay(0.06)
				end
			end

			if doDamage then
				ret:AddDamage(damage)
				ret:AddDamage(SpaceDamage( target - DIR_VECTORS[direction] , self.SelfDamage))
			end

		end


		return ret
	end

	modApi:setText("Brute_Beetle_Description", "Charge in a line and ram into the target, damaging and pushing the target while damaging self.")


	BeetleAtkB.Fly = false

	function BeetleAtk1:GetSkillEffect(p1,p2)
		local ret = SkillEffect()
		local direction = GetDirection(p2 - p1)

		local pathing = Pawn:GetPathProf()
		if self.Fly then pathing = PATH_PROJECTILE end

		local target = GetProjectileEnd(p1,p2,pathing)

		local doDamage = true

		if not Board:IsBlocked(target,pathing) then
			doDamage = false
			target = target + DIR_VECTORS[direction]
		end

		if not Board:IsPawnSpace(target) and (Board:GetTerrain(target) == TERRAIN_WATER or Board:GetTerrain(target) == TERRAIN_HOLE) then ---run into water/hole and die!
			doDamage = false
			target = target + DIR_VECTORS[direction]
		end

		local delay = self.Fire and NO_DELAY or FULL_DELAY
		ret:AddQueuedCharge(Board:GetSimplePath(p1, target - DIR_VECTORS[direction]), delay)

		if self.Fire then
			local i = p1
			while i ~= target - DIR_VECTORS[direction] do
				damage = SpaceDamage(i,0)
				damage.iFire = 1
				damage.fDelay = 0.1
				ret:AddQueuedDamage(damage)
				i = i + DIR_VECTORS[direction]
			end
		end

		if doDamage then
			damage = SpaceDamage(target, self.Damage, direction)
			damage.sAnimation = "ExploAir2"
			damage.sSound = "/enemy/beetle_1/attack_impact"
			ret:AddQueuedDamage(damage)
		end

		return ret
	end

	BeetleAtk2.GetSkillEffect = BeetleAtk1.GetSkillEffect
	BeetleAtkB.GetSkillEffect = BeetleAtk1.GetSkillEffect

	function Brute_KickBack:GetTargetArea(point)
		local ret = PointList()

		for i = DIR_START, DIR_END do
			for k = self.MinMove, self.Range do
				if not Board:IsBlocked(DIR_VECTORS[i]*k + point, Pawn:GetPathProf()) then
					ret:push_back(DIR_VECTORS[i]*k + point)
				else
					break
				end
			end
		end

		return ret
	end
end
