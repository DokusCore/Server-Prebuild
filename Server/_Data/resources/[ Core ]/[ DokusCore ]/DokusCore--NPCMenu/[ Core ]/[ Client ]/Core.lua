--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
UserData = nil
InMenu = ''
MenuOpen = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:NPCInteract:OpenMenu')
AddEventHandler('DokusCore:NPCInteract:OpenMenu', function(Data)
  UserData = GetData()
  local GetMenu = nil
  if (_Modules.NPCInteract) then
    MenuOpen = true
    TriggerEvent('DokusCore:NPCInteract:DisableInterKey')
    if (Low(Data.Menu) == 'bankmenu') then
      InMenu = 'BankMenu'
      local BM = _NPCInteract.BankMenu[1]
      local MenuTitle = Data.MenuTitle
      local rNR = math.random(#BM.Dialogs)
      local rDia = BM.Dialogs[rNR]
      local Name  = BM.MenuName
      Menu(Name, BM, rDia, MenuTitle)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:NPCInteract:DisableInterKey')
AddEventHandler('DokusCore:NPCInteract:DisableInterKey', function()
  while MenuOpen do Wait(0)
    DisableControlAction(0, _Keys['LALT'], true)
  end
end)



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
