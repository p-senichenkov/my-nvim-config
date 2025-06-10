--[[ Interaction with system clipboard ]] --
require('keys/alias')
vim.g.mapleader = ' '

--[[ Copy ]] --
-- Normal-mode yank
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
-- Visual-mode yank
vm('<leader>y', '"+y')

--[[ Paste]] --
-- Normal-mode paste
nm('<leader>p', '"+p')
-- Normal-mode back-paste
nm('<leader>P', '"+P')
-- Visual-mode paste
vm('<leader>p', '"+p')
-- Visual-mode back-paste
vm('<leader>P', '"+P')

-- Maybe something else

--[[ Misc operations with clipboard ]] --
-- TODO: Idea: <leader>c{motion} -> c{motion}<C-R>0<Esc> -- replace {motion} with yanked text
-- see 'map-operator'
