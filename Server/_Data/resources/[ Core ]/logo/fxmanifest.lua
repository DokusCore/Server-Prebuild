fx_version "adamant"

games { 'rdr3', 'gta5' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

ui_page 'ui/index.html'
files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/*.*',
  'ui/script.js'
}

client_script "client.lua"
