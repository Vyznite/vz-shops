local QBCore = exports['qb-core']:GetCoreObject()



-- TODO: Eerst een check of de speler zijn inv niet vol zit. Anders verdwijen de items.
RegisterNetEvent('qb-shop:server:itemgeven', function(iets)
    local src = source  
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 0
    for k, v in pairs(iets) do
        price = price + v.price * v.amount
        print(v.item)
        Player.Functions.AddItem(v.item, v.amount, false) 
    end
    Player.Functions.RemoveMoney('cash', price)
end)

RegisterNetEvent('qb-shop:server:koffie', function(iets)
    local src = source  
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 0
    for k, v in pairs(iets) do
        print(v.item)
        Player.Functions.RemoveMoney('cash', v.price)
        Player.Functions.AddItem(v.item, v.amount, false) 
    end
end)
