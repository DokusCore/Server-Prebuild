// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
var InMenu = '';
var Keys = [];
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
window.addEventListener('message', function(e) {
  var Act = e.data.Action

  if (Act == 'SetMenu') { InMenu = e.data.Menu };
  if (Act == 'IndexKeys') { Keys = []; IndexKeys(e.data.Menu); };
  if (Act == 'OpenMenu') { OpenMenu() };
  if (Act == 'CloseMenu') { CloseMenu() };
});
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const IndexKeys = (Data) => {
  for (var i = 0; i < Data.Options.length; i++) {
    Keys.push({
      Type: Data.Options[i].Type,
      Option: Data.Options[i].Option,
      Title: Data.Options[i].Title
    })
  }
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const OpenMenu = () => {
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
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
$(document).on('click', "#option0", function() { InitData(0); });
$(document).on('click', "#option1", function() { InitData(1); });
$(document).on('click', "#option2", function() { InitData(2); });
$(document).on('click', "#option3", function() { InitData(3); });
$(document).on('click', "#option4", function() { InitData(4); });
$(document).on('click', "#option5", function() { InitData(5); });
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
$(document).on('click', ".btn-closeinterface", function() { CloseMenu() });
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
$(document).on('click', ".btn-nextinterface", function() {
  if (InMenu == 'LangList1')        { return OpenThisMenu('LangList2') };
  if (InMenu == 'LangList2')        { return OpenThisMenu('LangList3') };
  if (InMenu == 'WesternRDR1')        { return OpenThisMenu('WesternRDR2') };
  if (InMenu == 'WesternRDR2')        { return OpenThisMenu('WesternRDR3') };
  ToggleOption('NoNextButton')
});
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
$(document).on('click', ".btn-backinterface", function() {
  if (InMenu == 'UserMenu')         { return CloseMenu() };
  if (InMenu == 'AdminMenu')        { return CloseMenu() };
  if (InMenu == 'AdminOptMenu')     { return OpenThisMenu('AdminMenu') };
  if (InMenu == 'InfoMenu')         { return OpenThisMenu('UserMenu')  };
  if (InMenu == 'TeleportMenu')     { return OpenThisMenu('AdminMenu') };
  if (InMenu == 'ModuleSyncMenu')   { return OpenThisMenu('AdminMenu') };
  if (InMenu == 'CharacterMenu')    { return OpenThisMenu('UserMenu')  };
  if (InMenu == 'DelCharacter')     { return OpenThisMenu('DelCharacter')  };
  if (InMenu == 'SkinMenu')         { return OpenThisMenu('UserMenu')  };
  if (InMenu == 'SettingsMenu')     { return OpenThisMenu('UserMenu')  };
  if (InMenu == 'LangList1')        { return OpenThisMenu('SettingsMenu') };
  if (InMenu == 'LangList2')        { return OpenThisMenu('LangList1') };
  if (InMenu == 'LangList3')        { return OpenThisMenu('LangList2') };
  if (InMenu == 'MusicMenu')        { return OpenThisMenu('UserMenu')  };
  if (InMenu == 'Playlist')         { return OpenThisMenu('MusicMenu') };
  if (InMenu == 'ModernMusicMenu')  { return OpenThisMenu('Playlist')  };
  if (InMenu == 'WesternMusicMenu') { return OpenThisMenu('Playlist')  };
  if (InMenu == 'BobMarley')        { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'TheScore')         { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'ModernOtherMusic') { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'WesternRDR1')      { return OpenThisMenu('WesternMusicMenu') };
  if (InMenu == 'WesternRDR2')      { return OpenThisMenu('WesternRDR1') };
  if (InMenu == 'WesternRDR3')      { return OpenThisMenu('WesternRDR2') };
  if (InMenu == 'Volume')           { return OpenThisMenu('MusicMenu') };
  if (InMenu == 'Volume2')          { return OpenThisMenu('Volume') };
  if (InMenu == 'Volume3')          { return OpenThisMenu('Volume2') };
  if (InMenu == 'Volume4')          { return OpenThisMenu('Volume3') };
  ToggleOption('NoBackButton')
});
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const OpenThisMenu = (M) => { $.post('https://DokusCore--CoreMenu/OpenMenu', JSON.stringify({ Menu: M })); }
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const ToggleOption = (M, Opt) => {
  if (Opt == null || Opt == undefined) {
    $.post('https://DokusCore--CoreMenu/'+M, JSON.stringify({}));
  } else {
    $.post('https://DokusCore--CoreMenu/'+M, JSON.stringify({ Option: Opt }));
  };
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const CloseMenu = () => {
  InMenu = ''
  Keys = []
  $('body').fadeOut();
  OpenThisMenu('');
  ToggleOption('Close');
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\

// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\

// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\

// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const InitData = (nr) => {
  if ((InMenu == 'UserMenu') && (nr == 0))         { OpenThisMenu('InfoMenu');                           };
  if ((InMenu == 'UserMenu') && (nr == 1))         { OpenThisMenu('CharacterMenu');                      };
  if ((InMenu == 'UserMenu') && (nr == 2))         { OpenThisMenu('SettingsMenu');                       };
  if ((InMenu == 'UserMenu') && (nr == 3))         { OpenThisMenu('MusicMenu');                          };

  if ((InMenu == 'InfoMenu') && (nr == 0))         { ToggleOption('ShowDiscord');                        };
  if ((InMenu == 'InfoMenu') && (nr == 1))         { ToggleOption('GuideUp'); CloseMenu();               };

  if ((InMenu == 'AdminMenu') && (nr == 0))        { OpenThisMenu('TeleportMenu');                       };
  if ((InMenu == 'AdminMenu') && (nr == 1))        { ToggleOption('WeatherSyncMenu'); CloseMenu();       };
  if ((InMenu == 'AdminMenu') && (nr == 2))        { OpenThisMenu('ModuleSyncMenu');                     };
  if ((InMenu == 'AdminMenu') && (nr == 3))        { OpenThisMenu('AdminOptMenu');                       };

  if ((InMenu == 'AdminOptMenu') && (nr == 0))     { ToggleOption('GodMode');    CloseMenu();            };
  if ((InMenu == 'AdminOptMenu') && (nr == 1))     { ToggleOption('SpawnHorse'); CloseMenu();            };

  if ((InMenu == 'TeleportMenu') && (nr == 0))     { ToggleOption('Teleport', 'TPM'); CloseMenu();       };
  if ((InMenu == 'TeleportMenu') && (nr == 1))     { ToggleOption('Teleport', 'TTC'); CloseMenu();       };

  if ((InMenu == 'ModuleSyncMenu') && (nr == 0))   { ToggleOption('SyncUsableItems');                    };
  if ((InMenu == 'ModuleSyncMenu') && (nr == 1))   { ToggleOption('SyncStoreItems');                     };

  if ((InMenu == 'CharacterMenu') && (nr == 0))    { ToggleOption('Logout');                             };
  if ((InMenu == 'CharacterMenu') && (nr == 1))    { ToggleOption('SaveCoords');                         };
  if ((InMenu == 'CharacterMenu') && (nr == 2))    { OpenThisMenu('SkinMenu');                           };
  if ((InMenu == 'CharacterMenu') && (nr == 3))    { CloseMenu(); ToggleOption('DelCharComfirm', true);  };

  if ((InMenu == 'DelCharacter') && (nr == 0))     { ToggleOption('DelCharacter', true);                 };
  if ((InMenu == 'DelCharacter') && (nr == 1))     { ToggleOption('DelCharacter', false);                };

  if ((InMenu == 'SkinMenu') && (nr == 0))         { ToggleOption('SkinMenu', 'OpenMenu');               };
  if ((InMenu == 'SkinMenu') && (nr == 1))         { ToggleOption('SkinMenu', 'LoadSkin'); CloseMenu();  };

  if ((InMenu == 'SettingsMenu') && (nr == 0))     { OpenThisMenu('LangList1');                          };
  if ((InMenu == 'SettingsMenu') && (nr == 1))     { ToggleOption('ToggleMusic');                        };

  if ((InMenu == 'LangList1') && (nr == 0))        { ToggleOption('ChangeLanguage', 'en');               };
  if ((InMenu == 'LangList1') && (nr == 1))        { ToggleOption('ChangeLanguage', 'de');               };
  if ((InMenu == 'LangList1') && (nr == 2))        { ToggleOption('ChangeLanguage', 'it');               };
  if ((InMenu == 'LangList1') && (nr == 3))        { ToggleOption('ChangeLanguage', 'ru');               };
  if ((InMenu == 'LangList1') && (nr == 4))        { ToggleOption('ChangeLanguage', 'fr');               };
  if ((InMenu == 'LangList1') && (nr == 5))        { ToggleOption('ChangeLanguage', 'es');               };
  if ((InMenu == 'LangList2') && (nr == 0))        { ToggleOption('ChangeLanguage', 'bg');               };
  if ((InMenu == 'LangList2') && (nr == 1))        { ToggleOption('ChangeLanguage', 'dk');               };
  if ((InMenu == 'LangList2') && (nr == 2))        { ToggleOption('ChangeLanguage', 'gr');               };
  if ((InMenu == 'LangList2') && (nr == 3))        { ToggleOption('ChangeLanguage', 'nl');               };
  if ((InMenu == 'LangList2') && (nr == 4))        { ToggleOption('ChangeLanguage', 'pl');               };
  if ((InMenu == 'LangList2') && (nr == 5))        { ToggleOption('ChangeLanguage', 'pt');               };
  if ((InMenu == 'LangList3') && (nr == 0))        { ToggleOption('ChangeLanguage', 'fi');               };

  if ((InMenu == 'MusicMenu') && (nr == 0))        { ToggleOption('StopMusic');                          };
  if ((InMenu == 'MusicMenu') && (nr == 1))        { OpenThisMenu('AutoPlay');                           };
  if ((InMenu == 'MusicMenu') && (nr == 2))        { OpenThisMenu('Volume');                             };
  if ((InMenu == 'MusicMenu') && (nr == 3))        { OpenThisMenu('Playlist');                           };

  if ((InMenu == 'Playlist') && (nr == 0))         { OpenThisMenu('ModernMusicMenu');                    };
  if ((InMenu == 'Playlist') && (nr == 1))         { OpenThisMenu('WesternMusicMenu');                   };

  if ((InMenu == 'ModernMusicMenu') && (nr == 0))  { OpenThisMenu('BobMarley');                          };
  if ((InMenu == 'ModernMusicMenu') && (nr == 1))  { OpenThisMenu('TheScore');                           };
  if ((InMenu == 'ModernMusicMenu') && (nr == 2))  { OpenThisMenu('ModernOtherMusic');                   };

  if ((InMenu == 'WesternMusicMenu') && (nr == 0))   { OpenThisMenu('WesternRDR1');                        };

  if ((InMenu == 'BobMarley') && (nr == 0))        { ToggleOption('PlayMusic', 'BM-IShotTheSheriff');    };
  if ((InMenu == 'ModernOtherMusic') && (nr == 0)) { ToggleOption('PlayMusic', 'RunHome');               };
  if ((InMenu == 'ModernOtherMusic') && (nr == 1)) { ToggleOption('PlayMusic', 'ThemeSong');             };

  if ((InMenu == 'TheScore') && (nr == 0))         { ToggleOption('PlayMusic', 'TheScore-Revolution_');  };
  if ((InMenu == 'TheScore') && (nr == 1))         { ToggleOption('PlayMusic', 'TheScore-Stronger');     };
  if ((InMenu == 'TheScore') && (nr == 2))         { ToggleOption('PlayMusic', 'TheScore-TheFear');      };
  if ((InMenu == 'TheScore') && (nr == 3))         { ToggleOption('PlayMusic', 'TheScore-TheHeat');      };
  if ((InMenu == 'TheScore') && (nr == 4))         { ToggleOption('PlayMusic', 'TheScore-Unstoppable');  };
  if ((InMenu == 'TheScore') && (nr == 5))         { ToggleOption('PlayMusic', 'TheScore-WhoIAm');       };

  if ((InMenu == 'WesternRDR1') && (nr == 0))      { ToggleOption('PlayMusic', 'ApacheTribe');           };
  if ((InMenu == 'WesternRDR1') && (nr == 1))      { ToggleOption('PlayMusic', 'BillyTheKid');           };
  if ((InMenu == 'WesternRDR1') && (nr == 2))      { ToggleOption('PlayMusic', 'CactusDesert');          };
  if ((InMenu == 'WesternRDR1') && (nr == 3))      { ToggleOption('PlayMusic', 'CampfireTales');         };
  if ((InMenu == 'WesternRDR1') && (nr == 4))      { ToggleOption('PlayMusic', 'GhostTown');             };
  if ((InMenu == 'WesternRDR1') && (nr == 5))      { ToggleOption('PlayMusic', 'GoldRush');              };

  if ((InMenu == 'WesternRDR2') && (nr == 0))      { ToggleOption('PlayMusic', 'GunslingingOutlaws');    };
  if ((InMenu == 'WesternRDR2') && (nr == 1))      { ToggleOption('PlayMusic', 'IndianCamp');            };
  if ((InMenu == 'WesternRDR2') && (nr == 2))      { ToggleOption('PlayMusic', 'LegendsoftheWest');      };
  if ((InMenu == 'WesternRDR2') && (nr == 3))      { ToggleOption('PlayMusic', 'NightinthePrairie');     };
  if ((InMenu == 'WesternRDR2') && (nr == 4))      { ToggleOption('PlayMusic', 'NoMansLand');            };
  if ((InMenu == 'WesternRDR2') && (nr == 5))      { ToggleOption('PlayMusic', 'OldMiningTown');         };

  if ((InMenu == 'WesternRDR3') && (nr == 0))      { ToggleOption('PlayMusic', 'RowdyCowboys');          };
  if ((InMenu == 'WesternRDR3') && (nr == 1))      { ToggleOption('PlayMusic', 'TheGreatMountain');      };
  if ((InMenu == 'WesternRDR3') && (nr == 2))      { ToggleOption('PlayMusic', 'TheOldTrain');           };
  if ((InMenu == 'WesternRDR3') && (nr == 3))      { ToggleOption('PlayMusic', 'TheOregonTrail');        };
  if ((InMenu == 'WesternRDR3') && (nr == 4))      { ToggleOption('PlayMusic', 'TheWildWest');           };
  if ((InMenu == 'WesternRDR3') && (nr == 5))      { ToggleOption('PlayMusic', 'TumbleweedTown');        };

  if ((InMenu == 'Volume') && (nr == 0))           { ToggleOption('SetVolume', 0.05);                    };
  if ((InMenu == 'Volume') && (nr == 1))           { ToggleOption('SetVolume', 0.10);                    };
  if ((InMenu == 'Volume') && (nr == 2))           { ToggleOption('SetVolume', 0.15);                    };
  if ((InMenu == 'Volume') && (nr == 3))           { ToggleOption('SetVolume', 0.20);                    };
  if ((InMenu == 'Volume') && (nr == 4))           { ToggleOption('SetVolume', 0.25);                    };
  if ((InMenu == 'Volume') && (nr == 5))           { ToggleOption('SetVolume', 0.30);                    };
  if ((InMenu == 'Volume2') && (nr == 0))          { ToggleOption('SetVolume', 0.35);                    };
  if ((InMenu == 'Volume2') && (nr == 1))          { ToggleOption('SetVolume', 0.40);                    };
  if ((InMenu == 'Volume2') && (nr == 2))          { ToggleOption('SetVolume', 0.45);                    };
  if ((InMenu == 'Volume2') && (nr == 3))          { ToggleOption('SetVolume', 0.50);                    };
  if ((InMenu == 'Volume2') && (nr == 4))          { ToggleOption('SetVolume', 0.55);                    };
  if ((InMenu == 'Volume2') && (nr == 5))          { ToggleOption('SetVolume', 0.60);                    };
  if ((InMenu == 'Volume3') && (nr == 0))          { ToggleOption('SetVolume', 0.65);                    };
  if ((InMenu == 'Volume3') && (nr == 1))          { ToggleOption('SetVolume', 0.70);                    };
  if ((InMenu == 'Volume3') && (nr == 2))          { ToggleOption('SetVolume', 0.75);                    };
  if ((InMenu == 'Volume3') && (nr == 3))          { ToggleOption('SetVolume', 0.80);                    };
  if ((InMenu == 'Volume3') && (nr == 4))          { ToggleOption('SetVolume', 0.85);                    };
  if ((InMenu == 'Volume3') && (nr == 5))          { ToggleOption('SetVolume', 0.90);                    };
  if ((InMenu == 'Volume4') && (nr == 0))          { ToggleOption('SetVolume', 0.95);                    };
  if ((InMenu == 'Volume4') && (nr == 1))          { ToggleOption('SetVolume', 1.00);                    };

};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const GoPageForward = () => {
  if (InMenu == 'LangList1')   { return OpenThisMenu('LangList2')   };
  if (InMenu == 'LangList2')   { return OpenThisMenu('LangList3')   };
  if (InMenu == 'WesternRDR1') { return OpenThisMenu('WesternRDR2') };
  if (InMenu == 'WesternRDR2') { return OpenThisMenu('WesternRDR3') };
  if (InMenu == 'Volume')      { return OpenThisMenu('Volume2')     };
  if (InMenu == 'Volume2')     { return OpenThisMenu('Volume3')     };
  if (InMenu == 'Volume3')     { return OpenThisMenu('Volume4')     };
  ToggleOption('NoNextButton');
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
const GoPageBack = () => {
  if (InMenu == 'UserMenu')         { return CloseMenu()                      };
  if (InMenu == 'AdminMenu')        { return CloseMenu()                      };
  if (InMenu == 'AdminOptMenu')     { return OpenThisMenu('AdminMenu')        };
  if (InMenu == 'InfoMenu')         { return OpenThisMenu('UserMenu')         };
  if (InMenu == 'TeleportMenu')     { return OpenThisMenu('AdminMenu')        };
  if (InMenu == 'ModuleSyncMenu')   { return OpenThisMenu('AdminMenu')        };
  if (InMenu == 'CharacterMenu')    { return OpenThisMenu('UserMenu')         };
  if (InMenu == 'DelCharacter')     { return OpenThisMenu('CharacterMenu')    };
  if (InMenu == 'SkinMenu')         { return OpenThisMenu('UserMenu')         };
  if (InMenu == 'SettingsMenu')     { return OpenThisMenu('UserMenu')         };
  if (InMenu == 'LangList1')        { return OpenThisMenu('SettingsMenu')     };
  if (InMenu == 'LangList2')        { return OpenThisMenu('LangList1')        };
  if (InMenu == 'LangList3')        { return OpenThisMenu('LangList2')        };
  if (InMenu == 'MusicMenu')        { return OpenThisMenu('UserMenu')         };
  if (InMenu == 'Playlist')         { return OpenThisMenu('MusicMenu')        };
  if (InMenu == 'ModernMusicMenu')  { return OpenThisMenu('Playlist')         };
  if (InMenu == 'WesternMusicMenu') { return OpenThisMenu('Playlist')         };
  if (InMenu == 'BobMarley')        { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'TheScore')         { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'ModernOtherMusic') { return OpenThisMenu('ModernMusicMenu')  };
  if (InMenu == 'WesternRDR1')      { return OpenThisMenu('WesternMusicMenu') };
  if (InMenu == 'WesternRDR2')      { return OpenThisMenu('WesternMusicMenu') };
  if (InMenu == 'WesternRDR3')      { return OpenThisMenu('WesternMusicMenu') };
  if (InMenu == 'Volume')           { return OpenThisMenu('MusicMenu')        };
  if (InMenu == 'Volume2')          { return OpenThisMenu('Volume')           };
  if (InMenu == 'Volume3')          { return OpenThisMenu('Volume2')          };
  if (InMenu == 'Volume4')          { return OpenThisMenu('Volume3')          };
  ToggleOption('NoBackButton')
};
// -------------------------------------------------------------------------- \\
// -------------------------------------------------------------------------- \\
$(document).on('keypress', function(e) {
  var Key = e.which
  if (Key == 113) { InitData(0)     }; // Q
  if (Key == 119) { InitData(1)     }; // W
  if (Key == 101) { InitData(2)     }; // E
  if (Key == 97)  { InitData(3)     }; // A
  if (Key == 115) { InitData(4)     }; // S
  if (Key == 100) { InitData(5)     }; // D
  if (Key == 122) { GoPageBack()    }; // Z
  if (Key == 120) { CloseMenu()     }; // X
  if (Key == 99)  { GoPageForward() }; // C
});











































// -------------------------------------------------------------------------- \\
