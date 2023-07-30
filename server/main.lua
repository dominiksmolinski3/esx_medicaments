local playersHealing = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


RegisterNetEvent('cynio:removeItem')
AddEventHandler('cynio:removeItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)

	if item == 'gauze' then
		xPlayer.showNotification(TranslateCap('used_bandage'))
	elseif item == 'vicodin' then
		xPlayer.showNotification(TranslateCap('used_medkit'))
	elseif item == 'morphine' then
		xPlayer.showNotification(TranslateCap('used_morphine'))
	end
end)



ESX.RegisterUsableItem('morphine', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('morphine', 1)

		playersHealing[source] = true
		TriggerClientEvent('cynio:useItem', source, 'morphine')

		Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('vicodin', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('vicodin', 1)

		playersHealing[source] = true
		TriggerClientEvent('cynio:useItem', source, 'vicodin')

		Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('gauze', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('gauze', 1)

		playersHealing[source] = true
		TriggerClientEvent('cynio:useItem', source, 'gauze')

		Wait(10000)
		playersHealing[source] = nil
	end
end)


RegisterNetEvent('cynio:heal')
AddEventHandler('cynio:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('cynio:heal', target, type)
	end)
	