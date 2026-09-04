ffrg_CoordinatedStrike = Skill:new{
    Name = "TBA",
    Description = "TBA",
    AircraftArt = "",
    AircraftSound = "",
    Damage = 0,
    Repair = 0,
    Supply = false
}

function ffrg_CoordinatedStrike:GetTargetArea(point)
	local ret = PointList()

	local board_size = Board:GetSize()
	local repaired_units = {}
	for i = 0, board_size.x - 1 do
		for j = 0, board_size.y - 1  do
			if Board:IsPawnTeam(Point(i,j),TEAM_PLAYER) then
				local pawn_id = Board:GetPawn(Point(i,j)):GetId()
				if not repaired_units[pawn_id] then
					ret:push_back(Point(i,j))
					repaired_units[pawn_id] = true
				end
			end
		end
	end

	return ret
end

function ffrg_CoordinatedStrike:GetSkillEffect(p1,p2)
    local targets = self:GetTargetArea(point)
    local toggle = 1
    local timer = 0
    local counter = 0
    local ret = SkillEffect()
    local size = targets:size()
    local strikeTiming = {}
    local dropTiming = {}
    local delayFactor = 0.13
    local delayFlight = 3

    ret:AddSound(self.AircraftSound)

    for i = 1, size do
        table.insert(dropTiming,((i-1)))
        if toggle == 1 then
            table.insert(strikeTiming,dropTiming[i]-(targets:index(i).x)-delayFlight)
            toggle = -1
        else
            table.insert(strikeTiming,dropTiming[i]-(targets:index(i).y)-delayFlight)
            toggle = 1
        end
    end

    local highestDiff = 0
    for i,timing in ipairs(strikeTiming) do
        highestDiff = math.min(highestDiff,timing)
    end
    for i = 1, size do
        strikeTiming[i] = strikeTiming[i]-highestDiff
        dropTiming[i] = dropTiming[i]-highestDiff
    end

    while counter < size and timer < 50 do
        toggle = 1
        for i,timing in ipairs(strikeTiming) do
            if timing == timer then
                counter = counter + 1
                ret:AddScript(string.format("ffrg_CoordinatedStrike:AddStrike(%s,%s,%s,\""..self.AircraftArt.."\")", timer*delayFactor, targets:index(i):GetString(), toggle))
            end
            toggle = toggle*-1
        end
        timer = timer + 1
    end

    timer = 0
    counter = 0

    while counter < size and timer < 50 do
        for i,timing in ipairs(dropTiming) do
            if timing == timer then
                counter = counter + 1
                if self.Repair > 0 then
                    ret:AddDamage(SpaceDamage(targets:index(i),self.Repair*-1))
                else
                    ret:AddDamage(SpaceDamage(targets:index(i),self.Damage))
                end
                if self.Supply then
                    if self.Repair > 0 then
                        ffrg_Supply.Supply(p1,targets:index(i),ret,{repair = self.Repair, callerPrevent = tostring(self)})
                    else
                        ffrg_Supply.Supply(p1,targets:index(i),ret,{callerPrevent = tostring(self)})
                    end
                end
            end
        end
        timer = timer + 1
        ret:AddDelay(delayFactor)
    end

	return ret
end

function ffrg_CoordinatedStrike:AddStrike(delay,point,toggle,art)
    local ret = SkillEffect()
    if delay > 0 then
        ret:AddDelay(delay)
    end
    if toggle == 1 then
        ret:AddAirstrike(point,art)
    else
        ret:AddReverseAirstrike(point,art)
    end
    Board:AddEffect(ret)
end
