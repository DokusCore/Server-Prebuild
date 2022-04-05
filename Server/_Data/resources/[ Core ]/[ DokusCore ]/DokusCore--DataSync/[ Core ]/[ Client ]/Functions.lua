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
function SetSteamID(v)    _User.SteamID     = v Call('SteamID')        end
function SetCharID(v)     _User.CharID      = v Call('CharID')         end
function SetCharName(v)   _User.cName       = v Call('cName')          end
function SetServerID(v)   _User.ServerID    = v Call('ServerID')       end
function SetSteamName(v)  _User.sName       = v Call('sName')          end
function SetCoords(v)     _User.Coords      = v Call('Coords')         end
function SetInGameStat(v) _User.UserInGame  = v Call('UserInGame')     end
function SetCharMoney(v)  _User.CharMoney   = v Call('SetCharMoney')   end
function SetCharGold(v)   _User.CharGold    = v Call('SetCharGold')    end
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

































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
