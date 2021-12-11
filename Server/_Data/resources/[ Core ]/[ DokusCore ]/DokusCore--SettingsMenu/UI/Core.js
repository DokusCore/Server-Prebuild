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
      IndexKeys(event.data.Menu)
      setTimeout(function() {
        OpenMenu(Keys)
      }, 100);
      break;
    case 'CloseMenu':
      CloseMenu()
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

  $('body').fadeIn()
};

const InitData = (nr) => {
  if ((Menu == 'MainMenu') && (nr == 0)) { OpenInventory() };
  if ((Menu == 'MainMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'SettingsMenu' })); };
  if ((Menu == 'MainMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'FunctionsMenu' })); };
  if ((Menu == 'MainMenu') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); };

  if ((Menu == 'MusicMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/StopMusic', JSON.stringify({})); };
  if ((Menu == 'MusicMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'AutoPlay' })); };
  if ((Menu == 'MusicMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume' })); };
  if ((Menu == 'MusicMenu') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Playlist' })); };

  if ((Menu == 'AutoPlay') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/AutoPlayMusic', JSON.stringify({ Type: 'All' })); };
  if ((Menu == 'AutoPlay') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'AutoPlaylistMenu' })); };

  if ((Menu == 'AutoPlaylistMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/AutoPlayMusic', JSON.stringify({ Type: 'TheScore' })); };
  if ((Menu == 'AutoPlaylistMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/AutoPlayMusic', JSON.stringify({ Type: 'WesternRDR' })); };
  // if ((Menu == 'AutoPlaylistMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/AutoPlayMusic', JSON.stringify({ Type: 'BobMarley' })); };
  if ((Menu == 'AutoPlaylistMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/AutoPlayMusic', JSON.stringify({ Type: 'Others' })); };

  if ((Menu == 'Playlist') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'ModernMusicMenu' })); };
  if ((Menu == 'Playlist') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternMusicMenu' })); };

  if ((Menu == 'Volume') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.05 })); };
  if ((Menu == 'Volume') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.10 })); };
  if ((Menu == 'Volume') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.15 })); };
  if ((Menu == 'Volume') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.20 })); };
  if ((Menu == 'Volume') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.25 })); };
  if ((Menu == 'Volume') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.30 })); };
  if ((Menu == 'Volume2') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.35 })); };
  if ((Menu == 'Volume2') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.40 })); };
  if ((Menu == 'Volume2') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.45 })); };
  if ((Menu == 'Volume2') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.50 })); };
  if ((Menu == 'Volume2') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.55 })); };
  if ((Menu == 'Volume2') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.60 })); };
  if ((Menu == 'Volume3') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.65 })); };
  if ((Menu == 'Volume3') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.70 })); };
  if ((Menu == 'Volume3') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.75 })); };
  if ((Menu == 'Volume3') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.80 })); };
  if ((Menu == 'Volume3') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.85 })); };
  if ((Menu == 'Volume3') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.90 })); };
  if ((Menu == 'Volume4') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 0.95 })); };
  if ((Menu == 'Volume4') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SetVolume', JSON.stringify({ Vol: 1.00 })); };

  if ((Menu == 'SettingsMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'LangList1' })); };
  if ((Menu == 'SettingsMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/ToggleMusic', JSON.stringify({})); };

  if ((Menu == 'LangList1') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'en' })); };
  if ((Menu == 'LangList1') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'de' })); };
  if ((Menu == 'LangList1') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'it' })); };
  if ((Menu == 'LangList1') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'ru' })); };
  if ((Menu == 'LangList1') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'fr' })); };
  if ((Menu == 'LangList1') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'es' })); };

  if ((Menu == 'LangList2') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'bg' })); };
  if ((Menu == 'LangList2') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'dk' })); };
  if ((Menu == 'LangList2') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'gr' })); };
  if ((Menu == 'LangList2') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'nl' })); };
  if ((Menu == 'LangList2') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'pl' })); };
  if ((Menu == 'LangList2') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/ChangeLanguage', JSON.stringify({ Lang: 'pt' })); };


  if ((Menu == 'FunctionsMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/Logout', JSON.stringify({})); };
  if ((Menu == 'FunctionsMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SaveCoords', JSON.stringify({})); };
  if ((Menu == 'FunctionsMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'SkinMenu' })); };

  if ((Menu == 'SkinMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/SkinMenu', JSON.stringify({ Opt: 'OpenMenu' })); CloseMenu() };
  if ((Menu == 'SkinMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/SkinMenu', JSON.stringify({ Opt:  'LoadSkin' })); CloseMenu() };

  if ((Menu == 'WesternMusicMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternRDR1' })); };

  if ((Menu == 'ModernMusicMenu') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'BobMarley' })); };
  if ((Menu == 'ModernMusicMenu') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'TheScore1' })); };
  if ((Menu == 'ModernMusicMenu') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'ModernOtherMusic' })); };

  if ((Menu == 'TheScore1') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-Revolution_' })); };
  if ((Menu == 'TheScore1') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-Stronger' })); };
  if ((Menu == 'TheScore1') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-TheFear' })); };
  if ((Menu == 'TheScore1') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-TheHeat' })); };
  if ((Menu == 'TheScore1') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-Unstoppable' })); };
  if ((Menu == 'TheScore1') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheScore-WhoIAm' })); };

  if ((Menu == 'WesternRDR1') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'ApacheTribe' })); };
  if ((Menu == 'WesternRDR1') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'BillyTheKid' })); };
  if ((Menu == 'WesternRDR1') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'CactusDesert' })); };
  if ((Menu == 'WesternRDR1') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'CampfireTales' })); };
  if ((Menu == 'WesternRDR1') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'GhostTown' })); };
  if ((Menu == 'WesternRDR1') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'GoldRush' })); };

  if ((Menu == 'WesternRDR2') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'GunslingingOutlaws' })); };
  if ((Menu == 'WesternRDR2') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'IndianCamp' })); };
  if ((Menu == 'WesternRDR2') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'LegendsoftheWest' })); };
  if ((Menu == 'WesternRDR2') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'NightinthePrairie' })); };
  if ((Menu == 'WesternRDR2') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'NoMansLand' })); };
  if ((Menu == 'WesternRDR2') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'OldMiningTown' })); };

  if ((Menu == 'WesternRDR3') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'RowdyCowboys' })); };
  if ((Menu == 'WesternRDR3') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheGreatMountain' })); };
  if ((Menu == 'WesternRDR3') && (nr == 2)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheOldTrain' })); };
  if ((Menu == 'WesternRDR3') && (nr == 3)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheOregonTrail' })); };
  if ((Menu == 'WesternRDR3') && (nr == 4)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TheWildWest' })); };
  if ((Menu == 'WesternRDR3') && (nr == 5)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'TumbleweedTown' })); };

  if ((Menu == 'BobMarley') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'BM-IShotTheSheriff' })); };

  if ((Menu == 'ModernOtherMusic') && (nr == 0)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'RunHome' })); };
  if ((Menu == 'ModernOtherMusic') && (nr == 1)) { $.post('https://DokusCore--SettingsMenu/PlayMusic', JSON.stringify({ Song: 'ThemeSong' })); };
};

const OpenInventory = () => {
  Menu = ''
  Keys = []
  $('body').fadeOut();
  $.post('https://DokusCore--SettingsMenu/Close', JSON.stringify({}));
  $.post('https://DokusCore--SettingsMenu/OpenInventory', JSON.stringify({}));
};

const CloseMenu = () => {
  Menu = ''
  Keys = []
  $('body').fadeOut();
  $.post('https://DokusCore--SettingsMenu/SetMenu', JSON.stringify({ Menu: '' }));
  $.post('https://DokusCore--SettingsMenu/Close', JSON.stringify({}));
};

$(document).on('click', "#option0", function() { InitData(0) });
$(document).on('click', "#option1", function() { InitData(1) });
$(document).on('click', "#option2", function() { InitData(2) });
$(document).on('click', "#option3", function() { InitData(3) });
$(document).on('click', "#option4", function() { InitData(4) });
$(document).on('click', "#option5", function() { InitData(5) });

// Close the menu
$(document).on('click', ".btn-closeinterface", function() { CloseMenu() });

// Back up the menu
$(document).on('click', ".btn-backinterface", function() {
  if (Menu == 'SettingsMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MainMenu' })); }
  if (Menu == 'FunctionsMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MainMenu' })); }
  if (Menu == 'SkinMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'FunctionsMenu' })); }
  if (Menu == 'MusicMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MainMenu' })); }
  if (Menu == 'Playlist') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); }
  if (Menu == 'Volume') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); }
  if (Menu == 'Volume2') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume' })); }
  if (Menu == 'Volume3') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume2' })); }
  if (Menu == 'Volume4') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume3' })); }
  if (Menu == 'AutoPlay') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); }
  if (Menu == 'AutoPlaylistMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'AutoPlay' })); }
  if (Menu == 'LangList1') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'SettingsMenu' })); }
  if (Menu == 'LangList2') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'LangList1' })); }
  if (Menu == 'ModernMusicMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); }
  if (Menu == 'WesternMusicMenu') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'MusicMenu' })); }
  if (Menu == 'WesternRDR1') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternMusicMenu' })); }
  if (Menu == 'WesternRDR2') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternMusicMenu' })); }
  if (Menu == 'WesternRDR3') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternMusicMenu' })); }
  if (Menu == 'BobMarley') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'ModernMusicMenu' })); }
  if (Menu == 'TheScore1') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'ModernMusicMenu' })); }
  if (Menu == 'ModernOtherMusic') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'ModernMusicMenu' })); }
  $.post('https://DokusCore--SettingsMenu/NoBackButton', JSON.stringify({}));
});

// Next Button
$(document).on('click', ".btn-nextinterface", function() {
  if (Menu == 'WesternRDR1') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternRDR2' })); }
  if (Menu == 'WesternRDR2') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'WesternRDR3' })); }
  if (Menu == 'LangList1') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'LangList2' })); }
  if (Menu == 'Volume') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume2' })); }
  if (Menu == 'Volume2') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume3' })); }
  if (Menu == 'Volume3') { return $.post('https://DokusCore--SettingsMenu/OpenMenu', JSON.stringify({ Menu: 'Volume4' })); }
  $.post('https://DokusCore--SettingsMenu/NoNextButton', JSON.stringify({}));
});
