local Framework = nil

-- Detect the running framework
CreateThread(function()
    if GetResourceState('es_extended') == 'started' then
        Framework = 'ESX'
        print('[Framework Detected]: ESX')
    elseif GetResourceState('qb-core') == 'started' then
        Framework = 'QBCore'
        print('[Framework Detected]: QBCore')
    elseif GetResourceState('vrp') == 'started' then
        Framework = 'vRP'
        print('[Framework Detected]: vRP')
    else
        Framework = 'NONE'
        print('[Framework Detected]: No recognized framework detected. Running in standalone mode.')
    end
end)

-- Command 1: /id
RegisterCommand("id", function(source, args, rawCommand)
    local playerId = source
    TriggerClientEvent('showNotification', source, 'Your ID is: ' .. playerId)
end, false)

-- Command 2: /ids
RegisterCommand("ids", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local nearbyPlayers = {}

    for _, playerId in ipairs(GetPlayers()) do
        local targetPed = GetPlayerPed(playerId)
        local targetCoords = GetEntityCoords(targetPed)

        if #(playerCoords - targetCoords) <= Config.Radius then
            table.insert(nearbyPlayers, {id = playerId, coords = targetCoords})
        end
    end

    TriggerClientEvent('showNearbyIDs', source, nearbyPlayers)
end, false)
