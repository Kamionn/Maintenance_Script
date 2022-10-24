function GetIdentifier(player)
    for _,v in pairs(GetPlayerIdentifiers(player)) do
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
	print('                                                             ')
	print('The resource ^4' .. resourceName .. '^0 has been ^4started ^0')
	print('                                                             ')
	print('               Create by ^4Kamion#1323^0                     ')
	print('                                                             ')
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local _src = source
		if Config.Status then
			local player, isAllowed = GetIdentifier(_src), false
				deferrals.defer()
				Citizen.Wait(2000)
				deferrals.update(Language.Country[Config.Locale]['Status'])
				Citizen.Wait(2500)
				deferrals.update(Language.Country[Config.Locale]['Verif'])
				Citizen.Wait(2500)
			for k,v in pairs(Config.AllowedIDs) do
				if player == v then
					isAllowed = true
					deferrals.update(Language.Country[Config.Locale]['BypassOn'])
					Citizen.Wait(2500)
					deferrals.done()
					break
				end
			end
			if not isAllowed then
				deferrals.update(Language.Country[Config.Locale]['BypassOff'])
			end
		end
end)
