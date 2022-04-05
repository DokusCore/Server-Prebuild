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
  if (Low(v) == 'intobjectset')            then print(System.."The interactable object has been given a new array")                          end
  if (Low(v) == 'intobjectadded')          then print(System.."The interactable object has been added to the array")                         end
  if (Low(v) == 'intobjectremoved')        then print(System.."The interactable object has been removed from the array")                     end
end









--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
