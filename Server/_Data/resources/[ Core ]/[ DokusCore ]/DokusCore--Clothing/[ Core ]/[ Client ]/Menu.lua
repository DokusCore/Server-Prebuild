--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
CreateThread(function()
  DokusMenu.CreateMenu('DressingRoom',  'Dressing Room', '')
  DokusMenu.CreateMenu('YourOutfits',   'Dressing Room', '')
  DokusMenu.CreateMenu('Confirmation',  'Confirmation', '')
  DokusMenu.SetSubTitle('Confirmation', "Do you want to switch clothing?")
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local OutFitName = nil
RegisterNetEvent('DokusCore:Clothing:OutfitMenu', function()
  MenuInUse, ShowPrompts = true, false
  local DokusPage = DokusMenu.IsMenuOpened
  local Data = TSC('DokusCore:Core:DBGet:Outfits', { 'User', 'Single', { SteamID, CharID } }).Result
  DokusMenu.OpenMenu('DressingRoom')
  while MenuInUse do Wait(1)
    ShowPrompts = false
    if DokusPage('DressingRoom') then DressingRoom() end
    if DokusPage('YourOutfits') then YourOutfits(Data) end
    if DokusPage('Confirmation') then Confirmation() end
  end Wait(2000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When menu is open let users use backspace to toggle the last menu
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:BackSpace')
AddEventHandler('DokusCore:Clothing:BackSpace', function()
  local Close = DokusMenu.CloseMenu
  local Open  = DokusMenu.OpenMenu
  while ((MenuInUse) and (NearNPC)) do Wait(0)
    if IsControlJustPressed(0, _Keys['BACKSPACE']) then
      if (MenuPage == 'DressingRoom') then Open('DressingRoom') end
      if (MenuPage == 'YourOutfits') then Open('DressingRoom') end
      if (MenuPage == 'Confirmation') then Open('YourOutfits') end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DressingRoom()
  MenuPage        = 'DressingRoom'
  local Outfits   = DokusMenu.Button('My Outfit')
  local Exit      = DokusMenu.Button('Exit')
  if ( Outfits ) then DokusMenu.OpenMenu('YourOutfits') end
  if ( Exit )    then
    MenuInUse, ShowPrompts = false, true
    Prompt_Menu    = nil
    Prompt_Outfits = nil
    Group          = GetRandomIntInRange(0, 0xffffff)
    TriggerEvent('DokusCore:Clothing:ShowPrompt')
    DokusMenu.CloseMenu()
  end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function YourOutfits(Data)
  MenuPage = 'YourOutfits'
  for k,v in pairs(Data) do
    local Button = DokusMenu.Button(v.Name)
    if (Button) then OutFitName = v.Name DokusMenu.OpenMenu('Confirmation') end
  end
  local Exit      = DokusMenu.Button('Exit')
  if ( Exit )    then
    MenuInUse, ShowPrompts = false, true
    Prompt_Menu    = nil
    Prompt_Outfits = nil
    Group          = GetRandomIntInRange(0, 0xffffff)
    TriggerEvent('DokusCore:Clothing:ShowPrompt')
    DokusMenu.CloseMenu()
  end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Confirmation()
  MenuPage   = 'Confirmation'
  local Yes  = DokusMenu.Button('Yes')
  local No   = DokusMenu.Button('No')
  if ( Yes ) then ExecNewClothes() end
  if ( No )  then DokusMenu.OpenMenu('YourOutfits') end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ExecNewClothes()
  MenuPage   = nil
  MenuInUse = false
  ShowPrompts = true
  ChangingClothes = true
  DokusMenu.CloseMenu()
  SetClothingData()
  SetPedClothingData()


  local Cloth = TSC('DokusCore:Core:DBGet:Outfits', { 'User', 'Single', { SteamID, CharID } }).Result
  for k,v in pairs(Cloth) do
    if (Low(v.Name) == (Low(OutFitName))) then
      TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Clothing', { SteamID, CharID, v.Outfit } })
    end
  end

  TaskGoToCoordAnyMeans(PedID(), vec3(2551.1, -1159.8, 53.7), 1.0, 0, 0, 786603, 0xbf800000)
  Wait(2500) UIFadeOut(5000)
  local OldPos = GetCoords(PedID())
  Wait(5000)
  TriggerEvent('DokusCore:Skins:Load:User') Wait(500)
  TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  Wait(1000) UIFadeIn(2500)
  TaskGoToCoordAnyMeans(PedID(), OldPos, 1.0, 0, 0, 786603, 0xbf800000)
  Wait(7000)
  ChangingClothes = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
