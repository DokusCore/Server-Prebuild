--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Sync:Set:UserData', function(a)
  if (Low(a[1]) == 'steamid')      then SetSteamID(a[2][1])     end
  if (Low(a[1]) == 'sname')        then SetSteamName(a[2][1])   end
  if (Low(a[1]) == 'cname')        then SetCharName(a[2][1])    end
  if (Low(a[1]) == 'charid')       then SetCharID(a[2][1])      end
  if (Low(a[1]) == 'serverid')     then SetServerID(a[2][1])    end
  if (Low(a[1]) == 'coords')       then SetCoords(a[2][1])      end
  if (Low(a[1]) == 'alive')        then SetUserAlive(a[2][1])   end
  if (Low(a[1]) == 'useringame')   then SetInGameStat(a[2][1])  end
  if (Low(a[1]) == 'charmoney')    then SetCharMoney(a[2][1])   end
  if (Low(a[1]) == 'chargold')     then SetCharGold(a[2][1])    end
  if (Low(a[1]) == 'bankmoney')    then SetBankMoney(a[2][1])   end
  if (Low(a[1]) == 'bankgold')     then SetBankGold(a[2][1])    end
  if (Low(a[1]) == 'gender')       then SetCharGender(a[2][1])  end
  if (Low(a[1]) == 'skin')         then SetCharSkin(a[2][1])    end
  if (Low(a[1]) == 'language')     then SetCharLang(a[2][1])    end
  if (Low(a[1]) == 'musicvolume')  then SetMusicVolume(a[2][1]) end
  if (Low(a[1]) == 'area')         then SetUserArea(a[2][1])    end
  if (Low(a[1]) == 'horseid')      then SetHorseID(a[2][1])     end
  if (Low(a[1]) == 'horsename')    then SetHorseName(a[2][1])   end
  if (Low(a[1]) == 'horseactive')  then SetHorseActive(a[2][1]) end
  if (Low(a[1]) == 'InArea')       then SetInArea(a[2][1])      end
  if (Low(a[1]) == 'OutArea')      then SetOutArea(a[2][1])     end

  -- NOTE: Need to be removed from all plugins.
  if (Low(a[1]) == 'setcharmoney') then SetCharMoney(a[2][1])   end
  if (Low(a[1]) == 'setchargold')  then SetCharGold(a[2][1])    end
  if (Low(a[1]) == 'setbankmoney') then SetBankMoney(a[2][1])   end
  if (Low(a[1]) == 'setbankgold')  then SetBankGold(a[2][1])    end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Sync:Set:CoreData', function(a)
  if (Low(a[1]) == 'frameready') then SetFrameReady(a[2][1]) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Sync:Set:ModuleData', function(a)
  if (Low(a[1]) == 'usableitems') then SetUsableItems(a[2][1]) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
