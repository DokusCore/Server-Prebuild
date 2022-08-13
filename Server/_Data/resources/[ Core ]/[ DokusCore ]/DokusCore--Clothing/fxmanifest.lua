--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Clothing'
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
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts { '[ Core ]/[ Server ]/*.lua' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  -- 'Config.lua', -- For development only -- Leave it off!
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/DokusMenu.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Dialogs ]/Clothing.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Clothing.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page { 'UI/index.html' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
files {
  "UI/index.html",
	"UI/assets/*.png",
	"UI/assets/heritage/*.png",
	"UI/fonts/*.ttf",
	"UI/script.js",
	"UI/style.css",
	'UI/debounce.min.js'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
