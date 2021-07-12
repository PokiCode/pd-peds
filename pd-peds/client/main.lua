PD = {}

local hasPermissions

Citizen.CreateThread(function() -- Thread for loop

    PD.CheckSteamIdentifier() -- Function of Check the Steam Id

    while true do -- Loop while
        Citizen.Wait(150) -- Wait 60 seconds to do the loop
    end -- End of while

end) -- End of the Thread loop

--[[
    Functions
]]

PD.CheckSteamIdentifier = function() -- Steam Identifier Check Function

    hasPermissions = nil -- Nil value for if he/she has perms to command /setped

    TriggerServerEvent('pd-peds:hasPermissions') -- Server Side Event 

    while (hasPermissions == nil) do -- While he/she has permissions in nil value then
        Citizen.Wait(1) -- Wait 1 second
    end -- End of while

end -- End of Function

--[[
    End Functions
]]

--[[
    Events
]]

RegisterNetEvent('pd-peds:checkSteamID') -- Register a new event
AddEventHandler('pd-peds:checkSteamID', function(state) -- Add Code for the registered event 

    hasPermissions = state -- Has Permissions definition

end) -- End of the Event Handler


--[[
    End Events
]]

--[[
    Commands
]]

RegisterCommand("setped", function(source, args, rawCommand) -- Register command
    if hasPermissions then
        
        local ped = args[1]
        local pedhash = GetHashKey(ped)

        if ped == nil then
            TriggerEvent('chat:addMessage', { -- Chat event
            color = { 255, 0, 0}, -- Color of title
            multiline = true, -- multiline bool
            args = {"PED SYSTEM", "Wrong ped model"} -- text
          })
            print("[ERROR] - [PD-PEDS]: Wrong ped")
        end  
        RequestModel(pedhash)
    
        Citizen.CreateThread(function() 
            while not HasModelLoaded(pedhash)
            do RequestModel(pedhash)
                Citizen.Wait(0)
            end	
            print("[INFO] - [PD-FRAMECORE]: New ped: " .. ped)
            SetPlayerModel(PlayerId(), pedhash)

            TriggerEvent('chat:addMessage', { -- Chat event
            color = { 255, 0, 0}, -- Color of title
            multiline = true, -- multiline bool
            args = {"PED SYSTEM", "Your ped has been changed"} -- text
          })
        end)
    else
        TriggerEvent('chat:addMessage', { -- Chat event
        color = { 255, 0, 0}, -- Color of title
        multiline = true, -- multiline bool
        args = {"PED SYSTEM", "You don't have permission to use this"} -- text
      })
    end
end) -- end of the command

--[[
    End Commands
]]