local stealer = {}
local robberedShops = {}
local configData = Config.Robbery

--- Checking if the player is in the area of the cash box or even its exist
--- @param playerCoords vector3
--- @param data table
local function isDataValid(playerCoords, data)
    for i = 1, #configData.CashBox do
        if #(configData.CashBox[i].coords - data.coords) > 15.0 and #(playerCoords - configData.CashBox[i].coords) > 15.0 then
            return true
        end
    end

    return false
end

RegisterNetEvent('cy_shoprobbery:server:startRobbery', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    assert(xPlayer, 'xPlayer not found')
    assert(data, 'Data not found')

    local player = GetPlayerPed(_source)
    local weapon = GetCurrentPedWeapon(player)

    if weapon == -1569615261 then
        TriggerClientEvent('ox_lib:notify', _source, {
            type = 'error',
            title = 'Error',
            description = 'You cannot rob the cash register without a weapon',
            duration = 2500
        })
        return
    end

    local playerCoords = GetEntityCoords(player)

    if not isDataValid(playerCoords, data) then
        configData.BanFunction(_source)
        return
    end

    if #(playerCoords - data.coords) > 10.0 then
        configData.BanFunction(_source)
        return
    end

    if stealer[_source] then
        configData.BanFunction(_source)
        return
    end

    if xPlayer.getJob().name == 'police' then
        TriggerClientEvent('ox_lib:notify', _source, {
            type = 'error',
            title = 'Error',
            description = 'You cannot rob the cash register as a police officer',
            duration = 2500
        })
        return
    end

    local polices = #ESX.GetExtendedPlayers('job', 'police')

    if polices < configData.Police then
        TriggerClientEvent('ox_lib:notify', _source, {
            type = 'error',
            title = 'Error',
            description = 'There are not enough police officers online',
            duration = 2500
        })
        return
    end

    if robberedShops[data.name] then
        if os.time() - robberedShops[data.name].time < configData.Cooldown then
            TriggerClientEvent('ox_lib:notify', _source, {
                type = 'error',
                title = 'Error',
                description = 'Someone has already robbed this cash register, please wait a moment',
                duration = 2500
            })
            return
        end
    end

    stealer[_source] = {
        shop = data.name,
        coords = data.coords,
        time = os.time()
    }

    TriggerClientEvent('cy_shoprobbery:client:startRobbery', _source, data)
end)

RegisterNetEvent('cy_shoprobbery:server:robberySuccess', function(data)
    local _source = source

    assert(data, 'Data not found')

    assert(stealer[_source], 'Stealer not found')


    if data.name ~= stealer[_source].shop then
        configData.BanFunction(_source)
        return
    end

    local player = GetPlayerPed(_source)

    if #(GetEntityCoords(player) - stealer[_source].coords) > 10.0 then
        configData.BanFunction(_source)
        return
    end

    if stealer[_source] and os.time() - stealer[_source].time < (configData.Duration / 1000) then
        configData.BanFunction(_source)
        return
    end

    stealer[_source] = nil

    robberedShops[data.name] = {
        time = os.time(),
        coords = data.coords
    }

    math.randomseed(os.time())
    local cashAmount = configData.MoneyAmount
    local cash = math.random(cashAmount[1], cashAmount[2])

    exports.ox_inventory:AddItem(_source, 'money', cash)
    TriggerClientEvent('ox_lib:notify', _source, {
        type = 'success',
        title = 'Success',
        description = 'You successfully robbed the cash register and stole ' .. cash .. '$',
        duration = 2500
    })
end)

AddEventHandler('playerDropped', function()
    local _source = source

    if stealer[_source] then
        stealer[_source] = nil
    end
end)
