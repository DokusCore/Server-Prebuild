--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (_Sys.SystemReady)) do Wait(1000) end
    while true do Wait(1000)
      if (#_Obj.Interactables > 0) then
        for k,v in pairs(_Obj.Interactables) do
          local Unix = GetUnix()
          local Dec = Decoded(v.Meta)
          local Time = (Dec.Expire - Unix)
          if (Time <= 0) then
            table.remove(_Obj.Interactables, k)
            TriggerClientEvent('DokusCore:UsableItems:Object:Reset', -1, v.ID)
          elseif (Time > 0) then
            local Meta = { Active = Dec.Active, InUse = Dec.InUse, Expire = Dec.Expire, Time = Time }
            local Encode = Encoded(Meta)
            _Obj.Interactables[k].Meta = Encode
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
