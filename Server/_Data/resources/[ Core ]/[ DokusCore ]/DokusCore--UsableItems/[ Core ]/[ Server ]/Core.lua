--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Ready = false
local ObjectsReset = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Clean up expired objects when the plugin / server starts
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    local Unix = GetUnix()
    local Data = DBGet(DB.Objects.GetAll, {}, function() end)
    if (Data[1] ~= nil) then
      for k,v in pairs(Data) do
        local Time = (v.Unix - Unix)
        if (Time <= 0) then
          DBDel(DB.Objects.DelViaItemID, { ItemID = v.ItemID }, function() end)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Reset all object IDs for new respawn
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (Ready)) do Wait(1000) end
    local Data = DBGet(DB.Objects.GetAll, {}, function() end)
    if (Data[1] ~= nil) then
      for k,v in pairs(Data) do
        DBSet(DB.Objects.SetAllToNil, {}, function() end)
      end
    end
  end ObjectsReset = true
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:UsableItems:Object:WaitForReset', function(args) Ready = true Wait(1500) return true end)
RSC('DokusCore:UsableItems:Object:GetResetStatus', function(args) return ObjectsReset end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
