fx_version "adamant"
game "rdr3"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

server_script "server.lua"

client_scripts {
	"@uiprompt/uiprompt.lua",
	"config.lua",
	"client.lua"
}
