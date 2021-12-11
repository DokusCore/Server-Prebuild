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

_DokusMenus = {
  MainMenu = {
    {
      MenuName = 'MainMenu',
      MenuTitle = 'DokusCore Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'Inventory', Title = 'Inventory' },
        { Type = 'Menu', Option = 'SettingsMenu', Title = 'Settings' },
        { Type = 'Menu', Option = 'FunctionsMenu', Title = 'Character Menu' },
        { Type = 'Menu', Option = 'MusicMenu', Title = 'Music' },
      }
    }
  },

  SettingsMenu = {
    {
      MenuName = 'SettingsMenu',
      MenuTitle = 'Settings Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'LanguageMenu', Title = 'Change Language' },
        { Type = 'Option', Option = 'ToggleMusic', Title = 'Toggle Music' },
      }
    }
  },

  LangList1 = {
    {
      MenuName = 'LangList1',
      MenuTitle = 'Language Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'English', Title = 'English' },
        { Type = 'Option', Option = 'German', Title = 'German' },
        { Type = 'Option', Option = 'Italian', Title = 'Italian' },
        { Type = 'Option', Option = 'Russian', Title = 'Russian' },
        { Type = 'Option', Option = 'France', Title = 'France' },
        { Type = 'Option', Option = 'Spanish', Title = 'Spanish' },
      }
    }
  },

  LangList2 = {
    {
      MenuName = 'LangList2',
      MenuTitle = 'Language Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'Bulgarian', Title = 'Bulgarian' },
        { Type = 'Option', Option = 'Danish', Title = 'Danish' },
        { Type = 'Option', Option = 'Greek', Title = 'Greek' },
        { Type = 'Option', Option = 'Dutch', Title = 'Dutch' },
        { Type = 'Option', Option = 'Polish', Title = 'Polish' },
        { Type = 'Option', Option = 'Portuguese', Title = 'Portuguese' },
      }
    }
  },

  FunctionsMenu = {
    {
      MenuName = 'FunctionsMenu',
      MenuTitle = 'Functions Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'Logout', Title = 'Logout' },
        { Type = 'Option', Option = 'SaveCoords', Title = 'Save Location' },
        { Type = 'Menu', Option = 'SkinMenu', Title = 'Skin Menu' },
      }
    }
  },

  SkinMenu = {
    {
      MenuName = 'SkinMenu',
      MenuTitle = 'Skin Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'Menu', Title = 'Open Menu' },
        { Type = 'Option', Option = 'Load', Title = 'Load Skin' },
      }
    }
  },

  MusicMenu = {
    {
      MenuName = 'MusicMenu',
      MenuTitle = 'Music Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'StopMusic', Title = 'Stop Music' },
        { Type = 'menu',   Option = 'AutoPlay',  Title = 'Auto Play' },
        { Type = 'Menu',   Option = 'Volume',    Title = 'Volume' },
        { Type = 'Menu',   Option = 'Playlist',  Title = 'Playlist' },
      }
    }
  },

  AutoPlay = {
    {
      MenuName = 'AutoPlay',
      MenuTitle = 'AutoPlay Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'AutoPlayAll',       Title = 'All Genres' },
        { Type = 'menu',   Option = 'AutoPlayChoose',    Title = 'Choose Playlist' },
      }
    }
  },

  Playlist = {
    {
      MenuName = 'Playlist',
      MenuTitle = 'Playlist Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'ModernMusicMenu', Title = 'Modern Music' },
        { Type = 'Menu', Option = 'WesternMusicMenu', Title = 'Western Music' },
      }
    }
  },

  AutoPlaylistMenu = {
    {
      MenuName = 'AutoPlaylistMenu',
      MenuTitle = 'Playlist Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'TheScore', Title = 'The Score' },
        { Type = 'Menu', Option = 'WesternRDR', Title = 'Western RDR' },
        -- { Type = 'Menu', Option = 'BobMarley', Title = 'Bob Marley' },
        { Type = 'Menu', Option = 'Others', Title = 'Others' },
      }
    }
  },

  Volume = {
    {
      MenuName = 'Volume',
      MenuTitle = 'Volume Menu',
      MenuOptions = {
        { Type = 'Option', Option = '5', Title = '5%' },
        { Type = 'Option', Option = '10', Title = '10%' },
        { Type = 'Option', Option = '15', Title = '15%' },
        { Type = 'Option', Option = '20', Title = '20%' },
        { Type = 'Option', Option = '25', Title = '25%' },
        { Type = 'Option', Option = '30', Title = '30%' },
      }
    }
  },

  Volume2 = {
    {
      MenuName = 'Volume2',
      MenuTitle = 'Volume Menu',
      MenuOptions = {
        { Type = 'Option', Option = '35', Title = '35%' },
        { Type = 'Option', Option = '40', Title = '40%' },
        { Type = 'Option', Option = '45', Title = '45%' },
        { Type = 'Option', Option = '50', Title = '50%' },
        { Type = 'Option', Option = '55', Title = '55%' },
        { Type = 'Option', Option = '60', Title = '60%' },
      }
    }
  },

  Volume3 = {
    {
      MenuName = 'Volume2',
      MenuTitle = 'Volume Menu',
      MenuOptions = {
        { Type = 'Option', Option = '65', Title = '65%' },
        { Type = 'Option', Option = '70', Title = '70%' },
        { Type = 'Option', Option = '75', Title = '75%' },
        { Type = 'Option', Option = '80', Title = '80%' },
        { Type = 'Option', Option = '85', Title = '85%' },
        { Type = 'Option', Option = '90', Title = '90%' },
      }
    }
  },

  Volume4 = {
    {
      MenuName = 'Volume2',
      MenuTitle = 'Volume Menu',
      MenuOptions = {
        { Type = 'Option', Option = '95', Title = '95%' },
        { Type = 'Option', Option = '100', Title = '100%' },
      }
    }
  },

  ModernMusicMenu = {
    {
      MenuName = 'ModernMusicMenu',
      MenuTitle = 'Modern Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'BobMarley', Title = 'Bob Marley' },
        { Type = 'Menu', Option = 'TheScore', Title = 'The Score' },
        { Type = 'Menu', Option = 'ModernOtherMusic', Title = 'Other Music' },
      }
    }
  },

  WesternMusicMenu = {
    {
      MenuName = 'WesternMusicMenu',
      MenuTitle = 'Western Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'WesternRDR1', Title = 'Western ( Acoustic Themed )' },
      }
    }
  },


  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- WESTERN MUSIC
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  WesternRDR1 = {
    {
      MenuName = 'WesternRDR1',
      MenuTitle = 'Read Dead Redemption',
      MenuOptions = {
        { Type = 'Option', Option = 'ApacheTribe', Title = 'Apache Tribe' },
        { Type = 'Option', Option = 'BillyTheKid', Title = 'Billy The Kid' },
        { Type = 'Option', Option = 'CactusDesert', Title = 'Cactus Desert' },
        { Type = 'Option', Option = 'CampfireTales', Title = 'Campfire Tales' },
        { Type = 'Option', Option = 'GhostTown', Title = 'Ghost Town' },
        { Type = 'Option', Option = 'GoldRush', Title = 'Gold Rush' },
      }
    }
  },

  WesternRDR2 = {
    {
      MenuName = 'WesternRDR2',
      MenuTitle = 'Read Dead Redemption',
      MenuOptions = {
        { Type = 'Option', Option = 'GunslingingOutlaws', Title = 'Gunslinging Outlaws' },
        { Type = 'Option', Option = 'IndianCamp', Title = 'Indian Camp' },
        { Type = 'Option', Option = 'LegendsoftheWest', Title = 'Legends of the West' },
        { Type = 'Option', Option = 'NightinthePrairie', Title = 'Night in the Prairie' },
        { Type = 'Option', Option = 'NoMansLand', Title = 'No Mans Land' },
        { Type = 'Option', Option = 'OldMiningTown', Title = 'Old Mining Town' },
      }
    }
  },

  WesternRDR3 = {
    {
      MenuName = 'WesternRDR3',
      MenuTitle = 'Read Dead Redemption',
      MenuOptions = {
        { Type = 'Option', Option = 'RowdyCowboys', Title = 'Rowdy Cowboys' },
        { Type = 'Option', Option = 'TheGreatMountain', Title = 'The Great Mountain' },
        { Type = 'Option', Option = 'TheOldTrain', Title = 'The Old Train' },
        { Type = 'Option', Option = 'TheOregonTrail', Title = 'The Oregon Trail' },
        { Type = 'Option', Option = 'TheWildWest', Title = 'The Wild West' },
        { Type = 'Option', Option = 'TumbleweedTown', Title = 'Tumbleweed Town' },
      }
    }
  },

  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- MODERN MUSIC
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  BobMarley = {
    {
      MenuName = 'BobMarley',
      MenuTitle = 'Bob Marley',
      MenuOptions = {
        { Type = 'Option', Option = 'BM-IShotTheSheriff', Title = 'I Shot the Sheriff' },
      }
    }
  },

  TheScore1 = {
    {
      MenuName = 'TheScore1',
      MenuTitle = 'The Score',
      MenuOptions = {
        { Type = 'Option', Option = 'TheScore-Revolution_', Title = 'Revolution' },
        { Type = 'Option', Option = 'TheScore-Stronger', Title = 'Stronger' },
        { Type = 'Option', Option = 'TheScore-TheFear',  Title = 'The Fear' },
        { Type = 'Option', Option = 'TheScore-TheHeat', Title = 'The Heat' },
        { Type = 'Option', Option = 'TheScore-Unstoppable', Title = 'Unstoppable' },
        { Type = 'Option', Option = 'TheScore-WhoIAm', Title = 'Who I Am' },
      }
    }
  },

  ModernOtherMusic = {
    {
      MenuName = 'ModernOtherMusic',
      MenuTitle = 'Others',
      MenuOptions = {
        { Type = 'Option', Option = 'RunHome', Title = 'Run Home' },
        { Type = 'Option', Option = 'ThemeSong', Title = 'The Revolution' },
      }
    }
  },

  AutoplayList = {
    All = {
      { Song = 'TheScore-Revolution_',         Time = 232000 },
      { Song = 'TheScore-Stronger',            Time = 191000 },
      { Song = 'TheScore-TheFear',             Time = 191000 },
      { Song = 'TheScore-TheHeat',             Time = 220000 },
      { Song = 'TheScore-Unstoppable',         Time = 190000 },
      { Song = 'TheScore-WhoIAm',              Time = 394000 },
      { Song = 'TheScore-Revolution_',         Time = 232000 },
      { Song = 'TheScore-Stronger',            Time = 191000 },
      { Song = 'TheScore-TheFear',             Time = 191000 },
      { Song = 'TheScore-TheHeat',             Time = 220000 },
      { Song = 'TheScore-Unstoppable',         Time = 190000 },
      { Song = 'TheScore-WhoIAm',              Time = 394000 },
      { Song = 'ApacheTribe',                  Time = 194000 },
      { Song = 'BillyTheKid',                  Time = 212000 },
      { Song = 'CactusDesert',                 Time = 190000 },
      { Song = 'CampfireTales',                Time = 216000 },
      { Song = 'GhostTown',                    Time = 223000 },
      { Song = 'GoldRush',                     Time = 252000 },
      { Song = 'GunslingingOutlaws',           Time = 210000 },
      { Song = 'IndianCamp',                   Time = 200000 },
      { Song = 'LegendsoftheWest',             Time = 191000 },
      { Song = 'NightinthePrairie',            Time = 225000 },
      { Song = 'NoMansLand',                   Time = 230000 },
      { Song = 'OldMiningTown',                Time = 193000 },
      { Song = 'RowdyCowboys',                 Time = 190000 },
      { Song = 'TheGreatMountain',             Time = 217000 },
      { Song = 'TheOldTrain',                  Time = 199000 },
      { Song = 'TheOregonTrail',               Time = 202000 },
      { Song = 'TheWildWest',                  Time = 204000 },
      { Song = 'TumbleweedTown',               Time = 234000 },
      { Song = 'BM-IShotTheSheriff',           Time = 229000 },
      { Song = 'BrotherDege-TooOldToDieYoung', Time = 225000 },
      { Song = 'RunHome',                      Time = 160000 },
    },

    TheScore = {
      { Song = 'TheScore-Revolution_', Time = 232000 },
      { Song = 'TheScore-Stronger',    Time = 191000 },
      { Song = 'TheScore-TheFear',     Time = 191000 },
      { Song = 'TheScore-TheHeat',     Time = 220000 },
      { Song = 'TheScore-Unstoppable', Time = 190000 },
      { Song = 'TheScore-WhoIAm',      Time = 394000 },
    },

    WesternRDR = {
      { Song = 'ApacheTribe',        Time = 194000 },
      { Song = 'BillyTheKid',        Time = 212000 },
      { Song = 'CactusDesert',       Time = 190000 },
      { Song = 'CampfireTales',      Time = 216000 },
      { Song = 'GhostTown',          Time = 223000 },
      { Song = 'GoldRush',           Time = 252000 },
      { Song = 'GunslingingOutlaws', Time = 210000 },
      { Song = 'IndianCamp',         Time = 200000 },
      { Song = 'LegendsoftheWest',   Time = 191000 },
      { Song = 'NightinthePrairie',  Time = 225000 },
      { Song = 'NoMansLand',         Time = 230000 },
      { Song = 'OldMiningTown',      Time = 193000 },
      { Song = 'RowdyCowboys',       Time = 190000 },
      { Song = 'TheGreatMountain',   Time = 217000 },
      { Song = 'TheOldTrain',        Time = 199000 },
      { Song = 'TheOregonTrail',     Time = 202000 },
      { Song = 'TheWildWest',        Time = 204000 },
      { Song = 'TumbleweedTown',     Time = 234000 },
    },

    -- BobMarley = {
    --
    -- },

    Others = {
      { Song = 'BM-IShotTheSheriff',           Time = 229000 },
      { Song = 'BrotherDege-TooOldToDieYoung', Time = 225000 },
      { Song = 'RunHome',                      Time = 160000 },
    },
  }
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
