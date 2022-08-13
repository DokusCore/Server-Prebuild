--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Metabolism -- Its vital to have some vitals'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.2.3'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '[ Core ]/[ Client ]/*.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '@oxmysql/lib/MySQL.lua' ,
  '[ Core ]/[ Server ]/*.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  -- 'Config.lua', -- Development Only
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Metabolism.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page('UI/index.html')
files {
  "UI/script.js",
	"UI/jquery.min.js",
	"UI/jquery-ui.min.js",
	"UI/styles.css",
	"UI/img/*.svg",
	"UI/img/*.png",
	"UI/index.html",
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
