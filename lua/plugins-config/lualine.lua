return {
	options = {
		theme = 'onedark',
	},

	-- Different behaviour for specific filetypes
	extensions = {
		'neo-tree',
	},

	-- [a b c    x y z]
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
}
