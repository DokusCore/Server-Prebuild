--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Inventory'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.5.3 BETA'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts { '[ Core ]/[ Client ]/*.lua', '@DokusCore/[ Core ]/[ System ]/[ Menu ]/DokusMenu.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', '[ Core ]/[ Server ]/*.lua' }
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Core ]/[ System ]/Languinator.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Inventory.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/bg.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/de.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/dk.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/en.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/es.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/fr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/gr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/it.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/nl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/pl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/pt.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/ru.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page 'UI/index.html'
files{
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
