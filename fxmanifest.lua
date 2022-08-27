fx_version 'cerulean'
game 'gta5'

description 'vyz-shop'
author 'Vyznite'
version '1.0.0'

shared_script 'config.lua'

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua'
}
server_scripts {
    'server/main.lua'
}

lua54 'yes'