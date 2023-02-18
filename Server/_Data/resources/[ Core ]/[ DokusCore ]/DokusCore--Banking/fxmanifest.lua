--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Banking System - http://DokusCore.com'
author 'DevDokus'
fx_version "adamant"
games {"rdr3"}
version '2.7.3'
-- version '-----' -- For Development
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts {
  '[ Core ]/[ Client ]/*.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/DokusMenu.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '[ Core ]/[ Server ]/*.lua',
  '@DokusCore/[ Core ]/[ Server ]/[ Utilities ]/Functions.lua',
}
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Modules.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Banking.lua',
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
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/[ Language ]/ro.lua',
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page "UI/hud.html"
--------------------------------------------------------------------------------
files {
  'UI/hud.html',
  'UI/data/css/style.css',
  'UI/data/fonts/AncientAd.ttf',
  'UI/data/fonts/Cherolina.ttf',
  'UI/data/fonts/HapnaSlabSerif-DemiBold.ttf',
  'UI/data/fonts/RDRCatalogueBold-Bold.ttf',
  'UI/data/fonts/RDRGothica-Regular.ttf',
  'UI/data/fonts/RDRLino-Regular.ttf',
  'UI/data/fonts/rdrlino-regular-webfont.woff',
  'UI/data/fonts/rdrlino-regular-webfont.woff2',
  'UI/data/fonts/Redemption.ttf',
  'UI/data/fonts/WWI.ttf',
  'UI/data/js/progressbar.js',
  'UI/data/js/progressbar.min.js',
  'UI/data/js/progressbar.min.js.map',
  'UI/data/background.png'
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
