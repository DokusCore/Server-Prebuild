--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Scavenger", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  Prompt_Bush = nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoAnimation(PedID)
  local Hash = 'mech_pickup@plant@berries'
  RequestAnimDict(Hash)
  TaskPlayAnim(PedID, Hash, "enter_lf", 1.0, - 0.5, - 1, 0, 0, true, 0, false, 0, false) Wait(2500)
  TaskPlayAnim(PedID, Hash, "base", 1.0, - 0.5, - 1, 0, 0, true, 0, false, 0, false) Wait(4100)
  ClearPedTasks(PedID)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CheckBush(GetHarvested)
  local Found = false
  for k, v in pairs(GetHarvested) do
    local Dist = GetDistance(v)
    if (Dist <= 2.0) then Found = true end
  end return Found
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetReward()
  local Rewards = {}
  local List = _Scavenger.BushHarvest.Items
  for k, v in pairs(List) do
    if (Low(v.ID) == (Low(Type))) then
      Tabi(Rewards, v)
    end
  end

  local Random = Rewards [ Random(#Rewards) ]
  if (Random.Amount > 0) then
    local Description = MSG("Rewards").MSG .. " " .. Random.Amount .. " " .. Random.Name
    NoteObjective(MSG("Name").MSG, Description, "Check", Floor(MSG("Rewards").Time * 1000))
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { Sync.SteamID, Sync.CharID, Random.Item }
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
    if (Inv.Exist) then
      local Index = { Sync.SteamID, Sync.CharID, Random.Item, Random.Amount, Inv.Result[1].Amount }
      TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
    else
      local Index = { Sync.SteamID, Sync.CharID, Random.Type, Random.Item, Random.Amount }
      TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', Index })
    end
  end

end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function RockCoords(PedID)
    while (InRangeMining) do Wait(1)
        local X, Y
        math.randomseed(GetGameTimer())
        local modX = math.random(-12, 12)
        math.randomseed(GetGameTimer())
        local modY = math.random(-12, 12)
        for k, v in pairs(_Scavenger.Mining.Locations) do
          if (GetDistance(v.Coords) <= v.Range) then
            X = v.Coords.x + modX
            Y = v.Coords.y + modY
          end
        end

        local Z      = GetCoordZ(X, Y)
        local Coords = vector3(X, Y, Z)
        return Coords
    end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetCoordZ(x, y)
  for height = 1, 1000 do
		local foundGround, groundZ = GetGroundZAndNormalFor_3dCoord(x, y, (height - 50) + 0.0)
		if foundGround then return groundZ end
	end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnRocks(PedID)
  for k,v in pairs(_Scavenger.Mining.Locations) do
    local Dist = GetDistance(GetCoords(PedID))
    if (Dist <= v.Range) then
      while (InRangeMining) do Wait(100)
        if (SpawnedRocks < v.MaxRocks) then
          local Coords = RockCoords(PedID)
          local Rock = CreateObject(GetHashKey('roa_rock_scree_sim_02'), Coords, false, false, false)
          PlaceObjectOnGroundProperly(Rock)
          FreezeEntityPosition(Rock, true)
          Tabi(Rocks, Rock)
          SpawnedRocks = (SpawnedRocks + 1)
        end
    	end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
