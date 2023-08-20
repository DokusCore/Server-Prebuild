
fx_version "cerulean"

games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author "Modified to RedM from FiveM by Slerbamonsteri#5636, can't remember who made it in the firstplace, but it's old script for FiveM, all credits to Original author eitherway."

description "Allows player to look around with mouse movements when dead in RedM"

client_scripts {
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  'Config.lua',
  'cam.lua',
}

shared_script {
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
}