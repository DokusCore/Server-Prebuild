fx_version "cerulean"
game('rdr3')
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

name "spooner"
author "kibukj"
description "Entity spawner for FiveM and RedM"
repository "https://github.com/kibook/spooner"

shared_scripts { "config.lua" }
server_scripts { "server.lua" }

client_scripts {
	"permissions.cfg",
	"@uiprompt/uiprompt.lua",
	"client.lua",
	"data/rdr3/animations.lua",
	"data/rdr3/bones.lua",
	"data/rdr3/objects.lua",
	"data/rdr3/pedConfigFlags.lua",
	"data/rdr3/peds.lua",
	"data/rdr3/pickups.lua",
	"data/rdr3/propsets.lua",
	"data/rdr3/scenarios.lua",
	"data/rdr3/vehicles.lua",
	"data/rdr3/walkstyles.lua",
	"data/rdr3/weapons.lua"
}

ui_page "ui/index.html"
files {
	"ui/chineserocks.ttf",
	"ui/rdr3.css",
	"ui/index.html",
	"ui/style.css",
	"ui/script.js",
	"ui/keyboard.ttf"
}
