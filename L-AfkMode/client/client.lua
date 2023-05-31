ESX = nil
afkmode = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand('afk', function(source, args, rawCommand)
    if afkmode == false then
        afk = not afk
        if afk then
            ESX.ShowNotification(("je bent in ~r~afk mode"))
            SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), true)
            SetEntityAlpha(GetPlayerPed(-1), 190)
        else
            ESX.ShowNotification(("je bent niet meer in ~r~afk mode"))
            SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), false)
            SetEntityAlpha(GetPlayerPed(-1), 255)
            afkmode = true
            Wait(Config.Time)
            afkmode = false
        end
    end

    if afkmode == true then
        ESX.ShowNotification(("Je moet ~r~5min~s~ wachten..."))
    end

end)