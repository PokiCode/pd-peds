PD = {}




RegisterServerEvent('pd-peds:hasPermissions') -- Register Event
AddEventHandler('pd-peds:hasPermissions', function() -- Add code to the event

    if IsPlayerAceAllowed(source, Config.DefaultPedPerm) then -- More simple and more efficient
        return true
    else
        return false
    end
end) -- End of event
