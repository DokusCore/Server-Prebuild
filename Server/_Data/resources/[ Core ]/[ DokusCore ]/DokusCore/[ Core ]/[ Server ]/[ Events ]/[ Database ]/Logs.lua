--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local File = '@DokusCore/[ Core ]/[ Server ]/[ Events ]/[ Normal ]/Logs.lua'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Core:DBIns:Logs')
AddEventHandler('DokusCore:Core:DBIns:Logs', function(args)
  if (Low(args[1]) == 'safeguard') then
    DBIns(DB.Logs.Insert, {
      SteamID = args[2][1], Group = args[2][2], Module = 'SafeGuard',
      Type = args[2][3], Date = args[2][4], Time = args[2][5],
      Log = args[2][6]
    })
  elseif (Low(args[1]) == 'dokuscore') then
    DBIns(DB.Logs.Insert, {
      SteamID = args[2][1], Group = args[2][2], Module = 'DokusCore',
      Type = args[2][3], Date = args[2][4], Time = args[2][5],
      Log = args[2][6]
    })
  else
    DBIns(DB.Logs.Insert, {
      SteamID = args[2][1], Group = args[2][2], Module = args[1],
      Type = args[2][3], Date = args[2][4], Time = args[2][5],
      Log = args[2][6]
    })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------













--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
