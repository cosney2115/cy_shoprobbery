local configData = Config.Robbery

for i = 1, #configData.CashBox do
    local data = configData.CashBox[i]

    exports.ox_target:addBoxZone({
        name = data.name,
        coords = data.coords,
        size = data.size,
        rotation = data.rotation,
        options = {
            {
                name = "shop_" .. i,
                label = "Rob the cash box",
                icon = "fas fa-money-bill-wave",
                onSelect = function(data)
                    --- u can use ure minigame

                    local success = lib.skillCheck({ 'easy', 'easy', { areaSize = 60, speedMultiplier = 2 }, 'hard' },
                        { 'w', 'a', 's', 'd' })

                    if not success then
                        lib.notify({
                            type = "error",
                            title = "Failed",
                            description = "You failed to rob the cash box",
                            duration = 2500
                        })
                        return
                    end

                    TriggerServerEvent("cy_shoprobbery:server:startRobbery", data)
                end
            }
        }
    })
end

RegisterNetEvent('cy_shoprobbery:client:startRobbery', function(data)
    assert(data, 'Data not found')

    if lib.progressBar({
            duration = configData.Duration,
            label = 'Rob the cash box',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = 'oddjobs@shop_robbery@rob_till',
                clip = 'loop'
            },
        })
    then
        TriggerServerEvent("cy_shoprobbery:server:robberySuccess", data)
        return
    end

    lib.notify({
        type = "info",
        title = "Interrupted",
        description = "Robbery of the cash box interrupted",
        duration = 2500
    })
end)
