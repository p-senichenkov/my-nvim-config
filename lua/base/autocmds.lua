-- [[ File info queries ]] --
local file_info_group = vim.api.nvim_create_augroup('FileInfo', { clear = true })

-- Buffer contains git conflict markers
vim.api.nvim_create_autocmd('BufReadPost', {
	group = file_info_group,
	callback = function()
		if vim.fn.search('<<<<<<<', 'nw') > 0 then
			vim.api.nvim_exec_autocmds('User', { pattern = 'CustomGitConflict' })
		end
	end,
})
