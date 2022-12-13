--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------m
--------------------------------------------------------------------------------
description 'DokusCore Fix Stuck Vehicles (OneSync)'
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
  'Config.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/OneFix.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/Languinator.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/bg.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/de.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/dk.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/en.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/es.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/fr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/gr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/it.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/nl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/pl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/pt.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/ru.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/fi.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
