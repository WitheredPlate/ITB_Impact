local function ffrg_onModsInitialized()
    ffrg_SpawnController.AppendSpawner{
        identifier = "ffrg_Bomberbug",
        category = "Core",
        max_pawns = 2,
        leader = true,
        lock = 2,
        leaderLock = 2
    }
    ffrg_SpawnController.AppendSpawner{
        identifier = "ffrg_Caterpillar",
        category = "Unique",
        max_pawns = 1,
        leader = true,
        lock = 3,
        leaderLock = 4
    }
    ffrg_SpawnController.AppendSpawner{
        identifier = "ffrg_Snowshred",
        weak = true,
        category = "Bots",
        max_pawns = 2,
        boom = true
    }
    ffrg_SpawnController.AddBasicExclusion(
        "multihit",
        {
            "ffrg_Bomberbug",
            "ffrg_Caterpillar",
            "ffrg_Snowshred"

        }
    )
    ffrg_SpawnController.ExclusionTail(
        "webbers",
        "ffrg_Caterpillar",
        false
    )
end
modApi.events.onModsInitialized:subscribe(ffrg_onModsInitialized)

