ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyauto')
AddEventHandler('buyauto', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 150
    xPlayer.removeMoney(150)
end)

RegisterNetEvent('buyscoot')
AddEventHandler('buyscoot', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 150
    xPlayer.removeMoney(150)
end)

RegisterNetEvent('buybmx')
AddEventHandler('buycruiser', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    xPlayer.removeMoney(25)
end)