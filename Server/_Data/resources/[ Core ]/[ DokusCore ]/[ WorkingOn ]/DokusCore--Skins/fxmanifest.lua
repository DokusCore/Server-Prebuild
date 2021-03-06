--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Skin Creator v2'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '2.0.0'
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
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '[ Core ]/[ Client ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  -- 'Config.lua', -- For Development -- leave off!
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Skins.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page { 'UI/index.html' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
files {
  'UI/img/*',
  'UI/fonts/*',
  'UI/*',
  'UI/webfonts/*',
  'UI/css/*',
  '[ Core ]/[ Server ]/Core.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
