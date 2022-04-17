--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Type = _Metabolism.Temp.Format
local nTemp = 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end

  while true do Wait(1000)
    if (Low(Type) == 'f') then nTemp = (Temp * 1.8 + 32.0) end
    if (Low(Type) == 'c') then nTemp = Temp end

    SendNUIMessage({
      Action = 'SetHud',
      Show = not IsRadarHidden(),
      Hunger = Hunger,
      Thirst = Thirst,
      Temp = (Round(nTemp, 2).."°"..tostring(Type)),
      rTemp = (Round(nTemp, 2))
    })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
