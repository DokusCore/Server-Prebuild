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

_NPCInteract = {

  BankMenu = {
    {
      MenuName = 'BankMenu',
      MenuTitle = 'Banking Menu',
      MenuOptions = {
        { Type = 'Menu', Option = 'BankAccountMenu', Title = 'Account Menu' },
        { Type = 'Menu', Option = 'BankVaultMenu',   Title = 'Bank Vault Menu' },
        { Type = 'Menu', Option = 'ScratchTickets',  Title = 'Scratch Tickets' },
      },

      Dialogs = {
        'Welcome to our bank!',
        'How are you doing today?',
        'How may I help you today?',
        'Welcome back, what a pleasure to see you'
      },
    }
  },

  -- All Bank Menu's
  BankAccountMenu = {
    {
      MenuName = 'BankAccountMenu',
      MenuTitle = 'Your Account Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'OpenBankAccount', Title = 'Open your account' },
        { Type = 'Menu', Option = 'CreateBankAccount', Title = 'Create an account' },
      },

      Dialogs = {
        'What shell it be today ?',
        'Of cause, tell me what you need',
        'let me know what you like me to do?'
      },
    }
  },

  CreateBankAccount = {
    {
      MenuName = 'CreateBankAccount',
      MenuTitle = 'Opening a Bank Account',
      MenuOptions = {
        { Type = 'Option', Option = 'NotCreatingBankAcc',   Title = 'I Agree!' },
        { Type = 'Option', Option = 'CreatingBankAcc',      Title = 'I Do not Agree!' },
      },

      Dialogs = {
        'This costs $1 fee',
        'Openings fee is $1'
      },
    }
  },

  BankVaultMenu = {
    {
      MenuName = 'BankVaultMenu',
      MenuTitle = 'Your Vault Menu',
      MenuOptions = {
        { Type = 'Option', Option = 'OpenBankVault',   Title = 'Open your Bank Vault' },
        { Type = 'Option', Option = 'CreateBankVault', Title = 'Create a Bank Vault' },
      },

      Dialogs = {
        'UNDER CONSTRUCTION'
      },
    }
  },

  ScratchTickets = {
    {
      MenuName = 'ScratchTickets',
      MenuTitle = 'Scratch Tickets',
      MenuOptions = {
        { Type = 'Option', Option = 'ScratchYes',   Title = 'Yes' },
        { Type = 'Option', Option = 'ScratchNo',    Title = 'No' },
      },

      Dialogs = {
        'Do you want to collect your rewards?'
      },
    }
  },
}



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
