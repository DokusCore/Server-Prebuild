--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Type = _Metabolism.Temp.Format
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end

  while true do Wait(1000)
    ShowCores(true)
    -- Calculate farenheit is this setting is choosen.
    if (Low(Type) == 'f') then Temp = (Temp * 1.8 + 32.0) end

    SendNUIMessage({
      Action = 'SetHud',
      Show = not IsRadarHidden(),
      Hunger = Hunger,
      Thirst = Thirst,
      Temp = (Round(Temp, 2).."°"..tostring(Type)),
      rTemp = (Round(Temp, 2))
    })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
