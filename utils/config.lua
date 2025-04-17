Config = Config or {}

Config.Robbery = {
    CashBox = {
        {
            name = "shop1",
            coords = vec3(1134.9, -982.4, 46.5),
            size = vec3(0.5, 0.5, 0.25),
            rotation = 9.5,
        },
        {
            name = "shop2",
            coords = vec3(1164.15, -322.75, 69.3),
            size = vec3(0.35, 0.7, 0.5),
            rotation = 10.75,
        },
        {
            name = "shop3",
            coords = vec3(-706.7, -913.55, 19.4),
            size = vec3(0.5, 0.6, 0.25),
            rotation = 0.0,
        },
        {
            name = "shop4",
            coords = vec3(-47.2, -1757.45, 29.55),
            size = vec3(0.7, 0.7, 0.35),
            rotation = 50.0,
        },
        {
            name = "shop5",
            coords = vec3(25.0, -1347.25, 29.3),
            size = vec3(0.5, 0.5, 1.0),
            rotation = 0.0,
        },
        {
            name = "shop6",
            coords = vec3(-1486.75, -378.45, 40.25),
            size = vec3(0.5, 0.4, 0.5),
            rotation = 45.0,
        },
        {
            name = "shop7",
            coords = vec3(-2967.05, 390.95, 15.2),
            size = vec3(0.4, 0.5, 0.4),
            rotation = 0.25,
        },
        {
            name = "shop8",
            coords = vec3(-3041.1, 585.05, 8.0),
            size = vec3(0.5, 0.5, 0.5),
            rotation = 22.5,
        },
        {
            name = "shop9",
            coords = vec3(-3242.2, 1000.5, 13.0),
            size = vec3(0.5, 0.6, 0.4),
            rotation = 0.0,
        },
        {
            name = "shop10",
            coords = vec3(-1820.6, 793.9, 138.3),
            size = vec3(0.5, 0.7, 0.6),
            rotation = 40.0,
        },
        {
            name = "shop11",
            coords = vec3(373.0, 326.25, 103.75),
            size = vec3(0.45, 0.45, 0.3),
            rotation = 75.0,
        },
        {
            name = "shop12",
            coords = vec3(1166.0, 2710.1, 38.25),
            size = vec3(0.55, 0.55, 0.35),
            rotation = 0.0,
        },
        {
            name = "shop13",
            coords = vec3(548.5, 2671.25, 42.15),
            size = vec3(0.55, 0.5, 0.7),
            rotation = 0.0,
        },
        {
            name = "shop14",
            coords = vec3(2678.25, 3279.85, 55.5),
            size = vec3(0.5, 0.5, 0.5),
            rotation = 65.0,
        },
        {
            name = "shop15",
            coords = vec3(1960.55, 3740.3, 32.3),
            size = vec3(0.4, 0.45, 0.8),
            rotation = 27.5,
        },
        {
            name = "shop16",
            coords = vec3(1698.4, 4923.35, 42.1),
            size = vec3(0.5, 0.8, 0.5),
            rotation = 55.0,
        },
        {
            name = "shop17",
            coords = vec3(1728.3, 6414.95, 35.25),
            size = vec3(0.4, 0.55, 0.3),
            rotation = 340.5,
        },
    },
    BanFunction = function(source)
        if not source then
            return
        end

        -- DropPlayer(source, "[CY_SHOPROBBERY] you are banned from this server")
    end,
    Duration = 2000,              -- Duration in ms
    MoneyAmount = { 1000, 5000 }, -- min, max
    Cooldown = 120,               -- Cooldown in seconds
    Police = 3,                   -- min Police amount
}
