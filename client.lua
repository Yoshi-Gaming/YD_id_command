-- Notification for /id command
RegisterNetEvent('showNotification')
AddEventHandler('showNotification', function(message)
    -- Use native FiveM notification
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, true)
end)

-- Display 3D text for /ids command
RegisterNetEvent('showNearbyIDs')
AddEventHandler('showNearbyIDs', function(nearbyPlayers)
    for _, player in ipairs(nearbyPlayers) do
        local playerId = player.id
        local playerCoords = player.coords

        -- Show ID above player's head
        local displayTime = 10 * 1000 -- 10 seconds
        Citizen.CreateThread(function()
            local startTime = GetGameTimer()
            while GetGameTimer() - startTime < displayTime do
                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z + 1.0, "ID: " .. playerId)
                Citizen.Wait(0)
            end
        end)
    end
end)

-- Function to draw 3D text
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
