Citizen.CreateThread(function()
    Wait(500)
    while true do
        Wait(50)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped) -- ISPEDHOLDING
        local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
        local model = GetEntityModel(holding)
        local pedtype = GetPedType(holding)
        --print(quality, model, pedtype)
        if holding ~= false then
            for i, row in pairs(Animal) do
                if model == Animal[i]["model"] then
                    for a = 1, #shops do 
                        local myV = vector3(coords)
                        local shopV = vector3(shops[a]["x"], shops[a]["y"], shops[a]["z"])
                        local dst = Vdist(shopV, myV)
                        if dst < 1 then
                            TriggerEvent("hunting:showprompt", "Press [G] to sell carcass/pelt to butcher.")
                            entity = holding
                            if IsControlPressed(0, 0x760A9C6F) then
                                local endpiece = shops[a]["gain"] * Animal[i]["reward"]
                                --DetachEntity(entity, 1, 1)
                                Wait(500)
                                SetEntityAsMissionEntity(entity, true, true)
                                Wait(500)
                                DeleteEntity(entity)
                                Wait(10)

                                -- DokusCore Edit --
                                local Random = Random(1, 3);
                                local Sync = TCTCC('DokusCore:Sync:Get:UserData');
                                local SteamID, CharID = Sync.SteamID, Sync.CharID;
                                local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Animal[i]['item'] } });
                                local Char  = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } });
                                if (not (Inv.Exist)) then
                                    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { SteamID, CharID, 'Consumable', Animal[i]['item'], Random } })
                                else
                                    local Index = { SteamID, CharID, Animal[i]["item"], Random, Inv[1].Amount };
                                    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
                                end;

                                TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { (Char[1].Money + endpiece), SteamID, CharID } })

                                NoteObjective("Sold", "You sold your "..Animal[i]["name"], 'success', 7000);
                                ---------------------------------------------


                                -- TriggerServerEvent("hunting:add", Animal[i]["item"])
                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerEvent("redemrp_notification:start", , 2, "success")
                                
                                Wait(500)
                                if holding == 0 then
                                    print("sold carcass")
                                else
                                    print("Something went wrong")
                                end
                            end
                        else
                            Wait(50)
                        end
                    end
                elseif quality == Animal[i]["poor"] then
                    for a = 1, #shops do 
                        local myV = vector3(coords)
                        local shopV = vector3(shops[a]["x"], shops[a]["y"], shops[a]["z"])
                        local dst = Vdist(shopV, myV)
                        if dst < 1 then
                            TriggerEvent("hunting:showprompt")
                            entity = holding
                            if IsControlPressed(0, 0x760A9C6F) then
                                local endpiece = shops[a]["gain"] * Animal[i]["reward"]
                                --DetachEntity(entity, 1, 1)
                                Wait(500)
                                SetEntityAsMissionEntity(entity, true, true)
                                Wait(500)
                                DeleteEntity(entity)
                                Wait(10)
                                TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                TriggerEvent("redemrp_notification:start", "You sold your poor "..Animal[i]["name"].." pelt", 2, "success")
                                Wait(500)
                                if holding == 0 then
                                    print("sold Hide")
                                else
                                    print("Something went wrong")
                                end
                            end
                        else
                            Wait(50)
                        end
                    end
                elseif quality == Animal[i]["good"] then
                    for a = 1, #shops do 
                        local myV = vector3(coords)
                        local shopV = vector3(shops[a]["x"], shops[a]["y"], shops[a]["z"])
                        local dst = Vdist(shopV, myV)
                        if dst < 1 then
                            TriggerEvent("hunting:showprompt", "Press [G] to sell carcass/pelt to butcher.")
                            entity = holding
                            if IsControlPressed(0, 0x760A9C6F) then
                                local endpiece = shops[a]["gain"] * Animal[i]["reward"]
                                --DetachEntity(entity, 1, 1)
                                Wait(500)
                                SetEntityAsMissionEntity(entity, true, true)
                                Wait(500)
                                DeleteEntity(entity)
                                Wait(10)

                                -- DokusCore Edit --
                                local Random = Random(1, 6);
                                local Sync = TCTCC('DokusCore:Sync:Get:UserData');
                                local SteamID, CharID = Sync.SteamID, Sync.CharID;
                                local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Animal[i]['item'] } });
                                local Char  = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } });
                                if (not (Inv.Exist)) then
                                    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { SteamID, CharID, 'Consumable', Animal[i]['item'], Random } })
                                else
                                    local Index = { SteamID, CharID, Animal[i]["item"], Random, Inv[1].Amount };
                                    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
                                end;

                                TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { ((Char[1].Money + endpiece) * 2), SteamID, CharID } })

                                NoteObjective("Sold", "You sold your "..Animal[i]["name"], 'success', 7000);
                                ---------------------------------------------

                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerEvent("redemrp_notification:start", "You sold your good "..Animal[i]["name"].." pelt", 2, "success")
                                Wait(500)
                                if holding == 0 then
                                    print("sold Hide")
                                else
                                    print("Something went wrong")
                                end
                            end
                        else
                            Wait(50)
                        end
                    end
                elseif quality == Animal[i]["perfect"] then
                    for a = 1, #shops do 
                        local myV = vector3(coords)
                        local shopV = vector3(shops[a]["x"], shops[a]["y"], shops[a]["z"])
                        local dst = Vdist(shopV, myV)
                        if dst < 1 then
                            TriggerEvent("hunting:showprompt", "Press [G] to sell carcass/pelt to butcher.")
                            entity = holding
                            if IsControlPressed(0, 0x760A9C6F) then
                                local endpiece = shops[a]["gain"] * Animal[i]["reward"]
                                --DetachEntity(entity, 1, 1)
                                Wait(500)
                                SetEntityAsMissionEntity(entity, true, true)
                                Wait(500)
                                DeleteEntity(entity)
                                Wait(10)

                                -- DokusCore Edit --
                                local Random = Random(1, 3);
                                local Sync = TCTCC('DokusCore:Sync:Get:UserData');
                                local SteamID, CharID = Sync.SteamID, Sync.CharID;
                                local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Animal[i]['item'] } });
                                local Char  = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } });
                                if (not (Inv.Exist)) then
                                    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { SteamID, CharID, 'Consumable', Animal[i]['item'], Random } })
                                else
                                    local Index = { SteamID, CharID, Animal[i]["item"], Random, Inv[1].Amount };
                                    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
                                end;

                                TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { ((Char[1].Money + endpiece) * 3), SteamID, CharID } })

                                NoteObjective("Sold", "You sold your "..Animal[i]["name"], 'success', 7000);
                                ---------------------------------------------

                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerServerEvent("hunting:money", endpiece)
                                -- TriggerServerEvent("hunting:xp", endpiece)
                                -- TriggerEvent("redemrp_notification:start", "You sold your perfect "..Animal[i]["name"].." pelt", 2, "success")
                                Wait(500)
                                if holding == 0 then
                                    print("sold Hide")
                                else
                                    print("Something went wrong")
                                end
                            end
                        else
                            Wait(50)
                        end
                    end
                end
            end
        elseif holding == false then
            for a = 1, #shops do 
                local myV = vector3(coords)
                local shopV = vector3(shops[a]["x"], shops[a]["y"], shops[a]["z"])
                local dst = Vdist(shopV, myV)
                if dst < 1 then
                    TriggerEvent("hunting:showprompt", "You are not holding any pelt or carcass.")
                else
                    Wait(50)
                end
            end
            Wait(50)
        end
    end
end)

RegisterNetEvent("hunting:showprompt")
AddEventHandler("hunting:showprompt", function(msg)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)
  

  --SNIPPET FROM CRYPTOGENICS, HOW I BUILT IT--
--[[Citizen.CreateThread(function()
    Wait(500)
    while true do
        Wait(100)
        local entity = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
        local model = GetEntityModel(entity)
        local carriedEntityHash = Citizen.InvokeNative(0x31FEF6A20F00B963, entity)
        local type = GetPedType(entity)
            if type == 28 then
                print(" ")
                print("Carcass Model")
                print(model)
        else
            print(" ")
            print("Not holding carcass")
        end
        if carriedEntityHash then
            print(" ")
            print("Pelt Model")
            print(carriedEntityHash)
        elseif carriedEntityHash == nil then
            print(" ")
            print("Not holding Provision")
            Wait(1000)
        end
    end
end)]]--
