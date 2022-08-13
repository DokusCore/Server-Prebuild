var Menu = ''
var Dialog = ''
var TitleName = ''
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
      Dialog = ''
      $('#npc-name').html('');
      $('#dialog').html('');
      Dialog = Data.Dialog
      TitleName = Data.TitleName
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
  $('#npc-name').html(TitleName);
  $('#dialog').html(Dialog);
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
  if ((Menu == 'BankMenu') && (nr == 0)) { $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankAccountMenu' })); };
  if ((Menu == 'BankMenu') && (nr == 1)) { $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankVaultMenu' })); };
  if ((Menu == 'BankMenu') && (nr == 2)) { $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'ScratchTickets' })); };

  if ((Menu == 'BankAccountMenu') && (nr == 0)) { $.post('https://DokusCore--NPCMenu/OpenBankAccount', JSON.stringify({})); CloseMenu() };
  if ((Menu == 'BankAccountMenu') && (nr == 1)) { $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'CreateBankAccount' })); };


  if ((Menu == 'CreateBankAccount') && (nr == 0)) { $.post('https://DokusCore--NPCMenu/CreatingBankAcc', JSON.stringify({})); CloseMenu() };
  if ((Menu == 'CreateBankAccount') && (nr == 1)) { NoAccount() };

  if ((Menu == 'BankVaultMenu') && (nr == 0)) { $.post('https://DokusCore--NPCMenu/OpenVault', JSON.stringify({})); };
  if ((Menu == 'BankVaultMenu') && (nr == 1)) { $.post('https://DokusCore--NPCMenu/CreateVault', JSON.stringify({})); };

  if ((Menu == 'ScratchTickets') && (nr == 0)) { $.post('https://DokusCore--NPCMenu/ScratchYes', JSON.stringify({})); CloseMenu() };
  if ((Menu == 'ScratchTickets') && (nr == 1)) { $.post('https://DokusCore--NPCMenu/ScratchNo', JSON.stringify({})); CloseMenu() };
};

const NoAccount = () => {
  return $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankMenu' }));
};


const CloseMenu = () => {
  Menu = ''
  Keys = []
  $('body').fadeOut();
  $.post('https://DokusCore--NPCMenu/SetMenu', JSON.stringify({ Menu: '' }));
  $.post('https://DokusCore--NPCMenu/Close', JSON.stringify({}));
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
  if (Menu == 'BankMenu') { return CloseMenu()  }
  if (Menu == 'BankAccountMenu') { return $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankMenu' })); }
  if (Menu == 'BankVaultMenu') { return $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankMenu' })); }
  if (Menu == 'ScratchTickets') { return $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankMenu' })); }
  if (Menu == 'CreateBankAccount') { return $.post('https://DokusCore--NPCMenu/OpenMenu', JSON.stringify({ Menu: 'BankMenu' })); }
  $.post('https://DokusCore--NPCMenu/NoBackButton', JSON.stringify({}));
});

// Next Button
$(document).on('click', ".btn-nextinterface", function() {
  $.post('https://DokusCore--NPCMenu/NoNextButton', JSON.stringify({}));
});
