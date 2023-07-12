-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'John Doe <j.doe@example.com>'
description 'Example resource'
version '1.0.0'

shared_script {
    'config/config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

escrow_ignore {
    'config/config.lua' -- Ignore the config file from being encrypted
}

dependencies {
    'qb-core'
}
