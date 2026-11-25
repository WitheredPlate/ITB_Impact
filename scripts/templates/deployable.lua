if not ffrg_DeployableBase then
    ffrg_DeployableBase = Skill:new{
        Name = "TBA",
        Description = "TBA",
        Class = "",
        Deployed = "", -- Deployed Unit
        Anim = "", -- Deploying Animation
        AnimLength = 1.12, -- Length of ^
        WhirrSound = "mech/prime/bottlecap_mech/death",
        TwoClick = false, -- Double Deploy?
        DoubleDelay = 0.4 -- Delay Between Doubles. Must be less than AnimLength
    }

    function ffrg_DeployableBase:GetTargetArea(point)
        local ret = PointList()
        for i = 0, 3 do
            curr = point+DIR_VECTORS[i]
            if Board:IsValid(curr) and not Board:IsBlocked(curr,PATH_GROUND) then
                ret:push_back(curr)
            end
        end
        return ret
    end

    function ffrg_DeployableBase:GetSkillEffect(p1,p2)
        local ret = SkillEffect()
        local anim = SpaceDamage(p2,0)
        local damage = SpaceDamage(p2,0)
        damage.sPawn = self.Deployed
        anim.sAnimation = self.Anim
        anim.sSound = self.WhirrSound
        ret:AddMelee(p1,anim,NO_DELAY)
        ret:AddDelay(self.AnimLength+0.2)
        ret:AddDamage(damage)
        return ret
    end

    function ffrg_DeployableBase:IsTwoClickException(p1,p2)
        local counter = 0
        for i = 0, 3 do
            curr = p1+DIR_VECTORS[i]
            if Board:IsValid(curr) and not Board:IsBlocked(curr,PATH_GROUND) then
                counter = counter + 1
            end
        end
        if counter > 1 then return false end
        return true
    end

    function ffrg_DeployableBase:GetSecondTargetArea(p1,p2)
        local ret = PointList()
        for i = 0, 3 do
            curr = p1+DIR_VECTORS[i]
            if curr ~= p2 and Board:IsValid(curr) and not Board:IsBlocked(curr,PATH_GROUND) then
                ret:push_back(curr)
            end
        end
        return ret
    end

    function ffrg_DeployableBase:GetFinalEffect(p1,p2,p3)
        local ret = SkillEffect()
        local damage = SpaceDamage(p2,0)
        local anim = SpaceDamage(p2,0)
        damage.sPawn = self.Deployed
        anim.sSound = self.WhirrSound
        anim.sAnimation = self.Anim
        local damage2 = SpaceDamage(p3,0)
        local anim2 = SpaceDamage(p3,0)
        damage2.sPawn = self.Deployed
        anim2.sSound = self.WhirrSound
        anim2.sAnimation = self.Anim
        ret:AddMelee(p1,anim,NO_DELAY)
        ret:AddDelay(self.DoubleDelay)
        ret:AddMelee(p1,anim2,NO_DELAY)
        ret:AddDelay(self.AnimLength-self.DoubleDelay+0.2)
        ret:AddDamage(damage)
        ret:AddDelay(self.DoubleDelay)
        ret:AddDamage(damage2)
        return ret
    end
end
