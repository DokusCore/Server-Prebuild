--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Inventory'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.9.0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/DokusMenu.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '[ Core ]/[ Client ]/*.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts { '@oxmysql/lib/MySQL.lua', '[ Core ]/[ Server ]/*.lua' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Inventory.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page 'UI/index.html'
files {
  'UI/index.html',
  'UI/css/main.css',
  'UI/css/items.css',
  'UI/js/main.js',
  'UI/js/alert.js',
  'UI/img/arrow.svg',
  'UI/img/inventorySVG.svg',
  'UI/img/items/*.png'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
