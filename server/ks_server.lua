local function Debug(...)
    if Config.Debug then
        local message = table.concat({...}, " ")
        local coloredMessage = "^3[DEBUG] " .. message .. "^0" -- Use ^5 for green color and ^0 to reset the color
        print(coloredMessage)
    end
end

function GetIdentifier(player)
    for _, v in pairs(GetPlayerIdentifiers(player)) do
        if string.match(v, 'license:') then
            return v
        end
    end
    return ''
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    Debug('                                                             ')
    Debug('The resource ^4' .. resourceName .. '^0 has been ^4started ^0')
    Debug('                                                             ')
    Debug('               Created by ^4Kamion#1323^0                     ')
    Debug('                                                             ')
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local _src = source
    if Config.Status then
        local player, isAllowed = GetIdentifier(_src), false
        deferrals.defer()
        Citizen.Wait(2000)
        deferrals.update(Language.Country[Config.Locale]['Status'])
        Debug("Debug: Verification in progress for player " .. name) -- Added a debug print
        Citizen.Wait(2500)
        deferrals.update(Language.Country[Config.Locale]['Verif'])
        Debug("Debug: Identity verification for player " .. name) -- Added a debug print
        Citizen.Wait(2500)
        for k, v in pairs(Config.AllowedIDs) do
            if player == v then
                isAllowed = true
                deferrals.update(Language.Country[Config.Locale]['BypassOn'])
                Debug("Debug: Player " .. name .. " is allowed to pass.") -- Added a debug print
                Citizen.Wait(2500)
                deferrals.done()
                break
            end
        end
        if not isAllowed then
            deferrals.update(Language.Country[Config.Locale]['BypassOff'])
            Debug("Debug: Player " .. name .. " is not allowed to pass.") -- Added a debug print
        end
    end
end)
