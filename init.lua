require('base/autocmds')
require('base/search')
require('base/tabs')
require('base/other')
require('base/appearance')
require('base/commands')

require('keys/clipboard')
require('keys/misc')

require('plugins-config/lsp')

-- lazy -- package manager
require('config/lazy')

-- There is some strange error width IBL, that disappears after restart
vim.cmd('IBLEnable')
