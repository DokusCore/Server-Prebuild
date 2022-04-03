var Menu = ''
var Keys = [];

window.addEventListener('message', function(event) {
  var Data = event.data
  var Action = Data.Action

  switch (Action) {
    case 'SetMenu':
      Menu = Data.Menu
      break;
    case 'OpenMenu':
      Keys = []
      IndexKeys(event.data.Menu);
      setTimeout(function() {
        OpenMenu(Keys);
      }, 100);
      break;
    case 'CloseMenu':
      CloseMenu();
    break;
    default:
  };
});

const IndexKeys = (Data) => {
  for (var i = 0; i < Data.MenuOptions.length; i++) {
    Keys.push({
      Type: Data.MenuOptions[i].Type,
      Option: Data.MenuOptions[i].Option,
      Title: Data.MenuOptions[i].Title
    })
  }
};

const OpenMenu = (Data) => {
  for (var i = 0; i < Keys.length; i++) {
    if (i <= 6) {
      $("#option" + i).show();
      $("#option" + i).html(Keys[i].Title);
    };

    if (i < 6) {
      for (let i = Keys.length; i < 6; i++) {
        $("#option" + i).hide();
      };
    };
  };

  $('body').fadeIn();
};

const InitData = (nr) => {
  // Page 1
  if ((Menu == 'MainMenu') && (nr == 0))         { OpenInventory();                                    };
  if ((Menu == 'MainMenu') && (nr == 1))         { OpenThisMenu('SettingsMenu');                       };
  if ((Menu == 'MainMenu') && (nr == 2))         { OpenThisMenu('FunctionsMenu');                      };
  if ((Menu == 'MainMenu') && (nr == 3))         { OpenThisMenu('MusicMenu');                          };
  if ((Menu == 'MainMenu') && (nr == 4))         { OpenThisMenu('AdminMenu');                          };
  if ((Menu == 'MainMenu') && (nr == 5))         { OpenThisMenu('InfoMenu');                           };

  if ((Menu == 'SettingsMenu') && (nr == 0))     { OpenThisMenu('LangList1');                          };
  if ((Menu == 'SettingsMenu') && (nr == 1))     { ToggleOption('ToggleMusic');                        };


  if ((Menu == 'InfoMenu') && (nr == 0))         { ToggleOption('ShowDiscord');                        };

  // Admin Actions
  if ((Menu == 'AdminMenu') && (nr == 0))        { OpenThisMenu('TeleportMenu');                       };
  if ((Menu == 'AdminMenu') && (nr == 1))        { OpenThisMenu('AdminSelfActionsMenu');               };
  if ((Menu == 'AdminMenu') && (nr == 2))        { OpenThisMenu('ModuleSyncMenu');                     };
  if ((Menu == 'TeleportMenu') && (nr == 0))     { ToggleOption('Teleport', 'TPM'); CloseMenu();       };
  if ((Menu == 'AdminSelfActionsMenu') && (nr == 0)) { OpenThisMenu('AdminMetamolismMenu');            };

  if ((Menu == 'AdminMetamolismMenu') && (nr == 0))        { ToggleOption('ASelfMenu', 'HealHealth');  };
  if ((Menu == 'AdminMetamolismMenu') && (nr == 1))        { ToggleOption('ASelfMenu', 'HealStamina'); };
  if ((Menu == 'AdminMetamolismMenu') && (nr == 2))        { ToggleOption('ASelfMenu', 'HealHunger');  };
  if ((Menu == 'AdminMetamolismMenu') && (nr == 3))        { ToggleOption('ASelfMenu', 'HealThirst');  };

  if ((Menu == 'ModuleSyncMenu') && (nr == 0))        { ToggleOption('SyncUsableItems');  };

  if ((Menu == 'LangList1') && (nr == 0))        { ToggleOption('ChangeLanguage', 'en');               };
  if ((Menu == 'LangList1') && (nr == 1))        { ToggleOption('ChangeLanguage', 'de');               };
  if ((Menu == 'LangList1') && (nr == 2))        { ToggleOption('ChangeLanguage', 'it');               };
  if ((Menu == 'LangList1') && (nr == 3))        { ToggleOption('ChangeLanguage', 'ru');               };
  if ((Menu == 'LangList1') && (nr == 4))        { ToggleOption('ChangeLanguage', 'fr');               };
  if ((Menu == 'LangList1') && (nr == 5))        { ToggleOption('ChangeLanguage', 'es');               };
  if ((Menu == 'LangList2') && (nr == 0))        { ToggleOption('ChangeLanguage', 'bg');               };
  if ((Menu == 'LangList2') && (nr == 1))        { ToggleOption('ChangeLanguage', 'dk');               };
  if ((Menu == 'LangList2') && (nr == 2))        { ToggleOption('ChangeLanguage', 'gr');               };
  if ((Menu == 'LangList2') && (nr == 3))        { ToggleOption('ChangeLanguage', 'nl');               };
  if ((Menu == 'LangList2') && (nr == 4))        { ToggleOption('ChangeLanguage', 'pl');               };
  if ((Menu == 'LangList2') && (nr == 5))        { ToggleOption('ChangeLanguage', 'pt');               };

  if ((Menu == 'MusicMenu') && (nr == 0))        { ToggleOption('StopMusic');                          };
  if ((Menu == 'MusicMenu') && (nr == 1))        { OpenThisMenu('AutoPlay');                           };
  if ((Menu == 'MusicMenu') && (nr == 2))        { OpenThisMenu('Volume');                             };
  if ((Menu == 'MusicMenu') && (nr == 3))        { OpenThisMenu('Playlist');                           };

  if ((Menu == 'AutoPlay') && (nr == 0))         { ToggleOption('AutoPlayMusic', 'All');               };
  if ((Menu == 'AutoPlay') && (nr == 1))         { OpenThisMenu('AutoPlaylistMenu');                   };

  if ((Menu == 'AutoPlaylistMenu') && (nr == 0)) { ToggleOption('AutoPlayMusic', 'TheScore');          };
  if ((Menu == 'AutoPlaylistMenu') && (nr == 1)) { ToggleOption('AutoPlayMusic', 'WesternRDR');        };
  if ((Menu == 'AutoPlaylistMenu') && (nr == 2)) { ToggleOption('AutoPlayMusic', 'BobMarley');         };
  if ((Menu == 'AutoPlaylistMenu') && (nr == 3)) { ToggleOption('AutoPlayMusic', 'Others');            };

  if ((Menu == 'Playlist') && (nr == 0))         { OpenThisMenu('ModernMusicMenu');                    };
  if ((Menu == 'Playlist') && (nr == 1))         { OpenThisMenu('WesternMusicMenu');                   };

  if ((Menu == 'Volume') && (nr == 0))           { ToggleOption('SetVolume', 0.05);                    };
  if ((Menu == 'Volume') && (nr == 1))           { ToggleOption('SetVolume', 0.10);                    };
  if ((Menu == 'Volume') && (nr == 2))           { ToggleOption('SetVolume', 0.15);                    };
  if ((Menu == 'Volume') && (nr == 3))           { ToggleOption('SetVolume', 0.20);                    };
  if ((Menu == 'Volume') && (nr == 4))           { ToggleOption('SetVolume', 0.25);                    };
  if ((Menu == 'Volume') && (nr == 5))           { ToggleOption('SetVolume', 0.30);                    };
  if ((Menu == 'Volume2') && (nr == 0))          { ToggleOption('SetVolume', 0.35);                    };
  if ((Menu == 'Volume2') && (nr == 1))          { ToggleOption('SetVolume', 0.40);                    };
  if ((Menu == 'Volume2') && (nr == 2))          { ToggleOption('SetVolume', 0.45);                    };
  if ((Menu == 'Volume2') && (nr == 3))          { ToggleOption('SetVolume', 0.50);                    };
  if ((Menu == 'Volume2') && (nr == 4))          { ToggleOption('SetVolume', 0.55);                    };
  if ((Menu == 'Volume2') && (nr == 5))          { ToggleOption('SetVolume', 0.60);                    };
  if ((Menu == 'Volume3') && (nr == 0))          { ToggleOption('SetVolume', 0.65);                    };
  if ((Menu == 'Volume3') && (nr == 1))          { ToggleOption('SetVolume', 0.70);                    };
  if ((Menu == 'Volume3') && (nr == 2))          { ToggleOption('SetVolume', 0.75);                    };
  if ((Menu == 'Volume3') && (nr == 3))          { ToggleOption('SetVolume', 0.80);                    };
  if ((Menu == 'Volume3') && (nr == 4))          { ToggleOption('SetVolume', 0.85);                    };
  if ((Menu == 'Volume3') && (nr == 5))          { ToggleOption('SetVolume', 0.90);                    };
  if ((Menu == 'Volume4') && (nr == 0))          { ToggleOption('SetVolume', 0.95);                    };
  if ((Menu == 'Volume4') && (nr == 1))          { ToggleOption('SetVolume', 1.00);                    };


  if ((Menu == 'FunctionsMenu') && (nr == 0))    { ToggleOption('Logout');                             };
  if ((Menu == 'FunctionsMenu') && (nr == 1))    { ToggleOption('SaveCoords');                         };
  if ((Menu == 'FunctionsMenu') && (nr == 2))    { OpenThisMenu('SkinMenu');                           };

  if ((Menu == 'SkinMenu') && (nr == 0))         { ToggleOption('SkinMenu', 'OpenMenu'); CloseMenu();  };
  if ((Menu == 'SkinMenu') && (nr == 1))         { ToggleOption('SkinMenu', 'LoadSkin'); CloseMenu();  };

  if ((Menu == 'WesternMusicMenu') && (nr == 0)) { OpenThisMenu('WesternRDR1');                        };

  if ((Menu == 'ModernMusicMenu') && (nr == 0))  { OpenThisMenu('BobMarley');                          };
  if ((Menu == 'ModernMusicMenu') && (nr == 1))  { OpenThisMenu('TheScore1');                          };
  if ((Menu == 'ModernMusicMenu') && (nr == 2))  { OpenThisMenu('ModernOtherMusic');                   };

  if ((Menu == 'TheScore1') && (nr == 0))        { ToggleOption('PlayMusic', 'TheScore-Revolution_');  };
  if ((Menu == 'TheScore1') && (nr == 1))        { ToggleOption('PlayMusic', 'TheScore-Stronger');     };
  if ((Menu == 'TheScore1') && (nr == 2))        { ToggleOption('PlayMusic', 'TheScore-TheFear');      };
  if ((Menu == 'TheScore1') && (nr == 3))        { ToggleOption('PlayMusic', 'TheScore-TheHeat');      };
  if ((Menu == 'TheScore1') && (nr == 4))        { ToggleOption('PlayMusic', 'TheScore-Unstoppable');  };
  if ((Menu == 'TheScore1') && (nr == 5))        { ToggleOption('PlayMusic', 'TheScore-WhoIAm');       };

  if ((Menu == 'WesternRDR1') && (nr == 0))      { ToggleOption('PlayMusic', 'ApacheTribe');           };
  if ((Menu == 'WesternRDR1') && (nr == 1))      { ToggleOption('PlayMusic', 'BillyTheKid');           };
  if ((Menu == 'WesternRDR1') && (nr == 2))      { ToggleOption('PlayMusic', 'CactusDesert');          };
  if ((Menu == 'WesternRDR1') && (nr == 3))      { ToggleOption('PlayMusic', 'CampfireTales');         };
  if ((Menu == 'WesternRDR1') && (nr == 4))      { ToggleOption('PlayMusic', 'GhostTown');             };
  if ((Menu == 'WesternRDR1') && (nr == 5))      { ToggleOption('PlayMusic', 'GoldRush');              };

  if ((Menu == 'WesternRDR2') && (nr == 0))      { ToggleOption('PlayMusic', 'GunslingingOutlaws');    };
  if ((Menu == 'WesternRDR2') && (nr == 1))      { ToggleOption('PlayMusic', 'IndianCamp');            };
  if ((Menu == 'WesternRDR2') && (nr == 2))      { ToggleOption('PlayMusic', 'LegendsoftheWest');      };
  if ((Menu == 'WesternRDR2') && (nr == 3))      { ToggleOption('PlayMusic', 'NightinthePrairie');     };
  if ((Menu == 'WesternRDR2') && (nr == 4))      { ToggleOption('PlayMusic', 'NoMansLand');            };
  if ((Menu == 'WesternRDR2') && (nr == 5))      { ToggleOption('PlayMusic', 'OldMiningTown');         };

  if ((Menu == 'WesternRDR3') && (nr == 0))      { ToggleOption('PlayMusic', 'RowdyCowboys');          };
  if ((Menu == 'WesternRDR3') && (nr == 1))      { ToggleOption('PlayMusic', 'TheGreatMountain');      };
  if ((Menu == 'WesternRDR3') && (nr == 2))      { ToggleOption('PlayMusic', 'TheOldTrain');           };
  if ((Menu == 'WesternRDR3') && (nr == 3))      { ToggleOption('PlayMusic', 'TheOregonTrail');        };
  if ((Menu == 'WesternRDR3') && (nr == 4))      { ToggleOption('PlayMusic', 'TheWildWest');           };
  if ((Menu == 'WesternRDR3') && (nr == 5))      { ToggleOption('PlayMusic', 'TumbleweedTown');        };

  if ((Menu == 'BobMarley') && (nr == 0))        { ToggleOption('PlayMusic', 'BM-IShotTheSheriff');    };

  if ((Menu == 'ModernOtherMusic') && (nr == 0)) { ToggleOption('PlayMusic', 'RunHome');               };
  if ((Menu == 'ModernOtherMusic') && (nr == 1)) { ToggleOption('PlayMusic', 'ThemeSong');             };
};

const OpenInventory = () => {
  Menu = ''
  Keys = []
  $('body').fadeOut();
  ToggleOption('Close')
  ToggleOption('OpenInventory')
};

const CloseMenu = () => {
  Menu = ''
  Keys = []
  $('body').fadeOut();
  OpenThisMenu('');
  ToggleOption('Close');
};

const OpenThisMenu = (M) => { $.post('https://DokusCore--CoreMenu/OpenMenu', JSON.stringify({ Menu: M })); }
const ToggleOption = (M, Opt) => {
  if (Opt == null || Opt == undefined) {
    $.post('https://DokusCore--CoreMenu/'+M, JSON.stringify({}));
  } else {
    $.post('https://DokusCore--CoreMenu/'+M, JSON.stringify({ Option: Opt }));
  };
};

$(document).on('click', "#option0", function() { ToggleOption('Cooldown'); InitData(0); });
$(document).on('click', "#option1", function() { ToggleOption('Cooldown'); InitData(1); });
$(document).on('click', "#option2", function() { ToggleOption('Cooldown'); InitData(2); });
$(document).on('click', "#option3", function() { ToggleOption('Cooldown'); InitData(3); });
$(document).on('click', "#option4", function() { ToggleOption('Cooldown'); InitData(4); });
$(document).on('click', "#option5", function() { ToggleOption('Cooldown'); InitData(5); });

// Close the menu
$(document).on('click', ".btn-closeinterface", function() { CloseMenu() });

// Back up the menu
$(document).on('click', ".btn-backinterface", function() {
  if (Menu == 'MainMenu')             { return CloseMenu()                           };
  if (Menu == 'SettingsMenu')         { return OpenThisMenu('MainMenu')              };
  if (Menu == 'AdminMenu')            { return OpenThisMenu('MainMenu')              };
  if (Menu == 'TeleportMenu')         { return OpenThisMenu('AdminMenu')             };
  if (Menu == 'AdminSelfActionsMenu') { return OpenThisMenu('AdminMenu')             };
  if (Menu == 'AdminMetamolismMenu')  { return OpenThisMenu('AdminSelfActionsMenu')  };
  if (Menu == 'FunctionsMenu')        { return OpenThisMenu('MainMenu')              };
  if (Menu == 'ModuleSyncMenu')       { return OpenThisMenu('AdminMenu')             };
  if (Menu == 'InfoMenu')             { return OpenThisMenu('MainMenu')              };
  if (Menu == 'SkinMenu')             { return OpenThisMenu('FunctionsMenu')         };
  if (Menu == 'MusicMenu')            { return OpenThisMenu('MainMenu')              };
  if (Menu == 'Playlist')             { return OpenThisMenu('MusicMenu')             };
  if (Menu == 'Volume')               { return OpenThisMenu('MusicMenu')             };
  if (Menu == 'Volume2')              { return OpenThisMenu('Volume')                };
  if (Menu == 'Volume3')              { return OpenThisMenu('Volume2')               };
  if (Menu == 'Volume4')              { return OpenThisMenu('Volume3')               };
  if (Menu == 'AutoPlay')             { return OpenThisMenu('MusicMenu')             };
  if (Menu == 'AutoPlaylistMenu')     { return OpenThisMenu('AutoPlay')              };
  if (Menu == 'LangList1')            { return OpenThisMenu('SettingsMenu')          };
  if (Menu == 'LangList2')            { return OpenThisMenu('LangList1')             };
  if (Menu == 'ModernMusicMenu')      { return OpenThisMenu('MusicMenu')             };
  if (Menu == 'WesternMusicMenu')     { return OpenThisMenu('MusicMenu')             };
  if (Menu == 'WesternRDR1')          { return OpenThisMenu('WesternMusicMenu')      };
  if (Menu == 'WesternRDR2')          { return OpenThisMenu('WesternMusicMenu')      };
  if (Menu == 'WesternRDR3')          { return OpenThisMenu('WesternMusicMenu')      };
  if (Menu == 'BobMarley')            { return OpenThisMenu('ModernMusicMenu')       };
  if (Menu == 'TheScore1')            { return OpenThisMenu('ModernMusicMenu')       };
  if (Menu == 'ModernOtherMusic')     { return OpenThisMenu('ModernMusicMenu')       };
  ToggleOption('NoBackButton')
});

// Next Button
$(document).on('click', ".btn-nextinterface", function() {
  if (Menu == 'WesternRDR1')      { return OpenThisMenu('WesternRDR2')           };
  if (Menu == 'WesternRDR2')      { return OpenThisMenu('WesternRDR3')           };
  if (Menu == 'LangList1')        { return OpenThisMenu('LangList2')             };
  if (Menu == 'Volume')           { return OpenThisMenu('Volume2')               };
  if (Menu == 'Volume2')          { return OpenThisMenu('Volume3')               };
  if (Menu == 'Volume3')          { return OpenThisMenu('Volume4')               };
  ToggleOption('NoNextButton');
});
