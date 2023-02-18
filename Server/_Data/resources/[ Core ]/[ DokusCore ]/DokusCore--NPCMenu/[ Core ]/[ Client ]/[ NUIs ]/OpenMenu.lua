--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenMenu', function(Data)
  if (Data.Menu == 'BankMenu') then
    local BM = _NPCInteract.BankMenu[1]
    local rNR = math.random(#BM.Dialogs)
    local rDia = BM.Dialogs[rNR]
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'BankMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _NPCInteract.BankMenu[1], Dialog = rDia })
  elseif (Data.Menu == 'BankAccountMenu') then
    local BM = _NPCInteract.BankAccountMenu[1]
    local rNR = math.random(#BM.Dialogs)
    local rDia = BM.Dialogs[rNR]
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'BankAccountMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _NPCInteract.BankAccountMenu[1], Dialog = rDia  })
  elseif (Data.Menu == 'BankVaultMenu') then
    local BM = _NPCInteract.BankVaultMenu[1]
    local rNR = math.random(#BM.Dialogs)
    local rDia = BM.Dialogs[rNR]
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'BankVaultMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _NPCInteract.BankVaultMenu[1], Dialog = rDia })
  elseif (Data.Menu == 'CreateBankAccount') then
    local BM = _NPCInteract.CreateBankAccount[1]
    local rNR = math.random(#BM.Dialogs)
    local rDia = BM.Dialogs[rNR]
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'CreateBankAccount' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _NPCInteract.CreateBankAccount[1], Dialog = rDia })
  elseif (Data.Menu == 'ScratchTickets') then
    local BM = _NPCInteract.ScratchTickets[1]
    local rNR = math.random(#BM.Dialogs)
    local rDia = BM.Dialogs[rNR]
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ScratchTickets' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _NPCInteract.ScratchTickets[1], Dialog = rDia })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
