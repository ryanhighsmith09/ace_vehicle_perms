local lastVehicle = nil

CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then
            lastVehicle = nil
            goto continue
        end

        local vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle == lastVehicle then
            goto continue
        end

        lastVehicle = vehicle

        if GetPedInVehicleSeat(vehicle, -1) ~= ped then
            goto continue
        end

        local model = GetEntityModel(vehicle)
        local name = GetDisplayNameFromVehicleModel(model):lower()

        local ace = Config.Vehicles[name]
        if not ace then
            goto continue
        end

        if not IsPlayerAceAllowed(PlayerId(), ace) then
            TaskLeaveVehicle(ped, vehicle, 16)

            if Config.DeleteVehicle then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end

            TriggerEvent('chat:addMessage', {
                args = { '^1ACCESS DENIED', Config.DenyMessage }
            })
        end

        ::continue::
    end
end)
