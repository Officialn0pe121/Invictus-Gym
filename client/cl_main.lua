-- Initialise QBCore
QBCore = exports['qb-core']:GetCoreObject()

local workingout = false
local setfailed = true

local round = function(num)
    return math.floor(num+.5)
end

-- Minigame function

local Minigame = function(skill)
    local ped = PlayerPedId()
    Citizen.Wait(3000)
    exports['ps-ui']:Circle(function(success)
        if success then
            setfailed = false
        else
            setfailed = true
            exports['tnj-notify']:Notify("Set Failed ", "error", 5000)
        end
    end, math.random(2,4), math.random(12, 18)) -- NumberOfCircles, MS
end

local RefreshSkills = function()
    for b,c in pairs(Config.Skills) do
        StatSetInt(c.stat, round(c.current), true)
    end
end

local UpdateSkill = function(skill, quantity, updatetype)
    local amount = Config.Skills[skill].current

        if amount + tonumber(quantity) < 0 then
            Config.Skills[skill].current = 0
        elseif amount + tonumber(quantity) > 100 then
            Config.Skills[skill].current = 100
        else
            Config.Skills[skill].current = Config.Skills[skill].current + tonumber(quantity)
        end
        RefreshSkills()
        if updatetype == "increase" then
            exports['tnj-notify']:Notify(Config.Skills[skill].label.. Config.Lang.skillup, "success", 5000)
        elseif updatetype == "decrease" then
            --exports['tnj-notify']:Notify(Config.Skills[skill].label.. Config.Lang.skilldown, "error", 5000)
        end
        TriggerServerEvent('Invictus-Gym:server:update', Config.Skills)
end

local FetchSkills = function()
    QBCore.Functions.TriggerCallback("Invictus-Gym:server:fetch", function(data)
        if data then
            for status, value in pairs(data) do
                if Config.Skills[status] then
                    Config.Skills[status].current = value.current
                end
            end
        end
        RefreshSkills()
    end)
end

-- Workout Function
local Workout = function(point)
    if Config.Locations[point].type == "Pullups" then
        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "prop_human_muscle_chin_ups", 0, true)
        Minigame("Strength")
        Citizen.Wait(Config.Locations[point]['time'])
        ClearPedTasksImmediately(ped)
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
            UpdateSkill("Strength", Config.GymStrength, "increase")
        end
        workingout = false
        setfailed = true
    elseif Config.Locations[point].type == "Pushups" then

        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "world_human_push_ups", 0, true)
        Minigame("Strength")
        Citizen.Wait(Config.Locations[point]['time'])
        ClearPedTasksImmediately(ped)
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
            UpdateSkill('Strength', Config.GymStrength)
        end
        workingout = false
        setfailed = true
    elseif Config.Locations[point].type == "Situps" then

        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "world_human_sit_ups", 0, true)
        Minigame("Stamina")
        Citizen.Wait(Config.Locations[point]['time'])
        ClearPedTasksImmediately(ped)
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
            UpdateSkill('Stamina', Config.GymStamina, "increase")
        end
        workingout = false
        setfailed = true
    elseif Config.Locations[point].type == "Yoga" then

        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "world_human_yoga", 0, true)
        Minigame("Stamina")
        Citizen.Wait(Config.Locations[point]['time'])
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
            UpdateSkill('Stamina', Config.GymStamina, "increase")
        end
        ClearPedTasksImmediately(ped)
        workingout = false
        setfailed = true
    elseif Config.Locations[point].type == "Weights" then

        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true)
        Minigame("Strength")
        Citizen.Wait(Config.Locations[point]['time'])
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
            UpdateSkill('Strength', Config.GymStrength, "increase")
        end
        ClearPedTasksImmediately(ped)
        workingout = false
        setfailed = true
    elseif Config.Locations[point].type == "Walking" then

        local ped = PlayerPedId()
        ClearPedTasksImmediately(ped)

        SetEntityCoords(ped, vector3(Config.Locations[point]['x'], Config.Locations[point]['y'], Config.Locations[point]['z'] - 1.0))
        SetEntityHeading(ped, Config.Locations[point]['h'])
        workingout = true
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_POWER_WALKER", 0, true)
        Minigame("Stamina")
        Citizen.Wait(Config.Locations[point]['time'])
        if not setfailed then
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.StressReliefMin, Config.StressReliefMax)) -- Relieve Stress cuz its relaxing i guess
        end
        ClearPedTasksImmediately(ped)
        workingout = false
        setfailed = true
    end
end

-- Threads

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent(Config.Framework.Trigger, function(gym)
            QBCore = gym
        end)
        Citizen.Wait(0)
    end

	while true do
		local seconds = 300 * 1000
		Citizen.Wait(seconds)
		for skill, value in pairs(Config.Skills) do
			UpdateSkill(skill, value.removeSec, "decrease")
		end
		TriggerServerEvent("Invictus-Gym:server:update", Config.Skills)
	end
    FetchSkills()
end)

Citizen.CreateThread(function()     -- This updates skills as players use gym shit
    while true do
        local wait = 1000
        local ply = PlayerPedId()
        local plyc = GetEntityCoords(ply)

        if ply and plyc and QBCore ~= nil then
            for b,c in pairs(Config.Locations) do
                local dist = #(plyc - vector3(Config.Locations[b]['x'], Config.Locations[b]['y'], Config.Locations[b]['z']))

                if dist < 15 and not workingout then
                    wait = 0
                    if dist < 1.5 then
                        QBCore.Functions.DrawText3D(Config.Locations[b]['x'], Config.Locations[b]['y'], Config.Locations[b]['z'], ''.. Config.Lang.workoutlabel .. " " .. Config.Locations[b]['type']..'')
                        if IsControlJustPressed(0, 38) then
                            Workout(b)
                        end
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

--[[Citizen.CreateThread(function()     -- this updates skills as players do other shit
	while true do
        --local wait = 25000
        local ply = PlayerPedId()
        local plyc = GetEntityCoords(ply)
        if ply and plyc and QBCore ~= nil then
            if IsPedRunning(ply) and Config.Stamina == true then
                Functions.UpdateSkill('Stamina', Config.StaminaX)
            elseif IsPedInMeleeCombat(ply) and Config.Melee == true then
                Functions.UpdateSkill('Strength', Config.MeleeX)
            elseif IsPedSwimming(ply) and Config.Swim == true then
                Functions.UpdateSkill('Strength', Config.SwimX)
            elseif IsPedSwimmingUnderWater(ply) and Config.Lungs == true then
                Functions.UpdateSkill('Lung Capacity', Config.Lungs)
            end
        end
        Citizen.Wait(Config.WaitNoGym)
	end
end)]]