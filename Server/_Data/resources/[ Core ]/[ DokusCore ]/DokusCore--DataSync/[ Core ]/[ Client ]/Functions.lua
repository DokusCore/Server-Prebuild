--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Low = string.lower
System   = '^4[ DataSync ]^2[ System ]: ^5'
Error    = '^4[ DataSync ]^1[ Error ]: ^5'
Warn     = '^4[ DataSync ]^3[ Warning ]: ^5'
Location = '^4[ DataSync ]^3[ Location ]: ^5'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- User Data
--------------------------------------------------------------------------------
function SetSteamID(v)     _User.SteamID      = v Call('SteamID')        end
function SetCharID(v)      _User.CharID       = v Call('CharID')         end
function SetCharName(v)    _User.cName        = v Call('cName')          end
function SetServerID(v)    _User.ServerID     = v Call('ServerID')       end
function SetCoords(v)      _User.Coords       = v Call('Coords')         end
function SetUserAlive(v)   _User.Alive        = v Call('Alive')          end
function SetInGameStat(v)  _User.UserInGame   = v Call('UserInGame')     end
function SetCharMoney(v)   _User.CharMoney    = v Call('SetCharMoney')   end
function SetCharGold(v)    _User.CharGold     = v Call('SetCharGold')    end
function SetCharGender(v)  _User.Gender       = v Call('SetCharGender')  end
function SetCharSkin(v)    _User.Skin         = v Call('SetCharSkin')    end
function SetCharLang(v)    _User.Language     = v Call('SetCharLang')    end
function SetMusicVolume(v) _User.MusicVolume  = v Call('SetMusicVolume') end
function SetUserArea(v)    _User.Area         = v Call('SetUserArea')    end
function SetHorseID(v)     _User.HorseID      = v Call('SetHorseID')     end
function SetHorseName(v)   _User.HorseName    = v Call('SetHorseName')   end
function SetHorseActive(v) _User.HorseActive  = v Call('SetHorseActive') end


-- NOTE: DEPRECATED--  Need to be removed from all plugins
function SetBankMoney(v)  _User.BankMoney   = v Call('SetBankMoney')   end
function SetBankGold(v)   _User.BankGold    = v Call('SetBankGold')    end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Core Data
--------------------------------------------------------------------------------
function SetFrameReady(v) _Core.FrameReady  = v Call('FrameReady')     end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Module Data
function SetUsableItems(v) _Mod.UsableItems = v Call('SetUsableItems') end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for FrameReady
function FrameReady() return _Core.FrameReady end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for user in game
function UserInGame() return _User.UserInGame end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function SetInArea(Data) TriggerEvent('DokusCore:Sync:Set:In:Zone', Data) end
function SetOutArea() TriggerEvent('DokusCore:Sync:Set:Out:Zone') end




























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
