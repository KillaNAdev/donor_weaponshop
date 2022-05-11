fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'KillaNA'
description 'Donor Weapon Shop'
version '1.0.0'

client_scripts {
    '@menuv/menuv.lua',
    'client/*'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@mysql-async/async.lua',
'server/*'
}

dependencies {
    'menuv'
}