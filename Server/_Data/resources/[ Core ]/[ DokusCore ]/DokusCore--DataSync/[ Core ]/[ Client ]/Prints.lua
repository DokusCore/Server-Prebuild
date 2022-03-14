--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
System   = '^4[ DataSync ]^2[ System ]: ^5'
Error    = '^4[ DataSync ]^1[ Error ]: ^5'
Warn     = '^4[ DataSync ]^3[ Warning ]: ^5'
Location = '^4[ DataSync ]^3[ Location ]: ^5'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Call(v)
  if (Low(v) == 'steamid')    then print(System.."You're SteamID is stored succesfully!")        end
  if (Low(v) == 'charid')     then print(System.."You're Character ID is stored succesfully!")   end
  if (Low(v) == 'sname')      then print(System.."You're Steam Name is stored succesfully!")     end
  if (Low(v) == 'cname')      then print(System.."You're Character Name is stored succesfully!") end
  if (Low(v) == 'coords')     then print(System.."You're Coords are stored succesfully!")        end
  if (Low(v) == 'serverid')   then print(System.."You're Server ID is stored succesfully!")      end
  if (Low(v) == 'useringame') then print(System.."You're InGame Status is stored succesfully!")  end
  if (Low(v) == 'frameready') then print(System.."DokusCore is Synced with DataSync")            end
end









--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
