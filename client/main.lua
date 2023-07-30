
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('cynio:useItem')
AddEventHandler('cynio:useItem', function(itemName)
  ESX.CloseContext()

  if itemName == 'vicodin' then
       TriggerEvent("mythic_progbar:client:progress", {
        name = "meds3",
        duration = 1000,
        label = "Zazywasz vicodin",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_player_intdrink",
            anim = "loop_bottle",
        },
        prop = {
            model = "ng_proc_drug01a002",
        }
    }, function(status)
        if not status then
            TriggerEvent('cynio:heal', 'big', true)
			ESX.ShowNotification(TranslateCap('used_vicodin'))
    end
   end)
  elseif itemName == 'gauze' then
       TriggerEvent("mythic_progbar:client:progress", {
        name = "meds",
        duration = 5000,
        label = "Opatrujesz rany",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@heists@narcotics@funding@gang_idle",
            anim = "gang_chatting_idle01",
        },
        prop = {
            model = "ng_proc_drug01a002",
        }
    }, function(status)
        if not status then
            TriggerEvent('cynio:heal', 'small', true)
			ESX.ShowNotification(TranslateCap('used_gauze'))
        end
    end)            

  elseif itemName == 'morphine' then
       TriggerEvent("mythic_progbar:client:progress", {
        name = "meds2",
        duration = 1000,
        label = "Zazywasz morfine",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_player_intdrink",
            anim = "loop_bottle",
        },
        prop = {
            model = "ng_proc_drug01a002",
        }
    }, function(status)
        if not status then
            TriggerEvent('cynio:heal', 'medium', true)
			ESX.ShowNotification(TranslateCap('used_morphine'))
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
end
end)
