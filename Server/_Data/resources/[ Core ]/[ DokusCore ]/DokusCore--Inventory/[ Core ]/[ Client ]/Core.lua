--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
BoxArray, BoxTXTs = {}, {}
Steam, CharID = nil, nil
IsInvOpen, IsPickingUpItem, IsBoxOpen = false, false, false
ActKeyInv = _Inventory.ActKey.OpenInv
ActKeyBox = _Inventory.ActKey.OpenBox
Ani = "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop"
local Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for FrameReady and set the Users Data
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  Steam, CharID = Data.SteamID, Data.CharID
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Then place all boxes back on the map.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'All' })
    if (Data.Exist) then
      for k,v in pairs(Data.Result) do
        local Coords = json.decode(v.Coords)
        local Vector = vector3(Coords.x, Coords.y, Coords.z)
        TriggerServerEvent('DokusCore:Core:DBSet:Storages', { 'DropBox', 'ReplaceID', { v.BoxID, CreateNewBox(Vector) } })
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Get players coords to feed box texts, this to prevent high resource SPU usages
--------------------------------------------------------------------------------
local PlayerCoords = nil
CreateThread(function()
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1)
      local PedID = PedID()
      local Coords = GetCoords(PedID)
      PlayerCoords = Coords
      Wait(500)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the text above the boxes, and Register when the box is opened
--------------------------------------------------------------------------------
CreateThread(function() Wait(1000)
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Core = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Core.SteamID, Core.CharID
    while true do Wait(1000)
      while (BoxTXTs[1] ~= nil) do Wait(0)
        for k,v in pairs(BoxTXTs) do
          local BoxID, Coords = BoxTXTs[k].BoxID, BoxTXTs[k].Coords
          local x,y,z = Coords.x, Coords.y, (Coords.z - 0.65)
          local Dist = Vdist(Coords, PlayerCoords)
          local Close, Medium = (Dist <= 0.6), ((Dist > 0.6) and (Dist <= 2.0))
          local Key = _Inventory.Interaction.UseKey
          if (Close) then DrawText3D(x,y,z, 300, 'Press ~color_green~E~q~ to open') end
          if (Medium) then DrawText3D(x,y,z, 200, '{ Expire: Work in Progress }') end
          if ((Medium) or (Far)) then IsBoxOpen = false end
          if (Close) then
            local Control = IsControlJustReleased(0, ActKeyBox)
            if ((Control) and not (IsBoxOpen)) then
              IsBoxOpen = true
              TriggerEvent('DokusCore:Inventory:OpenBoxMenu', BoxID)
            end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
