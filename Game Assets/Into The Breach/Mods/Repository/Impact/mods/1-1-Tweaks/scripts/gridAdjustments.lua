if ffrg_impact_tweaks_grid_adjustments then
    getCityPower_old = getCityPower

    function getCityPower(sector)

        if GAME.ffrg_maxGridBonus then
            return getCityPower_old(sector) + GAME.ffrg_maxGridBonus
        end
        return getCityPower_old(sector)
    end

    modApi:setText("TipText_PowerGrid", "You LOSE if this reaches zero. \n\nReduced every time a Powered Building is damaged in combat. \n\nIncreased through Objectives and Reputation Acquisitions. \n\nMaximum is increased by 1 at the start of each Corporate Island.")

    local ffrg_onMissionEnd = function(mission)
        if mission.BossPawn and GAME.ffrg_maxGridBonus then
            GAME.ffrg_maxGridBonus = GAME.ffrg_maxGridBonus + 1
        elseif mission.BossPawn then
            GAME.ffrg_maxGridBonus = 1
        end
    end

    modApi.events.onMissionEnd:subscribe(ffrg_onMissionEnd)

    getBuildingHealth_old = getBuildingHealth

    function getBuildingHealth(ignore)
        local chances = getBuildingHealth_old(ignore)
        local category = Game:GetSector() or 0
        category = category + GetDifficulty()
        if category == 1 then
            return {80, 20, 0, 0}
        elseif category == 2 then
            return {60, 40, 0, 0} -- +20
        elseif category == 3 then
            return {40, 60, 0, 0} -- +20
        elseif category == 4 then
            return {40, 40, 20, 0} -- +20
        elseif category == 5 then
            return {30, 40, 30, 0} -- +20
        elseif category == 6 then
            return {30, 30, 20, 20} -- +30
        elseif category == 7 then
            return {20, 20, 30, 30} -- +40
        elseif category == 8 then
            return {20, 20, 30, 30}
        else
            return chances
        end
    end
end
