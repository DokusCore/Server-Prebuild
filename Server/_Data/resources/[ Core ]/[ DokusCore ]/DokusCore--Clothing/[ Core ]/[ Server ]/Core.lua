--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local NPCData = {}
local Low     = string.lower
local Tabi    = table.insert
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  for k,v in pairs(_Clothing.NPCs) do
    Tabi(NPCData, { Data = v, IsBusy = false })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Tailor:NPCStatus', function(source, args)
  local Type, Loc, Status = args[1], args[2][1], args[2][2]
  if (Low(Type) == 'get') then
    for k,v in pairs(NPCData) do
      local City, IsBusy = NPCData[k].Data.ID, v.IsBusy
      if (Low(City) == Low(Loc)) then
        return IsBusy
      end
    end
  end

  if (Low(Type) == 'set') then
    for k,v in pairs(NPCData) do
      local City = NPCData[k].Data.ID
      if (Low(City) == Low(Loc)) then
        NPCData[k].IsBusy = Status
        return Status
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
