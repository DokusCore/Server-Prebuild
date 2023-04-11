-- fxmanifest.lua

game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'client/util-notify.js',
	'client/util-client.lua',
	'client/main-client.lua',
	'@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}

-- server_scripts {
-- 	'server/*.lua'
-- }

shared_scripts {
	'@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
}

-- ui_page ''

-- files {

-- }
