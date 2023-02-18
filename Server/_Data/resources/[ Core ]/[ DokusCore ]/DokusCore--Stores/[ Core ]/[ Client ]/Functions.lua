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
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Stores", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CloseStore() SetNuiFocus(false, false) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetBlips()
  for k,v in pairs(_Stores.General) do
    if (v.Enabled) then
      Tabi(Blips, SetBlip(v.Coords, v.BlipHash, 1.0, v.NPCName))
    end
  end

  for k,v in pairs(_Stores.Custom) do
    if (v.Enabled) then
      Tabi(Blips, SetBlip(v.Coords, v.BlipHash, 1.0, v.NPCName))
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenGeneralBuyStore()
  Radar(false)
  StoreInUse, PausePrompts = true, true
  Array_Store, Array_Inv = {}, {}
  IndexItemDataGeneralStore()
  IndexItemDataGeneralInv()
  SetNuiFocus(true, true)
  SendNUIMessage({
    Type = 'Buy',
    Display = true,
    IsCustom = false,
    StoreData = Array_Store,
    ShopName = MSG("MenuBuy").MSG
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenGeneralSellStore()
  Radar(false)
  StoreInUse, PausePrompts = true, true
  Array_Store, Array_Inv = {}, {}
  IndexItemDataGeneralStore()
  IndexItemDataGeneralInv()
  SetNuiFocus(true, true)
  SendNUIMessage({
    Type = 'Sell',
    Display = true,
    IsCustom = false,
    StoreData = Array_Inv,
    ShopName = MSG("MenuSell").MSG
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenCustomBuyStore()
  Radar(false)
  StoreInUse, PausePrompts = true, true
  Array_Store, Array_Inv = {}, {}
  IndexItemDataCustomStore()
  IndexItemDataCustomInv()
  SetNuiFocus(true, true)
  SendNUIMessage({
    Type = 'Buy',
    Display = true,
    IsCustom = false,
    StoreData = Array_Store,
    ShopName = CustomNPCData.NPCName
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenCustomSellStore()
  Radar(false)
  StoreInUse, PausePrompts = true, true
  Array_Store, Array_Inv = {}, {}
  IndexItemDataCustomStore()
  IndexItemDataCustomInv()
  SetNuiFocus(true, true)
  SendNUIMessage({
    Type = 'Sell',
    Display = true,
    IsCustom = false,
    StoreData = Array_Inv,
    ShopName = CustomNPCData.NPCName
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  Prompt_Buy  = nil
  Prompt_Sell = nil
  Group       = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataGeneralInv()
  for k,v in pairs(_Stores.General) do
    if (City == Low(v.City)) then
      for k,v in pairs(v.Items) do
        if (v.Price.Sell[1]) then
          local Sync = TCTCC('DokusCore:Sync:Get:UserData')
          local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, v.Item } }
          local Items = TSC('DokusCore:Core:DBGet:Inventory', Index)
          if (Items.Exist) then
            if (Low(Items.Result[1].Item) == Low(v.Item)) then
              table.insert(Array_Inv, {
                Item = v.Item,
                Name = Items.Result[1].Name,
                Type = Items.Result[1].Type,
                Desc = Items.Result[1].Description,
                Sell  = v.Price.Sell[2]
              })
            end
          end
        end
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataGeneralStore()
  for k,v in pairs(_Stores.General) do
    if (City == Low(v.City)) then
      -- If Items are Sync take the sync table instead.
      if (v.Type ~= nil) then
        for o,p in pairs(_Stores.ItemSync) do
          if (Low(p.Type) == Low(v.Type)) then
            for o,p in pairs(p.Items) do
              if (p.Price.Buy[1]) then
                local Items = TSC('DokusCore:Core:DBGet:Items', { 'Single', { p.Item } })
                table.insert(Array_Store, {
                  Item = p.Item,
                  Name = Items.Result[1].Name,
                  Type = Items.Result[1].Type,
                  Desc = Items.Result[1].Description,
                  Buy  = p.Price.Buy[2]
                })
              end
            end
          end
        end
      elseif (v.Type == nil) then
        for k,v in pairs(v.Items) do
          if (v.Price.Buy[1]) then
            local Items = TSC('DokusCore:Core:DBGet:Items', { 'Single', { v.Item } })
            table.insert(Array_Store, {
              Item = v.Item,
              Name = Items.Result[1].Name,
              Type = Items.Result[1].Type,
              Desc = Items.Result[1].Description,
              Buy  = v.Price.Buy[2]
            })
          end
        end
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataCustomInv()
  for k,v in pairs(CustomNPCData.Items) do
    if (v.Price.Sell[1]) then
      local Sync = TCTCC('DokusCore:Sync:Get:UserData')
      local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, v.Item } }
      local Items = TSC('DokusCore:Core:DBGet:Inventory', Index)
      if (Items.Exist) then
        if (Low(Items.Result[1].Item) == Low(v.Item)) then
          table.insert(Array_Inv, {
            Item = v.Item,
            Name = Items.Result[1].Name,
            Type = Items.Result[1].Type,
            Desc = Items.Result[1].Description,
            Sell  = v.Price.Sell[2]
          })
        end
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IndexItemDataCustomStore()
  for k,v in pairs(CustomNPCData.Items) do
    if (v.Price.Buy[1]) then
      local Items = TSC('DokusCore:Core:DBGet:Items', { 'Single', { v.Item } })
      table.insert(Array_Store, {
        Item = v.Item,
        Name = Items.Result[1].Name,
        Type = Items.Result[1].Type,
        Desc = Items.Result[1].Description,
        Buy  = v.Price.Buy[2]
      })
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Message(Type, Item, Amount)
  if (Type == 'NotEnough') then NoteNPCTalk(SYS("Error").MSG, MSG("NotInInvent").MSG, true, Floor(MSG("NotInInvent").Time * 1000)) end
  if (Type == 'InDev') then NoteNPCTalk(SYS("Error").MSG, SYS("InDevelopment").MSG, true, Floor(MSG("InDevelopment").Time * 1000)) Wait(5000) end
  if (Type == 'Buy') then NoteNPCTalk(SYS("Success").MSG, MSG("Bought").MSG .. Amount .. " " .. Item .. "'s", true, Floor(MSG("Bought").Time * 1000)) end
  if (Type == 'Sell') then NoteNPCTalk(SYS("Success").MSG, MSG("Sold").MSG .. Amount .. " " .. Item .. "'s", true, Floor(MSG("Sold").Time * 1000)) end
  if (Type == 'NoBuyMoney') then NoteNPCTalk(SYS("Error").MSG, MSG("NoMoney").MSG, true, Floor(MSG("NoMoney").Time * 1000)) end
end
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



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
