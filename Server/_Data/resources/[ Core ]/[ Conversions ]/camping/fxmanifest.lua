fx_version "adamant"

games { 'rdr3', 'gta5' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script {
	'warmenu.lua',
	'config.lua',
	'client.lua',
	'@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}

shared_scripts {
	'@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
}
