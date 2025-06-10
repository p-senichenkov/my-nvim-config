--[[ I suppose there will be a lot of LaTeX-related plugins ]] --

return {
	-- "I'm not an IDE" package that tries to handle *all* aspects of TeX
	{
		'lervag/vimtex',
		-- It's said that VimTeX has builtin lazy load
		lazy = false,
		init = require('plugins-config/vimtex')
	},

	-- Completion
	{
		'micangl/cmp-vimtex',
		ft = 'tex',
	}
}
