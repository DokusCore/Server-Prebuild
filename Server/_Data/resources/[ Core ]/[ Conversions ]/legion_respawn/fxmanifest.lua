fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	-- DOKUSCORE API
	'@DokusCore/[ Core ]/[ System ]/[ Client ]/CBSystem.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Natives.lua',
  '@DokusCore/[ Core ]/[ Client ]/[ Utilities ]/Functions.lua',
	-- 
	'config.lua',
	'client/cl_main.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	-- DOKUSCORE API
  '@DokusCore/[ Core ]/[ Server ]/[ Utilities ]/Functions.lua',
  '@DokusCore/[ Core ]/[ System ]/[ Shared ]/DBTables.lua',
	--
	'server/sv_main.lua',
}

shared_scripts {
	-- DOKUSCORE API
	'@DokusCore/[ Core ]/[ System ]/[ Shared ]/CBSystem.lua',
  '@DokusCore/[ Configs ]/[ Core ]/Core.lua',
}

files{
'html/map.jpg',
'html/map_shadow.jpg',
'html/map2.html',
'html/js/listener.js',
'html/js/jquery-func.js',
'html/js/jquery-1.4.1.min.js',
'html/js/jquery.jcarousel.pack.js'
}

ui_page 'html/map2.html'