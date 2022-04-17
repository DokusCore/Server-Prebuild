--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore UsableItems -- Use items and take care of its animations'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.0.1'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts { '@oxmysql/lib/MySQL.lua', '[ Core ]/[ Server ]/*.lua' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  'Config.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '[ Core ]/[ Client ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
