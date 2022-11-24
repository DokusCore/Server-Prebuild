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
  if (Low(v) == 'steamid')        then print(System.."You're SteamID is stored succesfully!")                     end
  if (Low(v) == 'charid')         then print(System.."You're Character ID is stored succesfully!")                end
  if (Low(v) == 'sname')          then print(System.."You're Steam Name is stored succesfully!")                  end
  if (Low(v) == 'cname')          then print(System.."You're Character Name is stored succesfully!")              end
  if (Low(v) == 'coords')         then print(System.."You're Coords are stored succesfully!")                     end
  if (Low(v) == 'alive')          then print(System.."You're Character death status has been updated!")           end
  if (Low(v) == 'serverid')       then print(System.."You're Server ID is stored succesfully!")                   end
  if (Low(v) == 'useringame')     then print(System.."You're InGame Status is stored succesfully!")               end
  if (Low(v) == 'setcharmoney')   then print(System.."You're Character Money Amount is stored succesfully!")      end
  if (Low(v) == 'setchargold')    then print(System.."You're Character Gold Amount is stored succesfully!")       end
  if (Low(v) == 'setbankmoney')   then print(System.."You're Character Bank Money Amount is stored succesfully!") end
  if (Low(v) == 'setbankgold')    then print(System.."You're Character Bank Gold Amount is stored succesfully!")  end
  if (Low(v) == 'frameready')     then print(System.."The framework reported to be ready and synced")             end
  if (Low(v) == 'setusableitems') then print(System.."Module UsableItems is synced with DataSync")                end
  if (Low(v) == 'setchargender')  then print(System.."You're Character Gender is stored succesfully!")            end
  if (Low(v) == 'setcharskin')    then print(System.."You're Character Skin Settings are stored succesfully!")    end
  if (Low(v) == 'setcharlang')    then print(System.."You're Language Settings are stored succesfully!")          end
  if (Low(v) == 'setmusicvolume') then print(System.."You're Music Volume Settings are stored succesfully!")      end
end









--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
