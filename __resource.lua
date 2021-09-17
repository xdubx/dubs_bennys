resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua', 
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua', 
	"@NativeUILua_Reloaded/src/NativeUIReloaded.lua",
	'locales/en.lua', 
	'config.lua', 
	'client/main.lua'
}
