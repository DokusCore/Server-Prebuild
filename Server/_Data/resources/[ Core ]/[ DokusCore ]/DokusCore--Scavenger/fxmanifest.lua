--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Harvesting'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.0.0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '[ Core ]/[ Client ]/*.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  -- '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '[ Core ]/[ Server ]/*.lua',
  '@DokusCore/[ Core ]/[ Server ]/[ Utilities ]/Functions.lua',
 }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/DokusMenu.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '@DokusCore/[ Configs ]/[ Dialogs ]/Scavenger.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Scavenger.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
