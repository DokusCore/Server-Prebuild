--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore NPC Interaction Menu'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.1.1'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '[ Core ]/[ Client ]/*.*',
  '[ Core ]/[ Client ]/[ NUIs ]/*.*',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts { '@oxmysql/lib/MySQL.lua', '[ Core ]/[ Server ]/*.*', }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  'Config.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/Languinator.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/en.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page 'UI/ui.html'
files { 'UI/*.*' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
