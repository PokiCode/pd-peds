PD = {}

PD.hasPermission = function() -- hasPermission function
    local identifier = GetPlayerIdentifiers(src) -- Identifier Variable

    identifier = identifier[1] -- Select the first argument on the variable of identifier

    for i, v in pairs(Config.SteamIdList) do -- Select in pairs the steam ids

        if v == identifier then  -- if the v (steam id number) is equal to the identifier variable then..

            return true -- return the if as true

        end -- End of the if v == identifier then 
    end  -- End of for i, v in pairs(PD-Config.SteamIdList) do 

    return false -- Return function as false

end -- End of function

RegisterServerEvent('pd-peds:hasPermissions') -- Register Event
AddEventHandler('pd-peds:hasPermissions', function() -- Add code to the event

    local identifier = GetPlayerIdentifiers(source) -- Identifier variable

    identifier = identifier[1] -- Select the first argument of the identifier variable

    for a, v in pairs(Config.SteamIdList) do -- Select in pairs the list with the steam identifiers

        if v == identifier then -- if the v (steam id number) is equal to the identifier variable then..

            TriggerClientEvent('pd-peds:checkSteamID', source, true) -- Execute Client Side Event with true argument

            return true -- also return true to the if 

        end -- If end
    end -- for end

    return false -- return event as false

end) -- End of event
