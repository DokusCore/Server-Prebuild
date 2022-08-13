--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScratchCards:Show:Random', function()
  local Chance = math.random(0, 100)
  local Luck   = (MoneyPrice.Chance - Chance)
  if (Luck > 0) then
    local Min, Max = Match(TS(MoneyPrice.Max), "([^.]*)%.([^.]*)")
    local Major = Random(0, Min)
    local Minor = Random(0, Max)
    local Prize = TN(Major..'.'..Minor)
    SetNuiFocus(true, true)
		SendNUIMessage({type = "shownui", value = Round(Prize, 1), threshold = 0.5})
  else
    SetNuiFocus(true, true)
		SendNUIMessage({type = "shownui", value = Round(0.0, 1), threshold = 0.5})
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScratchCards:Show:Value', function(MyChance, Value)
  local Chance = math.random(0, 100)
  local Luck   = (MyChance - Chance)
  if (Luck > 0) then
    local Prize = TN(Value)
    SetNuiFocus(true, true)
		SendNUIMessage({type = "shownui", value = Round(Prize, 1), threshold = 0.5})
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("closenui", function(Data)
  local Reward = Data.Prize
	SetNuiFocus(false, false)
  if (TN(Reward) > 0) then AddItem(Reward) YouWon(Reward) end
  if (TN(Reward) <= 0) then YouLost() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScratchCards:Get:Rewards', function()
  local Inv   = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, 'scratchprize' } })
  if (not (Inv.Exist)) then NoteNPCTalk('Bank Worker', "You've no lottery tickets in your possession!", true, 5000) return end
  local Char  = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
  local Money = TN(Decoded(Inv.Result[1].Meta)[1].Reward)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { SteamID, CharID, TN(Char.Money + Money) } })
  TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'Item', { SteamID, CharID, 'scratchprize' } })
  NoteNPCTalk('Bank Worker', "You've won a grand total of $"..TS(Money)..". Don't go to spend it all on booze now, haha", 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
