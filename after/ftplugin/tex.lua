--[[ Long lines ]] --
-- Wrap long lines at word break
vim.opt.wrap = true
vim.opt.linebreak = true
-- Don't highlight long lines
-- vim.api.nvim_set_hl(0, 'ColorColumn', { link = 'Normal' })

-- Spell check (ru_yo --- force using of ё)
vim.opt.spell = true
vim.opt.spelllang = { 'ru_yo', 'en' }

--[[ Mappings ]] --
-- Polyglossia russian emdash
vim.api.nvim_set_keymap('i', '\\-', ' "--- ', { noremap = true })
