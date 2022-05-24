--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Teleport', function(Data)
  if (Data.Option == 'TPM') then TriggerEvent('DokusCore:Core:Admin:Commands:TPM') CloseMenu() return end
  if (Data.Option == 'TTC') then TriggerEvent('DokusCore:Core:Admin:Commands:TeleportTC') CloseMenu() return end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ASelfMenu', function(Data)
  if (Data.Option == 'HealHealth') then TriggerEvent('DokusCore:Metabolism:Heal:Health') return end
  if (Data.Option == 'HealStamina') then TriggerEvent('DokusCore:Metabolism:Heal:Stamina') return end
  if (Data.Option == 'HealHunger') then print("healing Hunger") TriggerEvent('DokusCore:Metabolism:Heal:Hunger') return end
  if (Data.Option == 'HealThirst') then TriggerEvent('DokusCore:Metabolism:Heal:Thirst') return end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SyncUsableItems', function(Data) TriggerEvent('DokusCore:UsableItems:Sync') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SyncStoreItems', function(Data) TriggerEvent('DokusCore:Stores:ReSyncStoreItems') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
