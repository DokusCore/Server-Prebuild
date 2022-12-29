--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local File = '@DokusCore/[ Core ]/[ Server ]/[ Events ]/[ Callbacks ]/[ Database ]/Items.lua'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Core:DBGet:Items', function(source, args)
  local Exist, Result = false, nil

  if (Low(args[1]) == 'all') then
    local X = DBGet(DB.Items.GetAll, {}, function() end)
    if (X[1] ~= nil) then Exist = true Result = X end
    return { Exist = Exist, Result = Result }
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
