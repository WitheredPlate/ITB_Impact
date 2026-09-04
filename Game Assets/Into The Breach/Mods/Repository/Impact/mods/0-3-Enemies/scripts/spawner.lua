local archiveList = easyEdit.enemyList:get("archive")
local rstList = easyEdit.enemyList:get("rst")
local pinnacleList = easyEdit.enemyList:get("pinnacle")
local detritusList = easyEdit.enemyList:get("detritus")
local archiveBossList = easyEdit.bossList:get("archive")
local rstBossList = easyEdit.bossList:get("rst")
local pinnacleBossList = easyEdit.bossList:get("pinnacle")
local detritusBossList = easyEdit.bossList:get("detritus")

local function myriadAddEnemy(enemy, category, config)
    config = config or {}
    config.leader = config.leader or false
    archiveList:addEnemy(enemy, category)
    rstList:addEnemy(enemy, category)
    pinnacleList:addEnemy(enemy, category)
    detritusList:addEnemy(enemy, category)
    if config.lock then
        IslandLocks[enemy] = config.lock
    end
    if config.leader then
        archiveBossList:addBoss("Mission_"..enemy.."Boss")
        rstBossList:addBoss("Mission_"..enemy.."Boss")
        pinnacleBossList:addBoss("Mission_"..enemy.."Boss")
        detritusBossList:addBoss("Mission_"..enemy.."Boss")
        BossesList[enemy.."Boss"] = true
        if config.leaderLock then
            IslandLocks["Mission_"..enemy.."Boss"] = config.leaderLock
        end
    end
end

myriadAddEnemy("ffrg_Bomberbug", "Core", {leader = true, lock = 2, leaderLock = 2})
myriadAddEnemy("ffrg_Caterpillar", "Unique", {leader = true, lock = 3, leaderLock = 4})
myriadAddEnemy("ffrg_Snowshred", "Bots")

ffrg_SpawnController.AppendSpawner("ffrg_Bomberbug",true,2)
ffrg_SpawnController.AppendSpawner("ffrg_Caterpillar",false,1)
ffrg_SpawnController.AppendSpawner("ffrg_Snowshred",true,2)

ffrg_SpawnController.AppendBoomBots("ffrg_Snowshred1_Boom")

ffrg_SpawnController.AddBasicExclusion("multihit", {"ffrg_Bomberbug", "ffrg_Caterpillar", "ffrg_Snowshred"})
ffrg_SpawnController.ExclusionTail("webbers", "ffrg_Caterpillar", false)
