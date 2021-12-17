--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'DokusCore Banking System - http://DokusCore.com'
author 'DevDokus'
fx_version "adamant"
games {"rdr3"}
version '2.3.2'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts { '[ Core ]/[ Client ]/*.lua', '@DokusCore/[ Core ]/[ System ]/[ Menu ]/DokusMenu.lua' }
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '[ Core ]/[ Server ]/*.lua' }
--------------------------------------------------------------------------------
shared_script {
  '@DokusCore/[ Core ]/[ System ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
  '@DokusCore/[ Core ]/[ System ]/Languinator.lua',
  '@DokusCore/[ Configs ]/[ Modules ]/Banking.lua',
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
