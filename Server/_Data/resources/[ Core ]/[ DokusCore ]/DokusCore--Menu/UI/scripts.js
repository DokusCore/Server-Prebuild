window.addEventListener('message', function(event) {

  MenuName = event.data.MenuName
  MenuTitle = event.data.MenuTitle
  MenuOptions = event.data.MenuOptions

  if (MenuName == 'MainMenu') {
    $('#npc-header').html(MenuTitle);
    for (let i = 0; i < MenuOptions.length; i++) {
      if (i <= 6) {
        $("#option" + i).show();
        $("#option" + i).html(MenuOptions[i].Title);
        $(document).on('click', "#option" + i, function() {
          if (MenuOptions[i].Type == 'Menu') {
            if (MenuOptions[i].Title == 'Settings') {
              $.post('https://DokusCore--Menu/OpenSettingsMenu');
            };
            if (MenuOptions[i].Title == 'Functions') {
              $.post('https://DokusCore--Menu/OpenFunctionsMenu');
            };
            if (MenuOptions[i].Title == 'Music') {
              $.post('https://DokusCore--Menu/OpenMusicMenu');
            };
          } else if (MenuOptions[i].Type == 'Option') {
            if (MenuOptions[i].Title == 'Open Inventory') {
              $.post('https://DokusCore--Menu/Close');
              $('body').fadeOut();
              $.post('https://DokusCore--Menu/OpenInventory');
            };
          };
        });
      };

      if (i < 6) {
        for (let i = MenuOptions.length; i < 6; i++) {
          $("#option" + i).hide();
        };
      };
    };
  };

  if (MenuName == 'SettingsMenu') {
    $('#npc-header').html(MenuTitle);
    for (let i = 0; i < MenuOptions.length; i++) {
      if (i <= 6) {
        $("#option" + i).show();
        $("#option" + i).html(MenuOptions[i].Title);
        $(document).on('click', "#option" + i, function() {
          if (MenuOptions[i].Type == 'Menu') {

          } else if (MenuOptions[i].Type == 'Option') {

            if (MenuOptions[i].Title == 'Toggle Music') {
              $.post('https://DokusCore--Menu/ToggleMusic');
            };

          };
        });
      };

      if (i < 6) {
        for (let i = MenuOptions.length; i < 6; i++) {
          $("#option" + i).hide();
        };
      };
    };
  };


  $('body').fadeIn();
});






// Close the menu
$(document).on('click', ".btn-closeinterface", function() {
  $.post('https://DokusCore--Menu/Close');
  $('body').fadeOut();
});