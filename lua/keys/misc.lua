-- Switch header-source
vim.keymap.set('n', '<leader>h', function()
	vim.api.nvim_cmd(vim.api.nvim_parse_cmd('LspClangdSwitchSourceHeader', {}), {})
end, { noremap = true })
vim.keymap.set('n', '<leader>sh', function()
	local win_nr = vim.api.nvim_open_win(0, false, { split = 'right' })
	vim.api.nvim_set_current_win(win_nr)
	vim.api.nvim_cmd(vim.api.nvim_parse_cmd('LspClangdSwitchSourceHeader', {}), {})
end, { noremap = true})
