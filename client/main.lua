local QBCore = exports['qb-core']:GetCoreObject()

local shopBasket = {}

--//Threads//--

CreateThread(function()
    SetupShops()
end)

--//functions//--
function SetupShops()
    print('Alle winkels zijn succesvol opgestart! ')
    for k, v in pairs(Config.locationsConfig) do
        local k = BoxZone:Create(vector3(v['Zones'].coords.x, v['Zones'].coords.y, v['Zones'].coords.z), v['Zones']['length'], v['Zones']['width'],  {
            name = k,
            minZ = v['Zones']['minZ'],
            maxZ = v['Zones']['maxZ'],
            heading = v['Zones']['heading'],
            debugPoly = false,
        })
        k:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            if isPointInside then
            QBCore.Functions.Notify('persoon loopt: ' ..k.name.. ' in!', 'success', 5000)
            SetupInsideShop(Config.locationsConfig[k.name], Config.locationsConfig[k.name])
            else
                QBCore.Functions.Notify('persoon loopt: ' ..k.name.. ' uit!', 'error', 5000)
                if shopBasket then
                    shopBasket = {}
                    QBCore.Functions.Notify('Je hebt de winkel verlaten, alle items zijn uit je winkelmand gehaald!', 'error', 5000) 
                end
                DeleteInsideShop(Config.locationsConfig[k.name])
            end
        end)
    end
end

function SetupInsideShop(data, data2)
    for k, v in pairs(data['Inside']) do
        exports['qb-target']:AddBoxZone(k, vector3(v['coords'].x, v['coords'].y, v['coords'].z), v['width'], v['length'], {
            name = v,
            heading = v['heading'],
            minZ=v['minZ'],
            maxZ=v['maxZ'],
            useZ = true,
            debugPoly = true
        },{
            options = {
            {
                type = "client",
                action = function()
                    TriggerEvent(v['events'], v['args'])
                end,
                icon = "fas fa-sign-in-alt",
                label = v['label'],
            }},
            distance = 2.5
        })
    end
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
    return tostring(o)
    end
end

--//event//--

RegisterNetEvent('vyz-shop:client:checkMandje', function()
    if not next(shopBasket) then
        QBCore.Functions.Notify('Je hebt niks in je winkelmand!', 'error', 5000)
        else
            print(dump(shopBasket))
        TriggerServerEvent('qb-shop:server:itemgeven', shopBasket)
        shopBasket = {}
        QBCore.Functions.Notify('Bedankt voor uw aankoop!', 'success', 5000)
    end
end)

function DeleteInsideShop(data)
    for k, v in pairs(data['Inside']) do
        exports['qb-target']:RemoveZone(k)   
    end
end

RegisterNetEvent('vyz-shops:client:Openkassa', function()
    local totalprice = 0
    local menu = ({
        {
            header = 'winkelmand',
            isMenuHeader = true
        }
    })

    for k,v in pairs(shopBasket) do
        price = v['price'] * v['amount']
        totalprice = totalprice + v.price * v.amount
        menu[#menu+1] = {
            header = v['amount'].. ' '..v['naam'].. '  voor '..price..',- euro',
            txt = 'druk op de knop voor item te verwijderen!',
            params = {
                event = 'vyz-shops:client:delete',
                args = k
            }
        }
    end

    local bevestig = {
        header = '✅ Bevestig & Betalen',
        txt = 'totaal prijs: '..totalprice..',-euro',
        params = {
            event = 'vyz-shop:client:checkMandje'
        }
    }

    print(totalprice)
    table.insert(menu, bevestig)
    exports['qb-menu']:openMenu(menu)
end)


RegisterNetEvent('vyz-shops:client:delete', function(data)
    table.remove(shopBasket, data)
    TriggerEvent('vyz-shops:client:Openkassa')
end)

RegisterNetEvent('vyz-shops:client:Opemenu', function(data)
    local drinken = ({
        {
            header = "winkelschap",
            isMenuHeader = true, 
        },
    })

    local eten = ({
        {
            header = "winkelschap",
            isMenuHeader = true, 
        },
    })

    local koelkast  = ({
        {
            header = 'winkel koelkast',
            isMenuHeader = true
        },
    })

    if data == 'eten' then
        for k, v in pairs(Config.Items[data]) do
        eten[#eten+1] = {
            header = k,
            txt = 'koop ' ..k.. '\'s voor: '..v['price']..',- euro p/s.',
            params = {
                event = 'vyz-shops:client:submenu',
                args = {
                    name = k,
                    item = v['name'],
                    price = v['price']
                }
            }
        }
        exports['qb-menu']:openMenu(eten)
        end

    elseif data == 'drinken' then
        for k, v in pairs(Config.Items[data]) do
            drinken[#drinken+1] = {
                header = k,
                txt = 'koop ' ..k.. '\'s voor: '..v['price']..',- euro p/s.',
                params = {
                    event = 'vyz-shops:client:submenu', 
                    args = {
                        name = k,
                        item = v['name'],
                        price = v['price']
                    }
                }
            }
            exports['qb-menu']:openMenu(drinken)
        end

    elseif data == 'koffie' then
        local koffie = {
        {
            header = 'koffie maken',
            txt = 'Maak koffie',
            params = {
                event = 'vyz-shops:client:koffie',
                args = {
                    item = "coffee",
                    price = 3,
                    amount = 1
                }
            }
        }
    }
    exports['qb-menu']:openMenu(koffie)
    elseif data == 'alcohol' then
        for k, v in pairs(Config.Items[data]) do
            koelkast[#koelkast+1] = {
                header = k,
                txt = 'koop ' ..k.. '\'s voor: '..v['price']..',- euro p/s.',
                params = {
                    event = 'vyz-shops:client:submenu',
                    args = {
                        name = k,
                        item = v['name'],
                        price = v['price']
                    }
                }
            }
        end
        exports['qb-menu']:openMenu(koelkast)
    end
end)

RegisterNetEvent('vyz-shops:client:submenu', function(data)
    local menutje = exports['qb-input']:ShowInput({
        header = 'Hoeveel '.. data.name.. ' wil je kopen?',
            submitText = "Bevestigen",
            inputs = {
                {
                    type = 'number',
                    isRequired = true,
                    name = 'slot',
                    text = 'Hoeveelheid. (10,20,30) (1,2,3)'
                }
            }
    })

    if menutje then
        local key = -1
        for k, v in pairs(shopBasket) do
            if v.item == data.item then
                key = k
                break
            end
        end

        if key == -1 then
            local data = {
                naam = data.name,
                item = data.item,
                amount = menutje.slot,
                price = data.price
            }
            shopBasket[#shopBasket+1] = data
        else
            local item  = shopBasket[key]
            item = {
                naam = data.name,
                item = data.item,
                amount = item.amount + menutje.slot,
                price = item.price
            }
                
            shopBasket[key] = item
        end

        print(dump(shopBasket))
        QBCore.Functions.Notify('Je hebt '..menutje.slot.. ' '..data.name.. ' toegevoegd aan je winkelmand!', 'success', 5000)
    end
end)

RegisterNetEvent('vyz-shops:client:koffie', function(data)
    local koffie = {}
    TriggerEvent('animations:client:EmoteCommandStart', {"point"})
    Wait(500)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    TriggerEvent('animations:client:EmoteCommandStart', {"idle6"}) 
    QBCore.Functions.Progressbar('koffie', 'Koffie maken...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{}, {}, function()
    end, function() end)
    Wait(5000)
    local data = {
        item = data.item,
        price = data.price,
        amount = data.amount
    }
    table.insert(koffie, data)
    QBCore.Functions.Notify('Je koffie is klaar!', 'success', 5000)
    TriggerServerEvent('qb-shop:server:koffie', koffie)
    koffie = {}
end)