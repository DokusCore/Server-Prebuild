--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Display a status on your character that sticks until you remove it.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Status, Array = false, {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterCommand('status', function(s,a,r)
  if (Status) then
    TriggerServerEvent('DokusCore:ScriptBundle:Status:Delete')
    TriggerEvent('DokusCore:ScriptBundle:Status:Toggle', false)
    Wait(1000)
    return
  end

  if not (Status) then
    TextEntry(MSG("SetStatus").MSG, 'Server', 'DokusCore:ScriptBundle:Status:Set')
    TriggerEvent('DokusCore:ScriptBundle:Status:Toggle', true)
    Wait(1000)
    return
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScriptBundle:Status:Toggle', function(Bool) Status = Bool end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScriptBundle:Status:Activate', function(Data) Array = Data end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.ScriptBundle.Status) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      while Status do Wait(1)
        for k,v in pairs(Array) do
          local sCoords = GetCoords(PedID(GetServerID(Array[k].ServerID)))
          local Dist = GetDistance(sCoords)
          if (Dist <= _ScriptBundle.Status.ViewDist) then
            DrawText3D(sCoords.x, sCoords.y, sCoords.z, 225, Array[k].Text)
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
