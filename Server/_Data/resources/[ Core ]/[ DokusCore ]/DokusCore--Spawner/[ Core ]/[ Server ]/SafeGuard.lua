--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Randomizer = _Spawner.StartRandomizer
Cutscenes  = _Spawner.Cutscenes
StartPos   = _Spawner.StartPosition
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Do all safeguard checks to make sure the config is not faulty
-- We do not recommend removing this! If the config is set wrong, this
-- could have consequences for your server!
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Spawner) then
    local Index = 0
    for k,v in pairs(Cutscenes) do if (v.Enabled) then Index = (Index + 1) end end
    if ((Index > 1) and (not (Randomizer))) then
      print("") Wait(100)
      print("") Wait(100)
      print("^1--------------------------------------------------------------------------------") Wait(100)
      print("^1-                          DokusCore Spawner Error                             ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------") Wait(100)
      print("^1-  ^3You've enabled multiple start locations without turning on the randomizer   ^1-") Wait(100)
      print("^1-   ^3Please disable all start locations except one, or turn on the randomizer   ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------^0") Wait(100)
      print("^1-               ^3The server has automatically shut itself down!                 ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------^0") Wait(100)
      -- os.exit()
    end

    if ((StartPos == nil) or (StartPos == '') and (not (Randomizer))) then
      print("") Wait(100)
      print("") Wait(100)
      print("^1--------------------------------------------------------------------------------") Wait(100)
      print("^1-                          DokusCore Spawner Error                             ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------") Wait(100)
      print("^1-      ^3You've not filled in a start position, or the start positions name      ^1-") Wait(100)
      print("^1-      ^3does not equal to any start positions in the array. Make sure that      ^1-") Wait(100)
      print("^1-                ^3start positions name is filled in correctly                   ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------^0") Wait(100)
      print("^1-               ^3The server has automatically shut itself down!                 ^1-") Wait(100)
      print("^1--------------------------------------------------------------------------------^0") Wait(100)
      -- os.exit()
    end

  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
