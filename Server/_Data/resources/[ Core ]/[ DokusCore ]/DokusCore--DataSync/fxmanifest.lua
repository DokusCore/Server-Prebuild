--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusSync -- A plugin that stores all core data to stay synced'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.6.0'
lua54 'yes'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Data.lua',
  '[ Core ]/[ Client ]/*.lua',
  '[ Core ]/[ Client ]/[ Callbacks ]/*.lua',
  '[ Core ]/[ Client ]/[ Events ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '[ Core ]/[ Server ]/*.lua',
  '[ Core ]/[ Server ]/[ Callbacks ]/*.lua'
 }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script { '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
