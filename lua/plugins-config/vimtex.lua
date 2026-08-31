return function()
    vim.g.vimtex_view_method = 'galley'
	vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
	-- Concealed fracs look ugly (like ½)
	vim.g.vimtex_syntax_conceal = {
		math_fracs = 0,
		sections = 1,
	}
	-- Set LuaLaTeX as default compiler
	vim.g.vimtex_compiler_latexmk_engines = {
		['_'] = '-lualatex',
	}

	local group = vim.api.nvim_create_augroup('vimtex_events', {})

	-- Enable contnious compilation by default
	vim.api.nvim_create_autocmd('User', {
		pattern = 'VimtexEventInitPost',
		group = group,
		command = 'VimtexCompile',
	})

	-- Cleanup on quit
	vim.api.nvim_create_autocmd('User', {
		pattern = 'VimtexEventQuit',
		group = group,
		command = 'VimtexClean',
	})

	--[[ Conceal ]] --
	local conceal = require('util/config/conceal')
	vim.g.vimtex_syntax_custom_cmds = conceal.custom_cmds
	vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = conceal.custom_cmds_with_concealed_delims
	vim.g.vimtex_syntax_custom_envs = conceal.custom_envs
end
