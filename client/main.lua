
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	refreshBlips()
end)

RegisterNetEvent('cynio:useItem')
AddEventHandler('cynio:useItem', function(itemName)
  ESX.CloseContext()

  if itemName == 'vicodin' then
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' 
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
      RemoveAnimDict(lib)

      Wait(500)
      while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
        Wait(0)
        DisableAllControlActions(0)
      end
      TriggerEvent('cynio:heal', 'big', true)
      ESX.ShowNotification(TranslateCap('used_vicodin'))
    end)

  elseif itemName == 'gauze' then
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
      RemoveAnimDict(lib)

      Wait(500)
      while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
        Wait(0)
        DisableAllControlActions(0)
      end

      TriggerEvent('cynio:heal', 'small', true)
      ESX.ShowNotification(TranslateCap('used_gauze'))
    end)
  elseif itemName == 'morphine' then
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
      RemoveAnimDict(lib)

      Wait(500)
      while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
        Wait(0)
        DisableAllControlActions(0)
      end

      TriggerEvent('cynio:heal', 'medium', true)
      ESX.ShowNotification(TranslateCap('used_morphine'))
    end)
  end
end)

RegisterNetEvent('cynio:heal')
AddEventHandler('cynio:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	elseif healType == 'medium' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 4))
		SetEntityHealth(playerPed, newHealth)
	end

	if Config.Debug then
		print("[^2INFO^7] Healing Player - ^5" .. tostring(healType) .. "^7")
	end
	if not quiet then
		ESX.ShowNotification(TranslateCap('healed'))
	end
end)



