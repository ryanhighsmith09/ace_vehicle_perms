Config = {}

-- If false, just kick player out instead of deleting vehicle
Config.DeleteVehicle = true

-- Message shown when access denied
Config.DenyMessage = "You are not authorized to drive this vehicle."

-- Vehicle → ACE mapping
-- ACE format: vehicle.<name>
Config.Vehicles = {
    police = "vehicle.police",
    sheriff = "vehicle.sheriff",
    fbi = "vehicle.fbi",
    ambulance = "vehicle.ems",
    firetruk = "vehicle.fire",

    -- Civilian examples
    riot = "vehicle.riot",
    barracks = "vehicle.military"
}
