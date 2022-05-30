--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- NOTE: DO NOT CHANGE ANYTHING IN THIS FILE!!!!!!!
-- THIS PLUGIN IS NOT CUSTOMIZABLE!!!!!
--------------------------------------------------------------------------------
-- If any of the information or load order is changed it will break this plugin.
-- This is also a mandatory plugin for DokusCore, without players are unable to
-- change there client and character settings and many more.
--------------------------------------------------------------------------------

AdminMenu = {
  {
    MenuName = 'AdminMenu',
    MenuTitle = 'DokusCore Menu',
    MenuOptions = {
      { Type = 'Menu',   Option = 'TeleportMenu', Title = 'Teleport Menu' },
      { Type = 'Option', Option = 'WeatherSyncMenu', Title = 'Weather Sync Menu' },
      { Type = 'Menu',   Option = 'AdminSelfActionsMenu', Title = 'Self Actions' },
      { Type = 'Menu',   Option = 'ModuleSyncMenu', Title = 'Modules Sync Menu' },
    }
  }
}

TeleportMenu = {
  {
    MenuName = 'TeleportMenu',
    MenuTitle = 'DokusCore Menu',
    MenuOptions = {
      { Type = 'Option', Option = 'TPM', Title = 'Teleport To Marker' },
      { Type = 'Option', Option = 'TTC', Title = 'Teleport to Coords' },
    }
  }
}

AdminSelfActionsMenu = {
  {
    MenuName = 'AdminSelfActionsMenu',
    MenuTitle = 'Self Actions',
    MenuOptions = {
      { Type = 'Menu', Option = 'AdminMetamolismMenu', Title = 'Metabolism' },
    }
  }
}

AdminMetamolismMenu = {
  {
    MenuName = 'AdminMetamolismMenu',
    MenuTitle = 'Metabolism Actions',
    MenuOptions = {
      { Type = 'Option', Option = 'ASelfHeal',   Title = 'Heal Yourself' },
      { Type = 'Option', Option = 'ASelfStam',   Title = 'Heal Stamina' },
      { Type = 'Option', Option = 'ASelfHunger', Title = 'Heal Hunger' },
      { Type = 'Option', Option = 'ASelfThirst', Title = 'Heal Thirst' },
    }
  }
}

ModuleSyncMenu = {
  {
    MenuName = 'ModuleSyncMenu',
    MenuTitle = 'Module Sync Menu',
    MenuOptions = {
      { Type = 'Option', Option = 'SyncUsableItems',   Title = 'Sync UsableItems' },
      { Type = 'Option', Option = 'SyncStoreItems',    Title = 'Sync Store Items' },
    }
  }
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
