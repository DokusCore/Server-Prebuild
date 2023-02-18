-- local sharedItems = exports['qbr-core']:GetItems()

local WaterTypes = {
    [1] =  {["name"] = "Sea of Coronado",       ["waterhash"] = -247856387, ["watertype"] = "lake"},
    [2] =  {["name"] = "San Luis River",        ["waterhash"] = -1504425495, ["watertype"] = "river"},
    [3] =  {["name"] = "Lake Don Julio",        ["waterhash"] = -1369817450, ["watertype"] = "lake"},
    [4] =  {["name"] = "Flat Iron Lake",        ["waterhash"] = -1356490953, ["watertype"] = "lake"},
    [5] =  {["name"] = "Upper Montana River",   ["waterhash"] = -1781130443, ["watertype"] = "river"},
    [6] =  {["name"] = "Owanjila",              ["waterhash"] = -1300497193, ["watertype"] = "river"},
    [7] =  {["name"] = "HawkEye Creek",         ["waterhash"] = -1276586360, ["watertype"] = "river"},
    [8] =  {["name"] = "Little Creek River",    ["waterhash"] = -1410384421, ["watertype"] = "river"},
    [9] =  {["name"] = "Dakota River",          ["waterhash"] = 370072007, ["watertype"] = "river"},
    [10] =  {["name"] = "Beartooth Beck",       ["waterhash"] = 650214731, ["watertype"] = "river"},
    [11] =  {["name"] = "Lake Isabella",        ["waterhash"] = 592454541, ["watertype"] = "lake"},
    [12] =  {["name"] = "Cattail Pond",         ["waterhash"] = -804804953, ["watertype"] = "lake"},
    [13] =  {["name"] = "Deadboot Creek",       ["waterhash"] = 1245451421, ["watertype"] = "river"},
    [14] =  {["name"] = "Spider Gorge",         ["waterhash"] = -218679770, ["watertype"] = "river"},
    [15] =  {["name"] = "O'Creagh's Run",       ["waterhash"] = -1817904483, ["watertype"] = "lake"},
    [16] =  {["name"] = "Moonstone Pond",       ["waterhash"] = -811730579, ["watertype"] = "lake"},
    [17] =  {["name"] = "Roanoke Valley",       ["waterhash"] = -1229593481, ["watertype"] = "river"},
    [18] =  {["name"] = "Elysian Pool",         ["waterhash"] = -105598602, ["watertype"] = "lake"},
    [19] =  {["name"] = "Heartland Overflow",   ["waterhash"] = 1755369577, ["watertype"] = "swamp"},
    [20] =  {["name"] = "Lagras",               ["waterhash"] = -557290573, ["watertype"] = "swamp"},
    [21] =  {["name"] = "Lannahechee River",    ["waterhash"] = -2040708515, ["watertype"] = "river"},
    [22] =  {["name"] = "Dakota River",         ["waterhash"] = 370072007, ["watertype"] = "river"},
	[23] =  {["name"] = "Sea of Guarma",		["waterhash"] = -1168459546, ["watertype"] = "lake"},
}

RegisterCommand('fish', function() TriggerEvent('DokusCore:Fishing:Start') end)

RegisterNetEvent('DokusCore:Fishing:Start', function()
  local PedID = PedID()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, 'weapon_fishingrod' } }
  local FishRod = TSC('DokusCore:Core:DBGet:Inventory', Index)
  local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, 'fishingbait' } }
  local FishBait = TSC('DokusCore:Core:DBGet:Inventory', Index)
  if (not (FishRod.Exist)) then NoteObjective('Fishing', "You've no fishing rod in your inventory!", 'Horn', 3000) return end
  if (not (FishBait.Exist)) then NoteObjective('Fishing', "You've no fishing bait to fish!", 'Horn', 3000) return end
  if (FishBait.Result[1].Amount <= 0) then NoteObjective('Fishing', "You've no bait to fish!", 'Horn', 3000) return end
  TriggerEvent('rsg_fishing:client:StartFishing', PedID, Sync, FishBait.Result[1])
end)

RegisterNetEvent('rsg_fishing:client:StartFishing')
AddEventHandler('rsg_fishing:client:StartFishing', function(PedID, Sync, Bait)
	-- exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem)
		-- if hasItem then
			-- local ped = PlayerPedId()
			local coords = GetEntityCoords(PedID)
			local water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x+3, coords.y+3, coords.z)
			local canFish = false
			for k,v in pairs(WaterTypes) do
				if water == WaterTypes[k]["waterhash"]  then
					canFish = true
					break
				end
			end

			if canFish then
				-- TriggerServerEvent('QBCore:Server:RemoveItem', "fishingbait", 1)
        local Index = { 'User', 'RemoveItem', { Sync.SteamID, Sync.CharID, 'fishingbait', 1, Bait.Amount } }
        TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)

				-- TriggerEvent("inventory:client:ItemBox", sharedItems["fishingbait"], "remove")
				TaskStartScenarioInPlace(PedID, GetHashKey('WORLD_HUMAN_STAND_FISHING'), 30000, true, false, false, false)
				Wait(35000)
				ClearPedTasks(PedID)
				SetCurrentPedWeapon(PedID, `WEAPON_UNARMED`, true)
				-- randomNumber = math.random(1,5)
        randomNumber = Random(1, 10)
				-- if randomNumber < 3 then
        if ((randomNumber == 3) or (randomNumber == 6) or (randomNumber == 9)) then
					-- TriggerServerEvent('rsg_fishing:server:fishcaught')

          local Rewards = {
            { Item = 'fishsmall_uncooked', Name = 'Small Fish Uncooked' },
            { Item = 'fishmedium_uncooked', Name = 'Medium Fish Uncooked' },
            { Item = 'fishlarge_uncooked', Name = 'Large Fish Uncooked' }
          }

          local rReward = math.random(#Rewards)
          NoteObjective('Fishing', "You've caught a "..Rewards[rReward].Name.."!", 'Check', 3000)

          -- Check if the inventory already has this fish
          local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, Rewards[rReward].Item } }
          local Item = TSC('DokusCore:Core:DBGet:Inventory', Index)
          if (not (Item.Exist)) then
            -- Add in a new item into the inventory.
            local Index = { 'User', 'InsItem', { Sync.SteamID, Sync.CharID, 'Consumable', Rewards[rReward].Item, 1 } }
            TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
          else
            -- If item exists, just up the amount
            local Index = { 'User', 'AddItem', { Sync.SteamID, Sync.CharID, Rewards[rReward].Item, 1, Item.Result[1].Amount } }
            TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)
          end
				else
					-- exports['qbr-core']:Notify(9, 'you did not catch anything!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
          NoteObjective('Fishing', "You've not caught anything this time!", 'Horn', 3000)
				end
			else
				-- exports['qbr-core']:Notify(9, 'you can\'t fish here!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
        NoteObjective('Fishing', "You can't fish here!", 'Horn', 3000)
			end
		-- else
		-- 	exports['qbr-core']:Notify(9, 'you need bait to fish!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		-- end
	-- end, { ['fishingbait'] = 1 })
end)
