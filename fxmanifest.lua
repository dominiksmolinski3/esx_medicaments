fx_version 'adamant'
game 'gta5'
description 'esx_medicaments'
version '1.0.1'
legacyversion '1.9.1'
lua54 'yes'

shared_scripts { 
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}
