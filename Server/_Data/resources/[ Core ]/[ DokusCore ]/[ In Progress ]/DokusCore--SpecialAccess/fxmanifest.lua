--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
description 'A Teleport System for UnchainedRP'
author 'DevDokus -- http://DokusCore.com'
fx_version "adamant"
games {"rdr3"}
version '1.0.0'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
server_scripts { '[ Core ]/[ Server ]/*.*' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
client_scripts { '[ Core ]/[ Client ]/*.lua' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
shared_script { 'Config.lua', '[ Core ]/[ Shared ]/*.*' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ui_page "UI/Index.html"
files { 'UI/Index.html', 'UI/JS/*.*', 'UI/*.*' }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------