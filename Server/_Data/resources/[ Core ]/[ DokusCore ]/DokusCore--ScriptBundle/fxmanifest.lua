--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore ScriptBundle -- A bundle of small scripts'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.2.0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '[ Core ]/[ Server ]/*.lua',
  '[ Core ]/[ Server ]/[ Scripts ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  'Config.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '[ Core ]/[ Client ]/*.lua',
  '[ Core ]/[ Client ]/[ Scripts ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/ScriptBundle.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
