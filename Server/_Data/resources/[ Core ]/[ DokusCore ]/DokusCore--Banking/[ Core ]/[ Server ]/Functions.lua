--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Low = string.lower
--------------------------------------------------------------------------------
function Notify(txt, pos, time)
  TriggerClientEvent("pNotify:SendNotification", source, {
    text = "<height='40' width='40' style='float:left; margin-bottom:10px; margin-left:20px;' />"..txt,
    type = "success", timeout = time, layout = pos, queue = "right"
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TableBanksForSyningNewAccount(Loc)
  local Locations = {}
  for k,v in pairs(_Banking.Zones) do
    if (Low(Loc) ~= Low(v.ID)) then table.insert(Locations, { Bank = v.ID, Synced = false, Money = 0, Gold = 0 }) end
  end
  local Encoded = json.encode(Locations)
  return Encoded
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










--------------------------------------------------------------------------------
