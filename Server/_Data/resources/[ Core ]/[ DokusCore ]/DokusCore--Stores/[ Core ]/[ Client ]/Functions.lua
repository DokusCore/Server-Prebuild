--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function NREntryErr() NoteObjective("ERROR", "You've not inserted a number, but inserted text or nothing!!", 'Alert', 5000) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Open(Type) TriggerEvent('DokusCore:Stores:OpenStore', Type) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetInArea()
  InArea = true
  TriggerEvent('DokusCore:Stores:CheckDistStore')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutArea()
  ShowPrompt = false
  SetNuiFocus(false, false)
  local Random = Dialog.ExitStore[math.random(#Dialog.ExitStore)]
  NoteNPCTalk(Dialog.NPCName, Random, 1500) Wait(500)
  ShowPrompt = true
  InArea, Loc = false, nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetInStore()
  ShowPrompt = false
  SetNuiFocus(false, false)
  local Random = Dialog.EnterStore[math.random(#Dialog.EnterStore)]
  NoteNPCTalk(Dialog.NPCName, Random, 1500) Wait(500)
  ShowPrompt = true
  InStore = true
  TriggerEvent('DokusCore:Stores:CheckDistNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutStore()
  InStore = false
  Array = {}
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNearNPC()
  NearNPC = true
  TriggerEvent('DokusCore:Stores:ShowPrompt')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetFarNPC()
  NearNPC = false
  StoreInUse = false
  Prompt, PromptGroup = nil, GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function PromptKey(Lang)
  CreateThread(function()
    local str = 'Buy'
    Prompt_Buy = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Buy, _Keys['E'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Buy, str)
    PromptSetEnabled(Prompt_BuyPrompt_Buy, true)
    PromptSetVisible(Prompt_Buy, true)
    PromptSetHoldMode(Prompt_Buy, true)
    PromptSetGroup(Prompt_Buy, PromptGroup)
    PromptRegisterEnd(Prompt_Buy)

    local str = 'Sell'
    Prompt_Sell = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Sell, _Keys['F'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Sell, str)
    PromptSetEnabled(Prompt_Sell, true)
    PromptSetVisible(Prompt_Sell, true)
    PromptSetHoldMode(Prompt_Sell, true)
    PromptSetGroup(Prompt_Sell, PromptGroup)
    PromptRegisterEnd(Prompt_Sell)

    local str = 'Manage'
    Prompt_Manage = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Manage, _Keys['X'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Manage, str)
    PromptSetEnabled(Prompt_Manage, true)
    PromptSetVisible(Prompt_Manage, true)
    PromptSetHoldMode(Prompt_Manage, true)
    PromptSetGroup(Prompt_Manage, PromptGroup)
    PromptRegisterEnd(Prompt_Manage)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetStore()
  Radar(true)
  ShowCores(true)
  SetNuiFocus(false, false)
  NearNPC = false
  StoreInUse = false
  Prompt = nil
  PromptGroup = GetRandomIntInRange(0, 0xffffff)
  Array_Inv, Array_Store = {}, {}
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CloseStore() SetNuiFocus(false, false) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataStore()
  local Data = TSC('DokusCore:Core:DBGet:Stores', { 'All' })
  if (Data.Result == nil) then return end
  for k,v in pairs(Data.Result) do
    table.insert(Array_Store, {
      Item = v.Item,
      Name = v.Name,
      Type = v.Type,
      Desc = v.Description,
      Buy  = v.Buy
    })
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataInv()
  local Data  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'All', { SteamID, CharID } })
  local Items = TSC('DokusCore:Core:DBGet:Stores', { 'All' }).Result
  if (Data.Result == nil) then return end
  for k,i in pairs(Data.Result) do
    for o,s in pairs(Items) do
      if (Low(i.Item) == Low(s.Item)) then
        table.insert(Array_Inv, {
          Item = i.Item,
          Name = s.Name,
          Type = s.Type,
          Desc = s.Description,
          Sell = s.Sell
        })
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function InsertInvItem(Item, Amount)
  TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { SteamID, CharID, 'Consumable', Item, Amount } })
  Message('Buy', Item, Amount)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function AddInvItem(Item, Amount, Data)
  TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', { SteamID, CharID, Item, Amount, Data[1].Amount } })
  Message('Buy', Item, Amount)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DelInvItem(Item, Amount, Data)
  TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'Item', { SteamID, CharID, Item } })
  Message('Sell', Item, Amount)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetInvItem(Item, Amount, Data)
  TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { SteamID, CharID, Item, Amount, Data } })
  Message('Sell', Item, Amount)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexAllData()
  Array_Inv, Array_Store = {}, {}
  IndexItemDataStore()
  IndexItemDataInv()
end

function OpenStore() IndexAllData() end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenStoreBuy()
  ShowPrompt = false
  local Random = Dialog.MenuBuy[math.random(#Dialog.MenuBuy)]
  NoteNPCTalk(Dialog.NPCName, Random, 1500) Wait(500)
  StoreInUse = true
  Array_Inv, Array_Store = {}, {}
  IndexAllData()
  TriggerEvent('DokusCore:Stores:OpenStore', 'Buy')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenStoreSell()
  ShowPrompt = false
  local Random = Dialog.MenuSell[math.random(#Dialog.MenuSell)]
  NoteNPCTalk(Dialog.NPCName, Random, 1500) Wait(500)
  Array_Inv, Array_Store = {}, {}
  IndexAllData()
  StoreInUse = true
  TriggerEvent('DokusCore:Stores:OpenStore', 'Sell')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Message(Type, Item, Amount)
  if (Type == 'NotEnough') then NoteObjective("ERROR", "You do not have this much in your inventory!", 'Alert', 5000) end
  if (Type == 'InDev') then NoteObjective("ERROR", 'This Option is in developement!', '', 5000) Wait(5000) end
  if (Type == 'NoMinNumber') then NoteObjective("ERROR", "You can not use negative numbers!", 'Alert', 5000) end
  if (Type == 'Buy') then NoteObjective("ERROR", "You've bought "..Amount.." "..Item.."'s", 'Alert', 5000) end
  if (Type == 'Sell') then NoteObjective("ERROR", "You've sold "..Amount.." "..Item.."'s", 'Alert', 5000) end
  if (Type == 'NoBuyMoney') then NoteObjective("ERROR", "You've not enough money to buys this / these amount of items!", 'Alert', 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
