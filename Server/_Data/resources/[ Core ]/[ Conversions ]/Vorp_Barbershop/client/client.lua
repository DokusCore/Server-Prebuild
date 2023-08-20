local prompts = GetRandomIntInRange(0, 0xffffff)
local openmenu
local orghair
local orgbeard
local activebarber
local activehair
local activebeard
local waitresult = true
local inmenu = false
local blips = {}

local location = nil;

T = Translation.Langs[Lang]

TriggerEvent('redemrp_menu_base:getData', function(call)
    MenuData = call
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        FreezeEntityPosition(PlayerPedId(), false)
        for k, v in pairs(blips) do
            RemoveBlip(v)
        end
    end
end)

----------------------------------------------------------
-- DokusCore Edit ----------------------------------------
----------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
----------------------------------------------------------
----------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
----------------------------------------------------------
----------------------------------------------------------

local availablehairmale = {}
local availablehairfemale = {}
local availablebeards = {}
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    local str = T.openmenu
    openmenu = PromptRegisterBegin()
    PromptSetControlAction(openmenu, Config.keys["G"])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(openmenu, str)
    PromptSetEnabled(openmenu, 1)
    PromptSetStandardMode(openmenu, 1)
    PromptSetGroup(openmenu, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, openmenu, true)
    PromptRegisterEnd(openmenu)

    for k, v in pairs(cloth_hash_names) do
        if v.category_hashname == "hair" then
            if v.ped_type == "male" then
                table.insert(availablehairmale, v)
            elseif v.ped_type == "female" then
                table.insert(availablehairfemale, v)
            end
        elseif v.category_hashname == "beard" then
            table.insert(availablebeards, v)
        end
    end
    for k, v in pairs(Config.locations) do
        local blip = N_0x554d9d53f696d002(1664425300, v.pos.x, v.pos.y, v.pos.z)
        SetBlipSprite(blip, -2090472724, 1)
        SetBlipScale(blip, 0.8)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, T.barbershop)
        table.insert(blips, blip)
    end
end)

RegisterNetEvent('vorp_barbershop:recinfo')
AddEventHandler('vorp_barbershop:recinfo', function(skininfo)
    skininfoz = json.decode(skininfo.Skin)
    orghair = skininfoz.Hair
    if IsPedMale(PlayerPedId()) then
        orgbeard = skininfoz.Beard
    end
    waitresult = false
end)

RegisterNetEvent('vorp_barbershop:apply')
AddEventHandler('vorp_barbershop:apply', function(paid)
    if paid then
        orghair = activehair
        orgbeard = activebeard
    end
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), activehair, true, true, true)
    if IsPedMale(PlayerPedId()) then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), orgbeard, true, true, true)
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true
        local coords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.locations) do
            if GetDistanceBetweenCoords(coords, v.pos.x, v.pos.y, v.pos.z, true) < v.radius and not inmenu and not IsPedDeadOrDying(PlayerPedId()) then
                sleep       = false
                local label = CreateVarString(10, 'LITERAL_STRING', T.barbershop)
                PromptSetActiveGroupThisFrame(prompts, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE, openmenu) then
                    location = vec3(v.pos.x, v.pos.y, v.pos.z);
                    inmenu = true
                    -- TriggerServerEvent("vorp_barbershop:getinfo")

                    ----------------------------------------------------------
                    -- DokusCore Edit ----------------------------------------
                    ----------------------------------------------------------
                    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
                    local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
                    local User = TSC('DokusCore:Core:DBGet:Characters', Index).Result[1];
                    local DecSkin = Decoded(User.Skin);
                    local Skin = Decoded(DecSkin.Skin);
                    TriggerEvent('vorp_barbershop:recinfo', DecSkin);
                    while waitresult do Wait(100) end
                    ----------------------------------------------------------
                    ----------------------------------------------------------

                    local DataStruct = DataView.ArrayBuffer(256 * 4)
                    local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(PlayerPedId()), 3.0,
                        DataStruct:Buffer(), 10)
                    for i = 1, 10, 1 do
                        local scenario = DataStruct:GetInt32(8 * i)
                        if scenario ~= 0 then
                            if GetHashKey("PROP_PLAYER_BARBER_SEAT") == Citizen.InvokeNative(0xA92450B5AE687AAF, scenario) or -289473187 == Citizen.InvokeNative(0xA92450B5AE687AAF, scenario) then
                                ClearPedTasksImmediately(PlayerPedId())
                                Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true)
                                TaskUseScenarioPoint(PlayerPedId(), scenario, "", -1.0, true, false, 0, false, -1.0, true)
                            else
                                Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), v.pos.x, v.pos.y, v.pos.z,
                                    v.radius, -1, true, true, true, true)
                            end
                        end
                    end
                    activebarber = v
                    Wait(8000)
                    FreezeEntityPosition(PlayerPedId(), true)
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                    openbarbermenu()
                end
            end
        end
        if sleep then
            Wait(500)
        end
    end
end)

function keysx(table)
    local keys = 0
    for k, v in pairs(table) do
        keys = keys + 1
    end
    return keys
end

function openbarbermenu()
    MenuData.CloseAll()
    local hairselection
    local beardselection
    local hairtable
    local elements = {
    }
    if IsPedMale(PlayerPedId()) then
        hairtable = availablehairmale
        for k, v in pairs(availablebeards) do
            if v.hash_dec_signed == orgbeard then
                beardselection = k
            end
        end
        if beardselection == nil then
            beardselection = 0
        end
        table.insert(elements,
            {
                label = T.beard,
                tag = "beard",
                value = beardselection,
                desc = T.beard2,
                type = "slider",
                min = 0,
                max = keysx(availablebeards),
                hop = 1
            })
    else
        hairtable = availablehairfemale
    end
    for k, v in pairs(hairtable) do
        if v.hash_dec_signed == orghair then
            hairselection = k
        end
    end
    if hairselection == nil then
        hairselection = 0
    end
    table.insert(elements,
        {
            label = T.hair,
            tag = "hair",
            value = hairselection,
            desc = T.hair2,
            type = "slider",
            min = 0,
            max = keysx(hairtable),
            hop = 1
        })
    table.insert(elements, { label = T.confirm, tag = 'confirm', desc = T.confirm2 .. activebarber.price })
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = T.barbershop,
            subtext  = "",
            align    = 'top-left',
            elements = elements,
        },
        function(data, menu)
            if (data.current.tag == 'hair') then
                if data.current.value == 0 then
                    activehair = 0
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                else
                    activehair = hairtable[data.current.value].hash_dec_signed
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), activehair, true, true, true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                end
            end
            if (data.current.tag == 'beard') then
                if data.current.value == 0 then
                    activebeard = 0
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF8016BCA, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                else
                    activebeard = availablebeards[data.current.value].hash_dec_signed
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), activebeard, true, true, true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                end
            end
            if (data.current.tag == 'confirm') then
                if activehair ~= orghair or activebeard ~= orgbeard then
                    -- TriggerServerEvent("vorp_barbershop:payforservice", activebarber.price, activehair, activebeard)
                    ----------------------------------------------------------
                    -- DokusCore Edit ----------------------------------------
                    ----------------------------------------------------------
                    -- Check if the user has enough money 
                    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
                    local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
                    local User = TSC('DokusCore:Core:DBGet:Characters', Index).Result[1];
                    local DecSkin = Decoded(User.Skin);
                    local Skin = Decoded(DecSkin.Skin);
                    local Money = Round(TN(User.Money), 2)
                    if (Money < activebarber.price) then
                        MenuData.CloseAll();
                        NoteNPCTalk("Barber", "You do not have enough money!", false, 5000) 
                        ClearPedTasks(PlayerPedId()) Wait(5000)
                        TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
                        TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
                        SetFreeze(PlayerPedId(), false);
                        return
                    end
                    NoteNPCTalk('Barber', "Thank you, that will be $"..TN(activebarber.price), false, 5000);
                    ----------------------------------------------------------
                    ----------------------------------------------------------
                    -- Let the user pay
                    local Index = { Sync.SteamID, Sync.CharID, Round(TN(Money - activebarber.price), 2) }
                    TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', Index })
                    ----------------------------------------------------------
                    ----------------------------------------------------------
                    -- Safe the characters new look
                    local CharData = {}
                    CharData.Skin = {}
                    CharData.Face = {}
                    CharData.Skin.Head = Skin.Head;
                    CharData.Skin.Legs = Skin.Legs;
                    CharData.Skin.Eyes = Skin.Eyes;
                    CharData.Skin.Hair = activehair;
                    CharData.Skin.Torso = Skin.Torso;
                    CharData.Skin.Beard = activebeard;
                    local Data = Encoded({ Skin = Encoded(CharData.Skin), Face = Encoded(CharData.Face) })
                    TriggerEvent('DokusCore:Sync:Set:UserData', { 'Skin', { Data } });
                    local Index = { 'Skin', { Sync.SteamID, Sync.CharID, Data } };
                    TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
                    ----------------------------------------------------------
                    ----------------------------------------------------------
                end

                MenuData.CloseAll() Wait(5000)
                ClearPedTasks(PlayerPedId()) Wait(5000)
                TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
                TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
                SetFreeze(PlayerPedId(), false);
                -- Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), orghair, true, true, true)
                -- if IsPedMale(PlayerPedId()) then
                --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), orgbeard, true, true, true)
                -- end
                -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                -- Wait(2000)
                inmenu = false
            end
        end,
        function(data, menu)
            menu.close()
            ClearPedTasks(PlayerPedId()) Wait(5000)
            TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
            TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
            SetFreeze(PlayerPedId(), false);
            -- Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), orghair, true, true, true)
            -- if IsPedMale(PlayerPedId()) then
            --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), orgbeard, true, true, true)
            -- end
            -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            -- Wait(5000)
            inmenu = false
        end)
end
