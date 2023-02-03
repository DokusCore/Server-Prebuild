--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore DoorLocks'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.0.1'
-- version '-----'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '@DokusCore/[ Core ]/[ Server ]/[ Utilities ]/Functions.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/DBTables.lua',
  '[ Core ]/[ Server ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
  '[ Core ]/[ Client ]/*.lua',
  '[ Core ]/[ Client ]/[ Events ]/*.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/DoorLocks.lua',
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
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/ro.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page 'UI/index.html'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
files {
    'UI/index.html',
    'UI/assets/js/*.*',
    'UI/assets/css/*.*',
    'UI/assets/img/*.*'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
