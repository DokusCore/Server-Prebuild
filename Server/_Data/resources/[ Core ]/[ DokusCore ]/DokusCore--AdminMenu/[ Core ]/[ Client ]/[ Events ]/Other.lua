--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TPM', function()
  SendNUIMessage({type = "close"})
  TriggerEvent('DokusCore:Core:Admin:Commands:TPM')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('directMessage', function(Data)
    Data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('DokusCore:AdminMenu:PassToPlayer', {
      Action = 'DM',
      Source = TN(Data.player),
      Name   = Data.staff,
      MSG    = Data.data
    })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('coords', function()
  local PedID = PedID()
  local Veh = GetVehiclePedIsIn(PedID, false)
  local Mount = GetMount(PedID)
  local User = (Veh == 0 and (Mount == 0 and PedID or Mount) or Veh)
  local Coords = GetCoords(User)
  local Head = GetEntityHeading(User)
  print('Coords = ' .. Coords, 'Heading = ' .. Head)
  NoteObjective('System', 'Coords are posted in your client console!', 'Horn', 10000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('dv', function()
  local Deleted  = false
  local Horse    = GetMount(PedID())
  local Coach    = GetVehiclePedIsIn(PedID())

  if type(Horse) == "number" and Horse ~= 0 then
    Deleted = true DeletePed(Horse)
  end

  if type(Coach) == "number" and Coach ~= 0 then
    Deleted = true
    SetEntityAsMissionEntity(Coach, true, true)
    DeleteVehicle(Coach)
  end

  if (not (Deleted)) then
    NoteObjective('System', "You're not sitting on a horse or a stagecoach, unable to delete", 'Horn', 5000)
  else
    TriggerEvent('DokusCore:SafeGuard:Anti:AdminAbuse', 'DeleteVehicle')
  end

end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local IsGhosting = false
RegisterNUICallback('ghost', function()
  IsGhosting = not IsGhosting
    SetEntityVisible(PedID(), not IsGhosting, false)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('GodMode', function() TriggerEvent('DokusCore:Core:Admin:Commands:GodMode') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('bring', function(Data)
  local Admin  = GetEntityCoords(PedID())
  Data.staff   = GetPlayerName(PlayerId())
  TriggerServerEvent('DokusCore:AdminMenu:PassToPlayer', {
    Action = 'TeleportToAdmin',
    Source = TN(Data.player),
    Name   = Data.staff,
    Coords = Admin
  })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('goto', function(Data)
  local Admin  = GetCoords(PedID())
  Data.staff   = GetPlayerName(PlayerId())
  TriggerServerEvent('DokusCore:AdminMenu:PassToPlayer', {
    Action = 'TPMToUser1',
    Source = TN(Data.player),
    Coords = Admin,
    Name   = Data.staff,
    MySource = Data.MySource
  })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('spectate', function(Data)
  local PedID = PedID()
  if (not (IsSpectating)) then
    IsSpectating = true
    SetInvincible(PedID, true)
    SetFreeze(PedID, true)
    SetVisible(PedID, false)
    SpecCoords = GetCoords(PedID)
    TriggerServerEvent('DokusCore:AdminMenu:PassToPlayer', {
      Action = 'GetSpecCoords',
      Source = TN(Data.player),
      MySource = Data.MySource
    })
  else
    IsSpectating = false
    SetInvincible(PedID, false)
    SetFreeze(PedID, false)
    SetCoords(PedID, SpecCoords)
    SetVisible(PedID, true)
    SendNUIMessage({type = "close"})
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
