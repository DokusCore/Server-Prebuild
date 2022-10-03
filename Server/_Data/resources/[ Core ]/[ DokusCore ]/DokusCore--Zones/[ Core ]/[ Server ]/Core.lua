--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Line     = '\n^1------------------------------------------------------------------------------------^0\n'
System   = '^5[ DokusZones ]^2[ System ]: ^0'
Error    = '^5[ DokusZones ]^1[ Error ]: ^0'
Warn     = '^5[ DokusZones ]^3[ Warning ]: ^0'
Location = '^5[ DokusZones ]^3[ Location ]: ^0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local ConfigHasError = false
local io, os, error = io, os, error
local file = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.exists(path)
  local file = io.open(path, 'rb')
  if file then file:close() end
  return file ~= nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.read(path, mode)
  mode = mode or '*a'
  local file, err = io.open(path, 'rb')
  if err then print(err) end
  local content = file:read(mode)
  file:close()
  return content
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.write(path, content, mode)
  mode = mode or 'w'
  local file, err = io.open(path, mode)
  if err then print(err) end
  file:write(content)
  file:close()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.copy(src, dest)
  local content = file.read(src)
  file.write(dest, content)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.move(src, dest) os.rename(src, dest) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function file.remove(path) os.remove(path) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Zones:SaveZones')
AddEventHandler('DokusCore:Zones:SaveZones', function()
  local Exist = file.exists('resources/[ Core ]/[ DokusCore ]/DokusCore--Zones/Zoning.lua')
  if (Exist) then TriggerClientEvent('DokusCore:Zones:StoreZones', source) end
  if (not (Exist)) then TriggerClientEvent('DokusCore:Zones:StartZones', source) end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Zones:DeleteConfig')
AddEventHandler('DokusCore:Zones:DeleteConfig', function()
  if (not (ConfigHasError)) then
    file.remove('resources/[ Core ]/[ DokusCore ]/DokusCore--Zones/Zoning.lua')
    Wait(500) TriggerClientEvent('DokusCore:Zones:StartZones', -1)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Zones:ConfigError')
AddEventHandler('DokusCore:Zones:ConfigError', function(Type)
  ConfigHasError = true
  if (Low(Type) == 'onentereventwrong') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnEnter ] ")
    print(Error.."Event parameters are missing, wrong or formatted incorrectly.")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'onexiteventwrong') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnExit ]")
    print(Error.."Event parameters are missing, wrong or formatted incorrectly.")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'onevententermeta') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnEnter ]")
    print(Error.."Meta parameters are missing, wrong or formatted incorrectly.")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'oneventexitmeta') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnExit ]")
    print(Error.."Meta parameters are missing, wrong or formatted incorrectly.")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'noonenterevent') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnEnter ]")
    print(Error.."event is missing from the zones config!")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'novectorsevent') then
    print(Line..Error.."Unable to put your zone into the database! The [ Vectors ]")
    print(Error.."event is missing from the zones config!")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'onenternotypeset') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnEnter ]")
    print(Error.."first parameter is either [ client ] or [ server ]")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'onenternoeventset') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnEnter ]")
    print(Error.."second parameter event is missing!")
    print(Error.."Please refer to the manual for more information!"..Line)

  elseif (Low(Type) == 'onexitnotypeset') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnExit ]")
    print(Error.."first parameter is either [ client ] or [ server ]")
    print(Error.."Please refer to the manual for more information!"..Line)
  elseif (Low(Type) == 'onexitnoeventset') then
    print(Line..Error.."Unable to put your zone into the database! The [ OnExit ]")
    print(Error.."second parameter event is missing!")
    print(Error.."Please refer to the manual for more information!"..Line)
  end
end)
