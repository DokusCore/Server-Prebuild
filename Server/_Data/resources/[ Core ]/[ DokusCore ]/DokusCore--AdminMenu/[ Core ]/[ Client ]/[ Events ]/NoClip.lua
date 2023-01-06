--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local Enabled  = false
local NoClip   = _AdminMenu.NoClip
local Speed    = NoClip.Speed
local CurSpeed = Speed.Def
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('noclip', function(data, cb)
  Enabled = not Enabled
  local PedID = PedID()
  local User = GetNoClipTarget()
  SetEntityInvincible(PedID, Enabled)
  ClearPedTasksImmediately(User, false, false)
  TriggerEvent('DokusCore:Admin:NoClip', PedID, User)
  SendNUIMessage({type = "close"})
  TriggerEvent('DokusCore:SafeGuard:Anti:AdminAbuse', 'NoClip')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Admin:NoClip', function(PedID, User)
  while Enabled do Wait(1)
    SetFreeze(User, Enabled)
    DisableFirstPersonCamThisFrame()
    local x, y, z = table.unpack(GetCoords(User))
    local h = TranslateHeading(User, GetEntityHeading(User))
    local Control = GetControls()
    local r = -h * math.pi / 180
    local dx = CurSpeed * math.sin(r)
    local dy = CurSpeed * math.cos(r)
    local rot = GetGameplayCamRot(2)
    h = rot.z

    DrawInfo('Up = A', 0.1, 0.45, 0.5)
    DrawInfo('Down = D', 0.1, 0.48, 0.5)
    DrawInfo('Forward = W', 0.1, 0.51, 0.5)
    DrawInfo('Backwards = S', 0.1, 0.54, 0.5)
    DrawInfo('Speed Up = Q', 0.1, 0.57, 0.5)
    DrawInfo('Speed Down = E', 0.1, 0.60, 0.5)
    DrawInfo('NoClip Speed: ' .. TS(CurSpeed), 0.1, 0.63, 0.5)

    if (Control.Front) then x, y = (x + dx), (y + dy) end
    if (Control.Back)  then x, y = (x - dx), (y - dy) end
    if (Control.Up)    then z = (z + CurSpeed) end
    if (Control.Down)  then z = (z - CurSpeed) end
    if ((Control.SUp)   and (CurSpeed < Speed.Max)) then CurSpeed = (CurSpeed + Speed.Inc) end
    if ((Control.SDown) and (CurSpeed > Speed.Min)) then CurSpeed = (CurSpeed - Speed.Inc) end

    SetEntityCoordsNoOffset(User, x, y, z)
    SetEntityHeading(User, TranslateHeading(User, h))

  end NoClipReset(PedID, User)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetNoClipTarget()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local mnt = GetMount(ped)
	return (veh == 0 and (mnt == 0 and ped or mnt) or veh)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function NoClipReset(PedID, User)
  SetFreeze(User, false)
  SetEntityInvincible(User, false)
  ClearPedTasksImmediately(User, false, false)
  NoteObjective('System:', "After NoClip your horse could start running automatically. Hold shift for 1 second and then your horse will stop doing this!", 'Horn', 10000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetControls()
  local W = IsControlPressed(0, _Keys.W)
  local S = IsControlPressed(0, _Keys.S)
  local A = IsControlPressed(0, _Keys.A)
  local D = IsControlPressed(0, _Keys.D)
  local Q = IsControlPressed(0, _Keys.Q)
  local E = IsControlPressed(0, _Keys.E)
  return { Front = W, Back = S, Up = A, Down = D, SUp = E, SDown = Q }
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TranslateHeading(entity, h)
	if GetEntityType(entity) == 1 then
		return (h + 180) % 360
	else
		return h
	end
end
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
