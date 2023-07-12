-- Initialise QBCore
QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('Invictus-Gym:server:update')
AddEventHandler('Invictus-Gym:server:update', function(data)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)

    if ply then
        exports['oxmysql']:execute('UPDATE players SET skills = @skills WHERE citizenid = @citizenid', {
            ['@skills'] = json.encode(data),
            ['@citizenid'] = ply.PlayerData.citizenid
        })
    end
end)

QBCore.Functions.CreateCallback('Invictus-Gym:server:fetch', function(source, cb)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)

    if ply then
        exports['oxmysql']:execute('SELECT skills FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = ply.PlayerData.citizenid
        }, function(status)
            if status ~= nil then
                local decode = json.decode(status)
                return cb(decode)
            else
                return cb(nil)
            end
        end)
    end
end)