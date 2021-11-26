--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Stores'
author 'http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.2.0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts { '[ Core ]/[ Client ]/*.lua', '@DokusCore/[ Core ]/[ System ]/[ Menu ]/DokusMenu.lua' }
server_scripts { '@mysql-async/lib/MySQL.lua', '[ Core ]/[ Server ]/*.lua' }
shared_script {
  '@DokusCore/[ Core ]/[ System ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Core ]/[ System ]/Languinator.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Stores.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/bg.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/de.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/dk.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/en.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/es.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/fr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/gr.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/it.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/nl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/pl.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/pt.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Language ]/ru.lua'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
