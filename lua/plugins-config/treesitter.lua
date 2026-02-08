require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'cpp',
		'yaml',
		'python',
		'comment',
	},

	auto_install = false,

	highlight = {
		enable = true,

		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	additional_vim_regex_highlighting = false,
}

-- @spell capture applies to all text that should be spell-checked.
-- Obviously, it shouldn't introduce some special color.
vim.api.nvim_set_hl(0, '@spell', {})
vim.api.nvim_set_hl(0, '@nospell', {})

vim.opt.spelllang = { 'en', 'ru_yo' }
-- Enable spellcheck in buffers that have parser installed
vim.api.nvim_create_autocmd('FileType', {
	callback = function ()
		local bufnr = vim.api.nvim_get_current_buf()
		local has_parser = pcall(vim.treesitter.get_parser, bufnr)
		vim.opt_local.spell = has_parser
	end
})
