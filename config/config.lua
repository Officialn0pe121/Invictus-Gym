Config = {}

-- Gym Locations
Config.Locations = {
    [1] = { ['x'] = -1200.0, ['y'] = -1571.17, ['z'] = 4.60, ['h'] = 217.22, ["type"] = "Pullups", ["emote"] = "chinup", ['time'] = 12000}, -- vector3(-1200.0, -1571.17, 4.61)
    [2] = {['x'] = -1196.62, ['y'] = -1569.18, ['z'] = 4.60, ['h'] = 122.0, ["type"] = "Pushups", ["emote"] = "pushup", ['time'] = 12000},
    [3] = {['x'] = -1201.97, ['y'] = -1567.16, ['z'] = 4.60, ['h'] = 35.0, ["type"] = "Situps", ["emote"] = "situp", ['time'] = 12000},
    [4] = {['x'] = -1204.58, ['y'] = -1561.59, ['z'] = 4.60, ['h'] = 35.0, ["type"] = "Yoga", ["emote"] = "yoga", ['time'] = 12000},
    [5] = {['x'] = -1209.29, ['y'] = -1559.53, ['z'] = 4.60, ['h'] = 32.62, ["type"] = "Weights", ["emote"] = "weights", ['time'] = 12000}, -- vector4(-1209.29, -1559.53, 4.61, 32.62)
}

-- In Gym Shit
Config.StressReliefMin = 3
Config.StressReliefMax = 5
Config.GymStrength = 0.1
Config.GymStamina = 0.2
Config.GymWait = 10000 -- Relax you cunt

Config.Framework = {
    Name = 'QBCore',
    Trigger = 'QBCore:GetObject'
}

-- Skill List with native names

Config.Skills = {
    ["Stamina"] = {
        ['current'] = 10,
        ['label'] = 'Stamina',
        ['removeSec'] = -0.3,
        ['stat'] = 'MP0_STAMINA'
    },
    ['Strength'] = {
        ['current'] = 10,
        ['label'] = 'Strength',
        ['removeSec'] = -0.3,
        ['stat'] = 'MP0_STRENGTH'
    },
    ['Lung Capacity'] = {
        ['current'] = 10,
        ['label'] = 'Lung capacity',
        ['removeSec'] = -0.1,
        ['stat'] = "MP0_LUNG_CAPACITY"
    },
    ["Shooting"] = {
        ['current'] = 10,
        ['label'] = 'Shooting',
        ['removeSec'] = -0.4,
        ['stat'] = 'MP0_SHOOTING_ABILITY'
    },
    ["Driving"] = {
        ['current'] = 10,
        ['label'] = 'Driving',
        ['removeSec'] = -0.3,
        ['stat'] = 'MP0_DRIVING_ABILITY'
    },
    ["Wheelie"] = {
        ['current'] = 10,
        ['label'] = 'Wheelie',
        ['removeSec'] = -0.2,
        ['stat'] = 'MP0_WHEELIE_ABILITY'
    }
}

-- Lazy locale system

Config.Lang = {
    ["skillup"] = " Skill Improved",
    ["skilldown"] = " Skill Removed",
    ["resting"] = "You must rest before another workout",
    ["workoutlabel"] = "~g~E~w~ - Start Working Out",
    ["workoutlabel"] = "~g~E~w~ - To Do" 
}
