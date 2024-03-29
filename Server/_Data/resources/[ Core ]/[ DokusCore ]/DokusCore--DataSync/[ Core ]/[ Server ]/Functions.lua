--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Low      = string.lower
System   = '^4[ DataSync ]^2[ System ]: ^5'
Error    = '^4[ DataSync ]^1[ Error ]: ^5'
Warn     = '^4[ DataSync ]^3[ Warning ]: ^5'
Location = '^4[ DataSync ]^3[ Location ]: ^5'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set the interactable objects
--------------------------------------------------------------------------------
function SetIntObjects(v)
  local ID, Item, Coords, Meta = v[1], v[2], v[3], v[4]
  table.insert(_Obj.Interactables, { ID = ID, Item = Item, Coords = Coords, Meta = Meta })
  return Call('intobjectset')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Remove a interactable object from the existing array
--------------------------------------------------------------------------------
function DelIntObjects(ID)
  for k,v in pairs(_Obj.Interactables) do
    if (v.ID == ID) then
      table.remove(_Obj.Interactables, k)
      return Call('intobjectremoved')
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function InsertOnline(Data)
  local DoesExist, Pos = false, nil
  if (#_User.Online > 0) then
    for k,v in pairs(_User.Online) do
      if (v.SteamID == Data.SteamID) then
        DoesExist, Pos = true, k
      end
    end
  end

  if (not (DoesExist)) then
    table.insert(_User.Online, Data)
  end

  if (DoesExist) then
    table.remove(_User.Online, Pos)
    table.insert(_User.Online, Data)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DelOnlineViaSource(Source)
  if (#_User.Online ~= 0) then
    for k,v in pairs(_User.Online) do
      if (Source == v.Source) then
        table.remove(_User.Online, k)
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
