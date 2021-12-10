ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end  
end)

----------------------------- Location ------------------------------------

local location = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Location Véhicule" },
    Data = { currentMenu = "Liste des véhicules :", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
         
            if btn.name == "Issi" then   
                TriggerServerEvent('buyauto')
                spawncar("issi2")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~véhicule ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_CARSITE", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_CARSITE", 1)
            elseif btn.name == "Scooter" then
                TriggerServerEvent('buyscoot')
                spawncar("faggio")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~moto ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_CARSITE", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_CARSITE", 1)
            elseif btn.name == "Cruiser" then 
                TriggerServerEvent('buycruiser')
                spawncar("cruiser")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~vélo ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_CARSITE", 1)
            elseif btn.name == "~r~Fermer le Menu" then   
                CloseMenu(true)
            end 
    end,
},
    Menu = {
        ["Liste des véhicules :"] = {
            b = {
                {name = "Panto", ask = '~g~150$', askX = true},
                {name = "Scooter", ask = '~g~150$', askX = true},
                {name = "Cruiser", ask = '~g~25$', askX = true},
                {name = "~r~Fermer le Menu", ask = '', askX = true},
            }
        }
    }
} 

function spawncar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)   
    end


    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, -1044.11, -2673.80, 13.97, 321.85, true, false)
    SetEntityAsNoLongerNeeded(vehicle) 
    SetVehicleNumberPlateText(vehicle, "LOCATION")
end 

local loc = { 
    {x = -1052.40, y = -2663.12, z = 13.83}
}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(loc) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, loc[k].x, loc[k].y, loc[k].z)
            if dist <= 1.5 then
                DrawMarker(23, -1052.40, -2663.12, 13.83-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2, 1.2, 0, 0, 255, 255, 0, 0, 2, 1, nil, nil, 0)
                ESX.ShowHelpNotification("Appuyez sur ~g~E~s~ pour voir les véhicules")
                if IsControlJustPressed(1,38) then 			
                    CreateMenu(location)
         end end end end end)

-- Blips

Citizen.CreateThread(function()

	local blip = AddBlipForCoord(-1052.40, -2663.12, 13.83)
  
	SetBlipSprite (blip, 77) -- Model du blip
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.6) -- Taille du blip
	SetBlipColour (blip, 38) -- Couleur du blip
	SetBlipAsShortRange(blip, true)
  
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('~p~Armurie')
	EndTextCommandSetBlipName(blip)
  end)
